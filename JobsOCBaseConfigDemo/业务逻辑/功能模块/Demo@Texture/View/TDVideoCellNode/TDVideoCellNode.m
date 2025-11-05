//
//  TDVideoCellNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import "TDVideoCellNode.h"

@interface TDVideoCellNode ()
@property (nonatomic, strong) NSURL *pendingURL; // 仅在 didLoad 再喂给 video
@end

@implementation TDVideoCellNode

- (instancetype)initWithURL:(NSURL *)url title:(NSString *)title {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        _pendingURL = url; // 先存起来（init 可能在后台线程）

        _video = [[ASVideoNode alloc] init];
        _video.shouldAutoplay   = NO;
        _video.shouldAutorepeat = NO;
        _video.gravity          = AVLayerVideoGravityResizeAspectFill;
        _video.placeholderColor = UIColor.secondarySystemFillColor;
        _video.backgroundColor  = UIColor.blackColor;
        _video.cornerRadius     = 8;
        _video.clipsToBounds    = YES;
        _video.style.preferredSize = CGSizeMake(0, 200);

        _title = [[ASTextNode alloc] init];
        _title.attributedText = [[NSAttributedString alloc] initWithString:title
                                                                attributes:@{
            NSFontAttributeName: [UIFont systemFontOfSize:13 weight:UIFontWeightMedium],
            NSForegroundColorAttributeName: UIColor.secondaryLabelColor
        }];
    }
    return self;
}

// 保证在主线程设置 assetURL
- (void)didLoad {
    [super didLoad];
    if (self.pendingURL) {
        self.video.assetURL = self.pendingURL; // ✅ 现在在主线程，安全
    }
}

- (void)didEnterVisibleState {
    [super didEnterVisibleState];
    self.video.muted = YES; // 这里在主线程回调
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASStackLayoutSpec *v = [ASStackLayoutSpec verticalStackLayoutSpec];
    v.spacing  = 8;
    v.children = @[_video, _title];
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(8, 16, 8, 16)
                                                  child:v];
}

@end
