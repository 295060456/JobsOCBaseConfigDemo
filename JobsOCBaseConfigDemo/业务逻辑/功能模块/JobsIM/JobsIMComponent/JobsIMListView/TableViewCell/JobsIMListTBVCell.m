//
//  JobsIMListTBVCell.m
//  JobsIM
//
//  Created by Jobs on 2020/11/17.
//

#import "JobsIMListTBVCell.h"

@interface JobsIMListTBVCell ()

@property(nonatomic,strong)UILabel *timeLab;
@property(nonatomic,strong)UILongPressGestureRecognizer *longPG;

@property(nonatomic,strong)NSMutableArray <MGSwipeButtonModel *>*leftBtnMutArr;
@property(nonatomic,strong)NSMutableArray <MGSwipeButtonModel *>*rightBtnMutArr;
@property(nonatomic,copy)NSString *usernameStr;
@property(nonatomic,copy)NSString *contentStr;
@property(nonatomic,copy)NSString *timeStr;
@property(nonatomic,strong)UIImage *userHeaderIMG;

@end

@implementation JobsIMListTBVCell

+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleValue1WithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsIMListTBVCell *cell = (JobsIMListTBVCell *)tableView.tableViewCellClass(JobsIMListTBVCell.class,@"");
        if (!cell) {
            cell = JobsIMListTBVCell.initTableViewCellWithStyle(UITableViewCellStyleSubtitle);
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.contentView.backgroundColor = JobsWhiteColor;
            cell.backgroundColor = JobsWhiteColor;
        }return cell;
    };
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        self.longPG.enabled = YES;
        self.swipeBackgroundColor = JobsClearColor;
        self.selectedBackgroundView = UIView.new;
        self.selectedBackgroundView.backgroundColor = [JobsYellowColor colorWithAlphaComponent:0.3];
        self.leftSwipeSettings.transition = MGSwipeTransitionBorder;
        self.rightSwipeSettings.transition = MGSwipeTransitionDrag;
        self.leftExpansion.buttonIndex = 0;
        self.leftExpansion.fillOnTrigger = NO;
        self.rightExpansion.buttonIndex = 0;
        self.rightExpansion.fillOnTrigger = YES;
        self.leftButtons = [self createLeftButtons];
        self.rightButtons = [self createRightButtons];
    }return self;
}

+(JobsReturnCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(50);
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        if ([model isKindOfClass:JobsIMListDataModel.class]) {
            JobsIMListDataModel *listDataModel = (JobsIMListDataModel *)model;
            
            self.usernameStr = listDataModel.usernameStr;
            self.contentStr = listDataModel.contentStr;
            self.userHeaderIMG = listDataModel.userHeaderIMG;
            self.timeStr = listDataModel.timeStr;
        }else{
            self.usernameStr = @"数据异常";
            self.contentStr = @"数据异常";
            self.userHeaderIMG = nil;
            self.timeStr = @"数据异常";
        }
        
        self.textLabel.text = self.usernameStr;
        self.detailTextLabel.text = self.contentStr;
        self.detailTextLabel.textColor = JobsLightGrayColor;
        self.imageView.image = self.userHeaderIMG;
        self.timeLab.alpha = 1;
    };
}

-(NSArray *)createLeftButtons{
    NSMutableArray * result = NSMutableArray.array;
    for (MGSwipeButtonModel *model in self.leftBtnMutArr) {
        MGSwipeButton * button = [MGSwipeButton buttonWithTitle:model.titleStr
                                                           icon:model.IconIMG
                                                backgroundColor:model.bgCor
                                                        padding:15
                                                       callback:^BOOL(MGSwipeTableCell * sender){
            NSLog(@"Convenience callback received (left).");
            return YES;
        }];
        [result addObject:button];
    }return result;
}

-(NSArray *)createRightButtons{
    NSMutableArray * result = NSMutableArray.array;
    for (MGSwipeButtonModel *model in self.rightBtnMutArr) {
        MGSwipeButton * button = [MGSwipeButton buttonWithTitle:model.titleStr
                                                           icon:model.IconIMG
                                                backgroundColor:model.bgCor
                                                        padding:15
                                                       callback:^BOOL(MGSwipeTableCell * sender){
            NSLog(@"Convenience callback received (left).");
            return YES;
        }];
        [result addObject:button];
    }return result;
}

- (BOOL)canBecomeFirstResponder{
    return YES;
}
#pragma mark —— lazyLoad
-(UILabel *)timeLab{
    if (!_timeLab) {
        _timeLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.text = self.timeStr;
            label.textColor = JobsLightGrayColor;
            label.font = UIFontWeightRegularSize(JobsWidth(12));
            [label sizeToFit];
            self.contentView.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.contentView).offset(5);
                make.right.equalTo(self.contentView).offset(-5);
            }];
        });
    }return _timeLab;
}

-(UILongPressGestureRecognizer *)longPG{
    if (!_longPG) {
        _longPG = [jobsMakeLongPressGesture(^(UILongPressGestureRecognizer * _Nullable gesture) {
            /// 这里写手势的配置
        }) GestureActionBy:^(__kindof UIGestureRecognizer * _Nullable gesture) {
            /// 这里写手势的触发
            if (gesture.state == UIGestureRecognizerStateBegan) {
                NSLog(@"长按手势做什么");
            }
        }];self.addGesture(_longPG);
    }return _longPG;
}

-(NSMutableArray<MGSwipeButtonModel *> *)leftBtnMutArr{
    if (!_leftBtnMutArr) {
        _leftBtnMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
            arr.add(jobsMakeMGSwipeButtonModel(^(__kindof MGSwipeButtonModel * _Nullable model) {
                model.titleStr = @"L1";
                model.IconIMG = JobsIMG(@"Check");
                model.bgCor = JobsGreenColor;
            }));
            arr.add(jobsMakeMGSwipeButtonModel(^(__kindof MGSwipeButtonModel * _Nullable model) {
                model.titleStr = @"L2";
                model.IconIMG = JobsIMG(@"Fav");
                model.bgCor = RGBA_COLOR(0, 0x99, 0xcc, 1);
            }));
            arr.add(jobsMakeMGSwipeButtonModel(^(__kindof MGSwipeButtonModel * _Nullable model) {
                model.titleStr = @"L3";
                model.IconIMG = JobsIMG(@"Menu");
                model.bgCor = RGBA_COLOR(0.59, 0.29, 0.08, 1);
            }));
        });
    }return _leftBtnMutArr;
}

-(NSMutableArray<MGSwipeButtonModel *> *)rightBtnMutArr{
    if (!_rightBtnMutArr) {
        _rightBtnMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
            arr.add(jobsMakeMGSwipeButtonModel(^(__kindof MGSwipeButtonModel * _Nullable model) {
                model.titleStr = @"Class";
                model.IconIMG = JobsIMG(@"Check");
                model.bgCor = JobsPurpleColor;
            }));
            arr.add(jobsMakeMGSwipeButtonModel(^(__kindof MGSwipeButtonModel * _Nullable model) {
                model.titleStr = @"R2";
                model.IconIMG = JobsIMG(@"Drop");
                model.bgCor = JobsDarkTextColor;
            }));
            arr.add(jobsMakeMGSwipeButtonModel(^(__kindof MGSwipeButtonModel * _Nullable model) {
                model.titleStr = @"R3";
                model.IconIMG = JobsIMG(@"Header");
                model.bgCor = JobsCyanColor;
            }));
        });
    }return _rightBtnMutArr;
}
    
@end
