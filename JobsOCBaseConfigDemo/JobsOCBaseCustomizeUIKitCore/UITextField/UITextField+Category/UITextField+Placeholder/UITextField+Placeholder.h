//
//  UITextField+Placeholder.h
//  Casino
//
//  Created by Jobs on 2021/12/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Placeholder)

@property(nonatomic,strong)UIColor *placeholderColor;
@property(nonatomic,strong)UIFont *placeholderFont;
@property(nonatomic,strong)NSMutableArray <JobsRichTextConfig *>*defaultAttributedDataForPlaceHolderMutArr;

-(UILabel *)placeholderLabel;

@end

NS_ASSUME_NONNULL_END
