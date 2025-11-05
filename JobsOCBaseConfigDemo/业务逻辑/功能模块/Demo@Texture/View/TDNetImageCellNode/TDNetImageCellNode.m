//
//  TDNetImageCellNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import "TDNetImageCellNode.h"

@implementation TDNetImageCellNode
- (instancetype)initWithURL:(NSURL *)url text:(NSString *)text {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;

        _netImage = [[ASNetworkImageNode alloc] init];
        _netImage.URL = url;
        _netImage.defaultImage = [UIImage systemImageNamed:@"photo"];
        _netImage.placeholderFadeDuration = 0.25;
        _netImage.contentMode = UIViewContentModeScaleAspectFill;
        _netImage.cornerRadius = 8;
        _netImage.clipsToBounds = YES;

        _title = [[ASTextNode alloc] init];
        _title.attributedText = [[NSAttributedString alloc] initWithString:text
                                                                attributes:@{
            NSFontAttributeName: [UIFont systemFontOfSize:13 weight:UIFontWeightMedium],
            NSForegroundColorAttributeName: UIColor.secondaryLabelColor
        }];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    _netImage.style.preferredSize = CGSizeMake(constrainedSize.max.width - 32, 160);
    ASStackLayoutSpec *v = [ASStackLayoutSpec verticalStackLayoutSpec];
    v.spacing = 8;
    v.children = @[_netImage, _title];
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(8, 16, 8, 16) child:v];
}

@end
