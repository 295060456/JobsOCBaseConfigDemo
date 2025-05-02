//
//  PDFDocument+Extra.h
//  FMNormal
//
//  Created by Jobs on 2025/5/2.
//

#import <PDFKit/PDFKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface PDFDocument (Extra)

+(JobsReturnPDFDocumentByURLBlock _Nonnull)byURL;

@end

NS_ASSUME_NONNULL_END
