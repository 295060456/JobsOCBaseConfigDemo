//
//  UITextModel.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/17.
//

#import <Foundation/Foundation.h>
#import "UITextModelProtocol.h"
#import "UIViewModelOthersProtocol.h"

#define TextModelDataString @"主文字默认占位内容"
/// 数据归位
#define MakeDataNull \
if ([self.viewModel.textModel.text isEqualToString:JobsInternationalization(TextModelDataString)]) {\
    self.viewModel.textModel.text = @"";\
}\
if ([self.viewModel.subTextModel.text isEqualToString:JobsInternationalization(TextModelDataString)]) {\
    self.viewModel.subTextModel.text = @"";\
}\

NS_ASSUME_NONNULL_BEGIN

@interface UITextModel : NSObject
<
UITextModelProtocol
,UILocationProtocol
,UIViewModelOthersProtocol
>

@end

NS_ASSUME_NONNULL_END
