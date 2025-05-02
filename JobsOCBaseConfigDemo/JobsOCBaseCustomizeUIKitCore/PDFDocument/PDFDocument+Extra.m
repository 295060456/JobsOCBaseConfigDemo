//
//  PDFDocument+Extra.m
//  FMNormal
//
//  Created by Jobs on 2025/5/2.
//

#import "PDFDocument+Extra.h"

@implementation PDFDocument (Extra)

+(JobsReturnPDFDocumentByURLBlock _Nonnull)byURL{
    return ^ __kindof PDFDocument *_Nullable(NSURL *_Nullable pdfURL){
        return [PDFDocument.alloc initWithURL:pdfURL];
    };
}

@end
