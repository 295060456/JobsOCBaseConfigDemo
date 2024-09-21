//
//  EmptyView.m
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/7/31.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "EmptyView.h"

@implementation EmptyView

+(instancetype)diyEmptyViewWithTitle:(NSString *_Nullable)title{
    if (isNull(title)) title = JobsInternationalization(@"No Data");
    return [EmptyView emptyViewWithImageStr:JobsInternationalization(@"暂无数据")
                                   titleStr:title
                                  detailStr:JobsInternationalization(@"")];
}

+(instancetype)diyEmptyActionViewWithTarget:(id)target action:(SEL)action{
    return [EmptyView emptyActionViewWithImageStr:@"noNetwork"
                                         titleStr:JobsInternationalization(@"无网络连接")
                                        detailStr:JobsInternationalization(@"请检查你的网络连接是否正确!")
                                      btnTitleStr:JobsInternationalization(@"重新加载")
                                           target:target
                                           action:action];
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    self.autoShowEmptyView = NO; //如果想要DemoEmptyView的效果都不是自动显隐的，这里统一设置为NO，初始化时就不必再一一去写了
    self.titleLabFont = UIFontWeightRegularSize(JobsWidth(18));
    
    UILabel *label = self.valueForKey(@"titleLabel");
    UIColor *cor = [UIColor gradientCorDataMutArr:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        data.add(RGB_COLOR(247, 131, 97));
        data.add(RGB_COLOR(245, 75, 100));
    })
                                       startPoint:CGPointZero
                                         endPoint:CGPointZero
                                           opaque:NO
                                   targetViewRect:label.frame];
    
    self.titleLabTextColor = cor;
}

-(void)prepare{
    [super prepare];
}

@end
