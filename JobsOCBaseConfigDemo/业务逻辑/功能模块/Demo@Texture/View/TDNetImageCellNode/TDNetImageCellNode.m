//
//  TDNetImageCellNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import "TDNetImageCellNode.h"

@implementation TDNetImageCellNode

-(instancetype)initWithURL:(NSURL *)url text:(NSString *)text {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.netImage.URL = url;
        self.title = jobsMakeTextNode(^(ASTextNode * _Nullable node) {
            node.attributedText = [[NSAttributedString alloc] initWithString:text
                                                                  attributes:@{
              NSFontAttributeName: [UIFont systemFontOfSize:13 weight:UIFontWeightMedium],
              NSForegroundColorAttributeName: UIColor.secondaryLabelColor
            }];
        });
    }return self;
}

-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    _netImage.style.preferredSize = CGSizeMake(constrainedSize.max.width - 32, 160);
    @jobs_weakify(self)
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(8, 16, 8, 16) child:jobsMakeVerticalStackLayoutSpec(^(ASStackLayoutSpec * _Nullable v) {
        @jobs_strongify(self)
        v.spacing = 8;
        v.children = @[self.netImage, self.title];
    })];
}
#pragma mark —— lazyLoad
-(ASNetworkImageNode *)netImage{
    if(!_netImage){
        _netImage = jobsMakeNetworkImageNode(^(ASNetworkImageNode * _Nullable node) {
            node.defaultImage = @"photo".sys_img;
            node.placeholderFadeDuration = 0.25;
            node.contentMode = UIViewContentModeScaleAspectFill;
            node.cornerRadius = 8;
            node.clipsToBounds = YES;
        });
    }return _netImage;
}

@end
