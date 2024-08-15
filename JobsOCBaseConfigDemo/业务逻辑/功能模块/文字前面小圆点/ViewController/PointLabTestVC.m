//
//  PointLabTestVC.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/15/24.
//

#import "PointLabTestVC.h"

@interface PointLabTestVC ()

@property(nonatomic,strong)UILabel *label;

@property(nonatomic,strong)NSMutableAttributedString *attributedString;
@property(nonatomic,strong)NSMutableParagraphStyle *paragraphStyle;

@property(nonatomic,copy)NSString *dot;

@end

@implementation PointLabTestVC

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

-(NSMutableAttributedString *)attributedString{
    if(!_attributedString){
        _attributedString = NSMutableAttributedString.new;
        _attributedString.add(JobsAttributedString(self.dot
                                                       .add(@"我是中国人")
                                                       .add(@"\n")));
                                                       
        _attributedString.add(JobsAttributedString(self.dot
                                                       .add(@"你是日本人")
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
                                  range:NSMakeRange(@"我是中国人".add(@"\n").length + 1, 1)]; // 第二个圆点
        
    }return _attributedString;
}

-(NSString *)dot{
    if(!_dot){
        _dot = @"\u2022";
    }return _dot;
}

-(NSMutableParagraphStyle *)paragraphStyle{
    if(!_paragraphStyle){
        _paragraphStyle = NSMutableParagraphStyle.new;
        _paragraphStyle.headIndent = 18; // 设置文本的缩进，使其与圆点对齐
        _paragraphStyle.firstLineHeadIndent = 0; // 第一行不缩进
    }return _paragraphStyle;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.label.alpha = 1;
    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
//    label.numberOfLines = 0;
//
//    // 创建带有圆点的富文本
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
//
//    // 第一行文本
//    NSString *firstLine = @"\u2022 Your deposit will be successfully credited to your wallet once the transaction completed.\n";
//    NSAttributedString *firstLineText = [[NSAttributedString alloc] initWithString:firstLine];
//    [attributedString appendAttributedString:firstLineText];
//
//    // 第二行文本
//    NSString *secondLine = @"\u2022 In case you meet any problem in deposit, please contact our CS.";
//    NSAttributedString *secondLineText = [[NSAttributedString alloc] initWithString:secondLine];
//    [attributedString appendAttributedString:secondLineText];
//
//    // 设置段落样式，使文本对齐
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    paragraphStyle.headIndent = 18; // 设置文本的缩进，使其与圆点对齐
//    paragraphStyle.firstLineHeadIndent = 0; // 第一行不缩进
//    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedString.length)];
//
//    // 设置小圆点的颜色
//    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)]; // 第一个圆点
//    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(firstLine.length, 1)]; // 第二个圆点
//
//    // 将富文本设置到 UILabel
//    label.attributedText = attributedString;
//    [label sizeToFit];
//    [self.view addSubview:label];
    
}


@end
