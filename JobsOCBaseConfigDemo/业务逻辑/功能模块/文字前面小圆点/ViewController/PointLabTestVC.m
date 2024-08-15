//
//  PointLabTestVC.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/15/24.
//

#import "PointLabTestVC.h"

@interface PointLabTestVC ()
/// UI
@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)UILabel *label2;
/// Data
@property(nonatomic,strong)NSMutableAttributedString *attributedString;
@property(nonatomic,strong)NSMutableAttributedString *attributedString2;
@property(nonatomic,strong)NSMutableParagraphStyle *paragraphStyle;
@property(nonatomic,strong)NSTextAttachment *bulletAttachment;
@property(nonatomic,copy)NSString *dot;

@end

@implementation PointLabTestVC

- (void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:self];
    NSLog(@"%@",JobsLocalFunc);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label.alpha = 1;
    self.label2.alpha = 1;
}
#pragma mark —— lazyLoad
-(UILabel *)label{
    if(!_label){
        _label = UILabel.new;
        _label.attributedText = self.attributedString;
        _label.numberOfLines = 0;
        [self.view addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(200);
            make.center.equalTo(self.view);
        }];
        _label.makeLabelByShowingType(UILabelShowingType_05);
        [self.view addSubview:_label];
    }return _label;
}

-(UILabel *)label2{
    if(!_label2){
        _label2 = UILabel.new;
        _label2.attributedText = self.attributedString2;
        _label2.numberOfLines = 0;
        [self.view addSubview:_label2];
        [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(200);
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.label.mas_bottom);
        }];
        _label2.makeLabelByShowingType(UILabelShowingType_05);
        [self.view addSubview:_label2];
    }return _label2;
}

-(NSMutableAttributedString *)attributedString{
    if(!_attributedString){
        _attributedString = NSMutableAttributedString.new;
        _attributedString.add(JobsAttributedString(self.dot
                                                       .add(@"我是中国人我是中国人我是中国人我是中国人我是中国人我是中国人")
                                                       .add(@"\n")));
                                                       
        _attributedString.add(JobsAttributedString(self.dot
                                                       .add(@"你是日本人你是日本人你是日本人你是日本人你是日本人你是日本人")
                                                       .add(@"\n")));

        /// 设置段落
        [_attributedString addAttribute:NSParagraphStyleAttributeName
                                  value:self.paragraphStyle
                                  range:NSMakeRange(0, self.attributedString.length)];
        /// 设置小圆点的颜色
        [_attributedString addAttribute:NSForegroundColorAttributeName
                                  value:JobsRedColor
                                  range:NSMakeRange(0, 1)]; // 第一个圆点
        [_attributedString addAttribute:NSForegroundColorAttributeName
                                  value:JobsYellowColor
                                  range:NSMakeRange(@"我是中国人我是中国人我是中国人我是中国人我是中国人我是中国人".add(@"\n").length + 1, 1)]; // 第二个圆点
        
    }return _attributedString;
}


-(NSString *)dot{
    if(!_dot){
        _dot = @"\u2022";// @"⚫";
    }return _dot;
}

-(NSMutableParagraphStyle *)paragraphStyle{
    if(!_paragraphStyle){
        _paragraphStyle = NSMutableParagraphStyle.new;
        _paragraphStyle.headIndent = 10; // 设置文本的缩进，使其与圆点对齐
        _paragraphStyle.firstLineHeadIndent = 0; // 第一行不缩进
    }return _paragraphStyle;
}

-(NSTextAttachment *)bulletAttachment{
    if(!_bulletAttachment){
        _bulletAttachment = NSTextAttachment.new;
        _bulletAttachment.bounds = CGRectMake(0, 0, 10, 10); // 设置圆点的大小和位置
        
        UIGraphicsBeginImageContextWithOptions(_bulletAttachment.bounds.size, NO, 0);
        [JobsRedColor setFill];// 设置圆点的颜色
        [[UIBezierPath bezierPathWithOvalInRect:_bulletAttachment.bounds] fill];
        _bulletAttachment.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
    }return _bulletAttachment;
}

-(NSMutableAttributedString *)attributedString2{
    if(!_attributedString2){
        _attributedString2 = JobsMutAttributedStringByTextAttachment(self.bulletAttachment);
        _attributedString2.add(JobsAttributedString(@"今天是一个好日子"))
                          .add(JobsAttributedString(@"明天同样是一个好日子"));
        [_attributedString2 addAttribute:NSParagraphStyleAttributeName
                                   value:self.paragraphStyle
                                   range:NSMakeRange(0, _attributedString2.length)];
    }return _attributedString2;
}

@end
