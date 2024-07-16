//
//  XDTextBtnView.m
//  文字按钮
//
//  Created by XD on 2019/6/10.
//  Copyright © 2019 XDTextBtnView. All rights reserved.
//

#import "XDTextBtnView.h"

@interface XDTextBtnView ()

@property (nonatomic, assign) CGFloat maxX;

@property (nonatomic, readwrite, assign) CGFloat maxY;

@property (nonatomic, assign) NSInteger lastIndex;

@property (nonatomic, strong) NSMutableArray <NSString *> *selectArr;

@end

@implementation XDTextBtnView

#define kAllBtnMaxWidth (self.bounds.size.width - self.marginX * 2)

static NSInteger const kXDTextBtnViewBtnTagPlus = 90000000;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.btnHeight = 30.0;
        self.marginX = 15.0;
        self.btnMarginX = 10.0;
        self.marginY = 15.0;
        self.textFontSize = 15.0;
        
        self.lastIndex = -1;
        self.isSingle = YES;
        
        self.selectArr = [NSMutableArray array];
    }
    return self;
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
}

- (void)setBtnHeight:(CGFloat)btnHeight
{
    _btnHeight = btnHeight;
}

- (void)setMarginX:(CGFloat)marginX
{
    _marginX = marginX;
}

- (void)setTextArr:(NSArray<NSString *> *)textArr
{
    _textArr = textArr;
    
    for (int i = 0; i < textArr.count; i ++) {
        
        UIButton *btn = [UIButton buttonWithType:0];
        
        NSString *text = textArr[i];
        
        CGFloat textWidth = [text boundingRectWithSize:CGSizeMake(kAllBtnMaxWidth, self.btnHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:self.textFontSize + 0.5 weight:UIFontWeightRegular]} context:nil].size.width;
        
        CGFloat btnWidth = textWidth + self.marginX * 2;
        
        CGFloat btnX = self.maxX + self.marginX;
        CGFloat btnY = self.maxY;
        
        if (btnX > kAllBtnMaxWidth - btnWidth) {
            btnX = self.marginX;
            btnY = btnY + self.marginY + self.btnHeight;
        }
        
        btn.frame = CGRectMake(btnX, btnY, btnWidth, self.btnHeight);
        
        [btn setTitle:text forState:UIControlStateNormal];
        
        if (self.borderWidth > 0 && self.borderColor) {
            btn.layer.borderWidth = self.borderWidth;
            btn.layer.borderColor = self.borderColor.CGColor;
        }
        
        if (self.cornerRadius > 0) {
            btn.layer.cornerRadius = self.cornerRadius;
        }
        
        [self unSelectBtn:btn];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:self.textFontSize];
        
        [self addSubview:btn];
        
        self.maxX = CGRectGetMaxX(btn.frame);
        self.maxY = CGRectGetMinY(btn.frame);
        
        btn.tag = kXDTextBtnViewBtnTagPlus + i;
        
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (textArr.count > 0) {
        self.maxY = self.maxY + self.btnHeight;
    }

}

- (void)setDefultIndexArr:(NSArray<NSString *> *)defultIndexArr
{
    _defultIndexArr = defultIndexArr;
    
    for (int i = 0; i < defultIndexArr.count; i ++) {
        
        if (i > defultIndexArr.count - 1) {
            break;
        }
        
        NSString *index = defultIndexArr[i];
        UIButton *btn = [self viewWithTag:index.integerValue + kXDTextBtnViewBtnTagPlus];
        [self btnAction:btn];
    }
}

- (void)btnAction:(UIButton *)btn
{
    NSInteger index = btn.tag - kXDTextBtnViewBtnTagPlus;
    
    if (self.isSingle) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(XDTextBtnViewClickIndex:lastClickIndex:)]) {
            [self.delegate XDTextBtnViewClickIndex:index lastClickIndex:self.lastIndex];
        }
        
        UIButton *lastBtn = [self viewWithTag:self.lastIndex + kXDTextBtnViewBtnTagPlus];
        [self unSelectBtn:lastBtn];
        
        [self selectBtn:btn];
        
        self.lastIndex = index;
    } else {
        
        NSString *indexStr = [NSString stringWithFormat:@"%ld", index];
        
        if (self.selectArr.count == 0) {
            [self.selectArr addObject:indexStr];
            [self selectBtn:btn];
        } else if ([self.selectArr containsObject:indexStr]) {
            //包含 移除
            [self.selectArr removeObject:indexStr];
            [self unSelectBtn:btn];
        } else {
            //不包含 添加
            [self.selectArr addObject:indexStr];
            [self selectBtn:btn];
        }
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(XDTextBtnViewSelectIndexes:)]) {
            [self.delegate XDTextBtnViewSelectIndexes:self.selectArr];
        }
        
    }
    
}

- (void)selectBtn:(UIButton *)btn
{
    if (self.selectBackgroundColor) {
        btn.backgroundColor = self.selectBackgroundColor;
    }
    if (self.selectTextColor) {
        [btn setTitleColor:self.selectTextColor forState:UIControlStateNormal];
    }
}

- (void)unSelectBtn:(UIButton *)btn
{
    if (self.backgroundColor) {
        btn.backgroundColor = self.backgroundColor;
    }
    if (self.textColor) {
        [btn setTitleColor:self.textColor forState:UIControlStateNormal];
    }
}

@end
