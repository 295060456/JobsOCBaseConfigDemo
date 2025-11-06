//
//  TDNetImageCellNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "NSObject+image.h"
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN
/// Network Image Cell (ASNetworkImageNode) + Round
@interface TDNetImageCellNode : ASCellNode

Prop_strong() ASNetworkImageNode *netImage;
Prop_strong() ASTextNode *title;

-(instancetype)initWithURL:(NSURL *)url text:(NSString *)text ;

@end

NS_ASSUME_NONNULL_END
