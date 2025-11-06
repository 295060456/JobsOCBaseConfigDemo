//
//  TDImageCellNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN
/// Local Image Cell (ASImageNode) + Corner/Background/Overlay
@interface TDImageCellNode : ASCellNode

Prop_strong() ASImageNode *image;
Prop_strong() ASTextNode *badge;

-(instancetype)initWithImage:(UIImage *)img title:(NSString *)title ;

@end

NS_ASSUME_NONNULL_END
