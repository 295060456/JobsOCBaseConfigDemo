//
//  CutomView.m
//  CoreTextLearning
//
//  Created by alan comb on 2021/4/2.
//

#import "CutomView.h"
#import <CoreText/CoreText.h>

static CGFloat ascentCallback(void* ref){
    return [(NSNumber*)[(__bridge NSDictionary*)ref valueForKey:@"height"] floatValue];
}

static CGFloat descentCallback(void* ref){
    return 0;
}

static CGFloat widthCallback(void* ref){
    return [(NSNumber*)[(__bridge NSDictionary*)ref valueForKey:@"width"] floatValue];
}

@implementation CutomView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext(); //获取当前绘制上下文
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);  //设置字形的变换矩阵为不做图形变换
    CGContextTranslateCTM(context, 0, self.bounds.size.height); //平移方法，将画布向上平移一个屏幕高
    CGContextScaleCTM(context, 1,-1); //缩放方法，x轴缩放系数为1，则不变，y轴缩放系数为-1，则相当于以x轴为轴旋转180度
    NSMutableAttributedString * attributeStr = [[NSMutableAttributedString alloc] initWithString:@"\n这里在测试图文混排，\n我是一个富文本"];
    CTRunDelegateCallbacks callbacks;//创建一个回调结构体，设置相关参数
    memset(&callbacks, 0, sizeof(CTRunDelegateCallbacks));
    callbacks.version = kCTRunDelegateVersion1; //一般都用这个版本
    callbacks.getAscent = ascentCallback;//设置图片顶部距离基线的距离
    callbacks.getDescent = descentCallback;//设置图片底部距离基线的距离
    callbacks.getWidth = widthCallback;//设置图片宽度
    
    NSDictionary * dicPic = @{@"height":@100,@"width":@180};//创建一个图片尺寸的字典，初始化代理对象需要
    CTRunDelegateRef delegate = CTRunDelegateCreate(&callbacks, (__bridge void*)dicPic); //创建代理
    unichar placeHolder = 0xFFFC;
    NSString* placeHolderStr = [NSString stringWithCharacters:&placeHolder length:1]; //已空白字符生成字符串
    NSMutableAttributedString* attrPlaceHolderStr = [[NSMutableAttributedString alloc] initWithString:placeHolderStr]; //用字符串初始化占位符的富文本
    CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attrPlaceHolderStr, CFRangeMake(0, 1), kCTRunDelegateAttributeName, delegate);//给字符串中的范围中字符串设置代理
    CFRelease(delegate);//释放（__bridge进行C与OC数据类型的转换，C为非ARC，需要手动管理）
    [attributeStr insertAttributedString:attrPlaceHolderStr atIndex:12];//将占位符插入原富文本
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributeStr);//一个frame的工厂，负责生成frame
    CGMutablePathRef path = CGPathCreateMutable(); //创建绘制区域
    CGPathAddRect(path, NULL, self.bounds);//添加绘制尺寸
    NSInteger lenght = attributeStr.length;
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, lenght), path, NULL);////工厂根据绘制区域及富文本（可选范围，多次设置）设置frame
    CTFrameDraw(frame, context);//工厂根据绘制区域及富文本（可选范围，多次设置）设置frame
    
    UIImage* image = [UIImage imageNamed:@"predict_list_header_bg"];
    CGRect imgFrame = [self calculateImageRectWithFrame:frame];
    CGContextDrawImage(context, imgFrame, image.CGImage);
    CFRelease(frame);
    CFRelease(path);
    CFRelease(frameSetter);
}

- (CGRect)calculateImageRectWithFrame:(CTFrameRef)frame{
    NSArray* lines = (NSArray*)CTFrameGetLines(frame); //根据frame获取需要绘制的线的数组
    NSInteger count = lines.count;//获取线的数量
    CGPoint points[count];//建立起点的数组（cgpoint类型为结构体，故用C语言的数组）
    CTFrameGetLineOrigins(frame, CFRangeMake(0, 0), points);//获取起点
    for (int i = 0; i < count; ++i) {
        CTLineRef line = (__bridge CTLineRef)lines[i];
        NSArray* glyphRuns = (NSArray*)CTLineGetGlyphRuns(line);//获取GlyphRun数组（GlyphRun：高效的字符绘制方案）
        for (int j = 0; j < glyphRuns.count; j++) {//遍历CTRun数组
            CTRunRef run = (__bridge CTRunRef)glyphRuns[j];//获取CTRun
            NSDictionary* attributes = (NSDictionary*)CTRunGetAttributes(run); //获取CTRun中的属性
            CTRunDelegateRef delegate = (__bridge CTRunDelegateRef)[attributes valueForKey:(id)kCTRunDelegateAttributeName];    //获取属性中的代理
            if (!delegate) continue;
            
            NSDictionary* dic = (NSDictionary*)CTRunDelegateGetRefCon(delegate);  //获取代理中的字典
            if (![dic isKindOfClass:[NSDictionary class]]) continue;
            
            CGPoint point = points[i]; //获取一个起点
            CGFloat ascent; //获取上距
            CGFloat descent;//获取下距
            CGRect boundsRun; //创建一个frame
            boundsRun.size.width = CTRunGetTypographicBounds(run, CFRangeMake(0, 0), &ascent, &descent, NULL);
            boundsRun.size.height = ascent + descent;
            CGFloat xOffset = CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location, NULL);//获取x偏移量
            boundsRun.origin.x = point.x + xOffset;
            boundsRun.origin.y = point.y - descent;
            CGPathRef path = CTFrameGetPath(frame);//获取绘制区域
            CGRect colRect = CGPathGetBoundingBox(path);//获取剪裁区域边框
            CGRect imageBounds = CGRectOffset(boundsRun, colRect.origin.x, colRect.origin.y);
            return imageBounds;
        }
    }
    return CGRectZero;
}

@end
