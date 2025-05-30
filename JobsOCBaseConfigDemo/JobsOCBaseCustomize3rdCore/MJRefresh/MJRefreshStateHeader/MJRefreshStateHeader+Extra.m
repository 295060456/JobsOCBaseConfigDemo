//
//  MJRefreshStateHeader+Extra.m
//  FMNormal
//
//  Created by Jobs on 2025/5/30.
//

#import "MJRefreshStateHeader+Extra.h"

@implementation MJRefreshStateHeader (Extra)

-(JobsReturnMJRefreshStateHeaderByRefreshConfigModelBlock _Nonnull)byMJRefreshHeaderConfigModel{
    @jobs_weakify(self)
    return ^__kindof MJRefreshStateHeader *_Nullable(MJRefreshConfigModel *_Nullable config){
        @jobs_strongify(self)
        self.handleWord(config);/// 文字
        self.stateLabel
            .byFont(config.font)// 设置字体
            .byTextCor(config.textColor);// 设置颜色
        /// 根据拖拽比例自动切换透明度
        self.automaticallyChangeAlpha = config.automaticallyChangeAlpha;
        /// 震动特效反馈
        if (config.isShake) NSObject.feedbackGenerator(nil);
        return self;
    };
}

@end
