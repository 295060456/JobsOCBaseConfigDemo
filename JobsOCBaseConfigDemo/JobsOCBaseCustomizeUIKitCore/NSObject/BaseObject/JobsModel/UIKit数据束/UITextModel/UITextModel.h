//
//  UITextModel.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/17.
//

#import <Foundation/Foundation.h>
#import "UITextModelProtocol.h"
#import "UIViewModelOthersProtocol.h"
#import "UILocationProtocol.h"
#import "JobsBlock.h"

#define TextModelDataString @"主文字默认占位内容"
/// 数据归位
#define MakeDataNull \
if ([self.viewModel.textModel.text isEqualToString:JobsInternationalization(TextModelDataString)]) {\
    self.viewModel.textModel.text = JobsInternationalization(@"");\
}\
if ([self.viewModel.subTextModel.text isEqualToString:JobsInternationalization(TextModelDataString)]) {\
    self.viewModel.subTextModel.text = JobsInternationalization(@"");\
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

NS_INLINE __kindof UITextModel *_Nonnull jobsMakeTextModel(jobsByTextModelBlock _Nonnull block){
    UITextModel *data = UITextModel.alloc.init;
    if (block) block(data);
    return data;
}
