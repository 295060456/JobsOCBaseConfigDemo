//
//  TDVideoCellNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import "TDVideoCellNode.h"

@interface TDVideoCellNode ()

Prop_strong() NSURL *pendingURL; // 仅在 didLoad 再喂给 video

@end

@implementation TDVideoCellNode

-(instancetype)initWithURL:(NSURL *)url title:(NSString *)title {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        self.video.shouldAutoplay = NO;
        _pendingURL = url; // 先存起来（init 可能在后台线程）
        _title = jobsMakeTextNode(^(ASTextNode * _Nullable node) {
            node.attributedText = [[NSAttributedString alloc] initWithString:title
                                                                  attributes:@{
                NSFontAttributeName: [UIFont systemFontOfSize:13 weight:UIFontWeightMedium],
                NSForegroundColorAttributeName: UIColor.secondaryLabelColor
            }];
        });
    }return self;
}
/// 保证在主线程设置 assetURL
-(void)didLoad {
    [super didLoad];
    if (self.pendingURL) {
        self.video.assetURL = self.pendingURL; // ✅ 现在在主线程，安全
    }
}

-(void)didEnterVisibleState {
    [super didEnterVisibleState];
    self.video.muted = YES; // 这里在主线程回调
}

-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    @jobs_weakify(self)
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(8, 16, 8, 16) child:jobsMakeVerticalStackLayoutSpec(^(ASStackLayoutSpec * _Nullable v) {
        @jobs_strongify(self)
        v.bySpacing(8).byChildren(@[self.video, self.title]);
    })];
}
#pragma mark —— lazyLoad
-(ASVideoNode *)video{
    if(!_video){
        _video = jobsMakeVideoNode(^(ASVideoNode * _Nullable node) {
            node.shouldAutoplay   = NO;
            node.shouldAutorepeat = NO;
            node.gravity          = AVLayerVideoGravityResizeAspectFill;
            node.placeholderColor = UIColor.secondarySystemFillColor;
            node.backgroundColor  = UIColor.blackColor;
            node.cornerRadius     = 8;
            node.clipsToBounds    = YES;
            node.style.preferredSize = CGSizeMake(0, 200);
        });
    }return _video;
}

@end
