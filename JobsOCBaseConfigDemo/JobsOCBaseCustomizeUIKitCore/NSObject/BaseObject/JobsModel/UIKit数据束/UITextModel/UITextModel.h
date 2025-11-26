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
#import "BaseModel.h"

#ifndef TextModelDataString
#define TextModelDataString 主标题文字默认占位内容.tr
#endif /* TextModelDataString */

#ifndef TextModelDataString2
#define TextModelDataString2 副标题文字默认占位内容.tr
#endif /* TextModelDataString2 */
/// 数据归位
#ifndef MakeDataNull // 如果未定义 MakeDataNull
#define MakeDataNull \
if ([self.viewModel.textModel.text isEqualToString:TextModelDataString.tr]) {\
    self.viewModel.textModel.text = @"".tr;\
}\
if ([self.viewModel.subTextModel.text isEqualToString:TextModelDataString.tr]) {\
    self.viewModel.subTextModel.text = @"".tr;\
}
#endif /* MakeDataNull */

NS_ASSUME_NONNULL_BEGIN

@interface UITextModel : BaseModel
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
