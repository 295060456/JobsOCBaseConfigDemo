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
@property(nonatomic,strong)NSMutableArray<NSString *> *items;
@property(nonatomic,copy)NSString *dot;

@end

@implementation PointLabTestVC

- (void)dealloc{
    JobsNotificationCenter.remove(self);
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
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.backgroundColor = JobsRandomColor;
            label.attributedText = self.attributedString;
            label.numberOfLines = 0;
            self.view.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(200);
                make.center.equalTo(self.view);
            }];label.makeLabelByShowingType(UILabelShowingType_05);
        });
    }return _label;
}

-(UILabel *)label2{
    if(!_label2){
        @jobs_weakify(self)
        _label2 = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.backgroundColor = JobsRandomColor;
            label.attributedText = self.attributedString2;
            label.numberOfLines = 0;
            self.view.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(200);
                make.centerX.equalTo(self.view);
                make.top.equalTo(self.label.mas_bottom);
            }];label.makeLabelByShowingType(UILabelShowingType_05);
        });
    }return _label2;
}

-(NSString *)dot{
    if(!_dot){
        _dot = @"\u2022";// @"⚫";
    }return _dot;
}

-(NSMutableAttributedString *)attributedString{
    if(!_attributedString){
        _attributedString = jobsMakeMutableAttributedString(^(__kindof NSMutableAttributedString *_Nullable data) {
            data.add(JobsAttributedString(self.dot
                                          .add(@"我是中国人我是中国人我是中国人我是中国人我是中国人我是中国人")
                                          .add(@"\n")));
                                                           
            data.add(JobsAttributedString(self.dot
                                          .add(@"你是日本人你是日本人你是日本人你是日本人你是日本人你是日本人")
                                          .add(@"\n")));
            /// 设置段落
            data.addAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
                data.value = jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable data1) {
                    data1.headIndent = 10; // 设置文本的缩进，使其与圆点对齐
                    data1.firstLineHeadIndent = 0; // 第一行不缩进
                });
                data.range = NSMakeRange(0, self.attributedString.length);
            }));
            /// 设置小圆点的颜色
            data.addForegroundColorAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data1) {
                data1.value = JobsRedColor;
                data1.range = NSMakeRange(0, 1);// 第一个圆点
            }));
            data.addForegroundColorAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data1) {
                data1.value = JobsYellowColor;
                data1.range = NSMakeRange(@"我是中国人我是中国人我是中国人我是中国人我是中国人我是中国人".add(@"\n").length + 1, 1);// 第二个圆点
            }));
            /// 设置文本颜色
            data.addForegroundColorAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data1) {
                data1.value = JobsCor(@"#D0D0D0");
                data1.range = NSMakeRange(1, data.length - 1);
            }));
            data.addFontAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data1) {
                data1.value = UIFontWeightRegularSize(JobsWidth(12));
                data1.range = NSMakeRange(0, data.length);
            }));
        });
    }return _attributedString;
}

-(NSMutableAttributedString *)attributedString2{
    if(!_attributedString2){
        @jobs_weakify(self)
        _attributedString2 = JobsMutAttributedString(@"");
        // 通过循环来创建每一行的富文本
        for (NSString *item in self.items) {
            // 添加小圆点
            _attributedString2.add(JobsAttributedStringByTextAttachment(jobsMakeTextAttachment(^(NSTextAttachment * _Nullable data) {
                data.bounds = CGRectMake(0, 0, 10, 10); // 设置圆点的大小和位置
                
                UIGraphicsBeginImageContextWithOptions(data.bounds.size, NO, 0);
                [JobsRedColor setFill];// 设置圆点的颜色
                [[UIBezierPath bezierPathWithOvalInRect:data.bounds] fill];
                data.image = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
            })));
            // 添加空格后再添加文本
            _attributedString2.add(JobsAttributedString(@" "));
            // 添加对应的文本
            NSMutableAttributedString *text = JobsMutAttributedString(item);
            text.addFontAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
                data.value = UIFontWeightRegularSize(JobsWidth(12));
                data.range = NSMakeRange(0, text.length);
            }));
            text.addForegroundColorAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
                data.value = JobsCor(@"#D0D0D0");
                data.range = NSMakeRange(0, text.length);
            }));
            _attributedString2.add(text);
            // 添加换行符
            _attributedString2.add(JobsAttributedString(@"\n"));
        }
        _attributedString2.addAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data1) {
            @jobs_strongify(self)
            data1.value = jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable data) {
                data.headIndent = 10; // 设置文本的缩进，使其与圆点对齐
                data.firstLineHeadIndent = 0; // 第一行不缩进
            });
            data1.range = NSMakeRange(0, self->_attributedString2.length);
        }));
    }return _attributedString2;
}

-(NSMutableArray<NSString *> *)items{
    if(!_items){
        _items = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(@"Your deposit will be successfully credited to your wallet once the transaction completed.");
            data.add(@"In case you meet any problem in deposit, please contact our CS.");
            data.add(@"Additional information can be found on our website.");
        });
    }return _items;
}

@end
