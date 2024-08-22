//
//  PointLabTestVC.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/15/24.
//

#import "PointLabTestVC.h"

@interface PointLabTestVC ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
/// UI
@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)UILabel *label2;
/// Data
@property(nonatomic,strong)NSMutableAttributedString *attributedString;
@property(nonatomic,strong)NSMutableAttributedString *attributedString2;
@property(nonatomic,strong)NSMutableParagraphStyle *paragraphStyle;
@property(nonatomic,strong)NSTextAttachment *bulletAttachment;
@property(nonatomic,strong)NSMutableArray<NSString *> *items;
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

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.invokeSysCamera();
}
#pragma mark —— lazyLoad
-(UILabel *)label{
    if(!_label){
        _label = UILabel.new;
        _label.backgroundColor = JobsRandomColor;
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
        _label2.backgroundColor = JobsRandomColor;
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
        /// 设置文本颜色
        [_attributedString addAttribute:NSForegroundColorAttributeName
                                  value:JobsCor(@"#D0D0D0")
                                  range:NSMakeRange(1, _attributedString.length - 1)];
        /// 设置字体
        [_attributedString addAttribute:NSFontAttributeName
                                  value:UIFontWeightRegularSize(JobsWidth(12))
                                  range:NSMakeRange(0, _attributedString.length)];
    }return _attributedString;
}

-(NSMutableAttributedString *)attributedString2{
    if(!_attributedString2){
        _attributedString2 = JobsMutAttributedString(@"");
        // 通过循环来创建每一行的富文本
        for (NSString *item in self.items) {
            // 添加小圆点
            NSAttributedString *bulletPoint = JobsAttributedStringByTextAttachment(self.bulletAttachment);
            _attributedString2.add(bulletPoint);
            // 添加空格后再添加文本
            NSAttributedString *space = JobsAttributedString(@" ");
            _attributedString2.add(space);
            // 添加对应的文本
            NSMutableAttributedString *text = JobsMutAttributedString(item);
            [text addAttribute:NSFontAttributeName
                         value:UIFontWeightRegularSize(JobsWidth(12))
                         range:NSMakeRange(0, text.length)];
            [text addAttribute:NSForegroundColorAttributeName
                         value:JobsCor(@"#D0D0D0")
                         range:NSMakeRange(0, text.length)];
            _attributedString2.add(text);
            // 添加换行符
            NSAttributedString *newline = JobsAttributedString(@"\n");
            _attributedString2.add(newline);
        }
        [_attributedString2 addAttribute:NSParagraphStyleAttributeName
                                   value:self.paragraphStyle
                                   range:NSMakeRange(0, _attributedString2.length)];
    }return _attributedString2;
}

-(NSMutableArray<NSString *> *)items{
    if(!_items){
        _items = NSMutableArray.array;
        _items.add(@"Your deposit will be successfully credited to your wallet once the transaction completed.");
        _items.add(@"In case you meet any problem in deposit, please contact our CS.");
        _items.add(@"Additional information can be found on our website.");
    }return _items;
}

@end
