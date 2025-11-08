//
//  SocketRocketUtility.m
//  SUN
//
//  Created by 孙俊 on 17/2/16.
//  Copyright © 2017年 SUN. All rights reserved.
//

#import "SocketRocketUtility.h"

@interface SocketRocketUtility(){
    NSTimeInterval reConnectTime;
}

Prop_strong()SRWebSocket *socket;
Prop_copy()NSString *urlString;

@end

@implementation SocketRocketUtility
BaseProtocol_synthesize
RACProtocol_synthesize
- (void)dealloc {
    JobsRemoveNotification(self);
}

+(SocketRocketUtility *)instance {
    static SocketRocketUtility *Instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        Instance = SocketRocketUtility.new;
    });return Instance;
}
#pragma mark —— 一些公共方法
/// 开始连接
-(jobsByStrBlock _Nonnull)SRWebSocketOpenWithURLString{
    @jobs_weakify(self)
    return ^(__kindof NSString *_Nullable urlString){
        @jobs_strongify(self)
        if (self.socket) return;/// 如果是同一个url return
        if (!urlString) return;
        self.urlString = urlString;
        self.socket = SRWebSocket.initByURLRequest(NSURLRequest.initBy(urlString.jobsUrl));
        JobsLog(@"请求的websocket地址：%@",self.socket.url.absoluteString);
        self.socket.delegate = self;/// SRWebSocketDelegate 协议
        [self.socket open];/// 开始连接
    };
}
/// 关闭连接
- (void)SRWebSocketClose {
    if (self.socket){
        [self.socket close];
        self.socket = nil;
        //断开连接时销毁心跳
        [self destoryHeartBeat];
    }
}
/// 发送数据
-(jobsByIDBlock _Nonnull)sendData{
    @jobs_weakify(self)
    return ^(id _Nullable data){
        @jobs_strongify(self)
        JobsLog(@"socketSendData --------------- %@",data);
        @jobs_weakify(self)
        dispatch_queue_t queue =  dispatch_queue_create("zy", NULL);
        dispatch_async(queue, ^{
            @jobs_strongify(self)
            if (self.socket) {
                // 只有 SR_OPEN 开启状态才能调 send 方法啊，不然要崩
                if (self.socket.readyState == SR_OPEN) {
                    [self.socket send:data];    // 发送数据
                } else if (self.socket.readyState == SR_CONNECTING) {
                    JobsLog(@"正在连接中，重连后其他方法会去自动同步数据");
                    // 每隔2秒检测一次 socket.readyState 状态，检测 10 次左右
                    // 只要有一次状态是 SR_OPEN 的就调用 [ws.socket send:data] 发送数据
                    // 如果 10 次都还是没连上的，那这个发送请求就丢失了，这种情况是服务器的问题了，小概率的
                    // 代码有点长，我就写个逻辑在这里好了
                    [self reConnect];
                } else if (self.socket.readyState == SR_CLOSING || self.socket.readyState == SR_CLOSED) {
                    // websocket 断开了，调用 reConnect 方法重连
                    JobsLog(@"重连");
                    [self reConnect];
                }
            } else {
                JobsLog(@"没网络，发送失败，一旦断网 socket 会被我设置 nil 的");
                JobsLog(@"其实最好是发送前判断一下网络状态比较好，我写的有点晦涩，socket==nil来表示断网");
            }
        });
    };
}
#pragma mark —— 一些私有方法
/// 重连机制：超过一分钟就不再重连 所以只会重连5次 2^5 = 64
- (void)reConnect {
    [self SRWebSocketClose];
    if (reConnectTime > 64) return;/// 您的网络状况不是很好，请检查网络后重试
    @jobs_weakify(self)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(reConnectTime * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
        @jobs_strongify(self)
        self->_socket = nil;
        self.SRWebSocketOpenWithURLString(self.urlString);
        JobsLog(@"重连");
    });
    /// 重连时间2的指数级增长
    if(reConnectTime){
        reConnectTime *= 2;
    }else reConnectTime = 2;
}
/// 取消心跳
-(void)destoryHeartBeat{
    @jobs_weakify(self)
    dispatch_main_async_safe(^{
        @jobs_strongify(self)
        self.stopRACTimer(self.racDisposable);
    })
}
/// 初始化心跳
-(void)initHeartBeat{
    @jobs_weakify(self)
    dispatch_main_async_safe(^{
        @jobs_strongify(self)
        [self destoryHeartBeat];
        /// 发送心跳 和后台可以约定发送什么内容  一般可以调用ping  我这里根据后台的要求 发送了data给他
        /// 心跳设置为3分钟，NAT超时一般为5分钟
        self.racDisposable = [self startRACTimer:3 byBlock:^{
            @jobs_strongify(self)
            /// 和服务端约定好发送什么作为心跳标识，尽可能的减小心跳包大小
            self.sendData(@"heart");
        }].racDisposable;
    })
}
/// pingPong
-(void)ping{
    if (self.socket.readyState == SR_OPEN) [self.socket sendPing:nil error:nil];
}
#pragma mark —— SRWebSocketDelegate
-(void)webSocketDidOpen:(SRWebSocket *)webSocket{
    reConnectTime = 0;/// 每次正常连接的时候清零重连时间
    [self initHeartBeat];/// 开启心跳
    if (webSocket == self.socket) {
        JobsLog(@"************************** socket 连接成功************************** ");
        JobsPostNotification(kWebSocketDidOpenNote, nil);
    }
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error {
    if (webSocket == self.socket) {
        JobsLog(@"************************** socket 连接失败************************** ");
        _socket = nil;
        [self reConnect];/// 连接失败就重连
    }
}

- (void)webSocket:(SRWebSocket *)webSocket
 didCloseWithCode:(NSInteger)code
           reason:(NSString *)reason
         wasClean:(BOOL)wasClean {
    if (webSocket == self.socket) {
        JobsLog(@"************************** socket连接断开************************** ");
        JobsLog(@"被关闭连接，code:%ld,reason:%@,wasClean:%d",(long)code,reason,wasClean);
        [self SRWebSocketClose];
        JobsPostNotification(kWebSocketDidCloseNote,nil);
    }
}
/*
 该函数是接收服务器发送的pong消息，其中最后一个是接受pong消息的，
 在这里就要提一下心跳包，一般情况下建立长连接都会建立一个心跳包，
 用于每隔一段时间通知一次服务端，客户端还是在线，这个心跳包其实就是一个ping消息，
 我的理解就是建立一个定时器，每隔十秒或者十五秒向服务端发送一个ping消息，这个消息可是是空的
 */
- (void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload {
    NSString *reply = NSString.initByUTF8Data(pongPayload);;
    JobsLog(@"reply===%@",reply);
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message{
    if (webSocket == self.socket) {
        JobsLog(@"************************** socket收到数据了************************** ");
        JobsLog(@"我这后台约定的 message 是 json 格式数据收到数据，就按格式解析吧，然后把数据发给调用层");
        JobsLog(@"message:%@",message);
        JobsPostNotification(kWebSocketdidReceiveMessageNote,message);
    }
}
#pragma mark —— setter getter
- (SRReadyState)socketReadyState {
    return self.socket.readyState;
}

@end
