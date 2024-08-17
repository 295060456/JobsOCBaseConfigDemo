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
@property(nonatomic,strong)NSString *usernameStr;
@property(nonatomic,strong)NSString *contentStr;
@property(nonatomic,strong)NSString *timeStr;
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

+(CGFloat)cellHeightWithModel:(id _Nullable)model{
    return 50;
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
#pragma mark - 长按手势事件
- (void)cellLongPress:(UIGestureRecognizer *)recognizer{
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        NSLog(@"长按手势做什么");
    }
}
#pragma mark —— lazyLoad
-(UILabel *)timeLab{
    if (!_timeLab) {
        _timeLab = UILabel.new;
        _timeLab.text = self.timeStr;
        _timeLab.textColor = JobsLightGrayColor;
        _timeLab.font = [UIFont systemFontOfSize:12
                                          weight:UIFontWeightRegular];
        [_timeLab sizeToFit];
        [self.contentView addSubview:_timeLab];
        [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(5);
            make.right.equalTo(self.contentView).offset(-5);
        }];
    }return _timeLab;
}

-(UILongPressGestureRecognizer *)longPG{
    if (!_longPG) {
        _longPG = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                action:@selector(cellLongPress:)];
        [self addGestureRecognizer:_longPG];
    }return _longPG;
}

-(NSMutableArray<MGSwipeButtonModel *> *)leftBtnMutArr{
    if (!_leftBtnMutArr) {
        _leftBtnMutArr = NSMutableArray.array;
        MGSwipeButtonModel *model_1 = MGSwipeButtonModel.new;
        model_1.titleStr = @"L1";
        model_1.IconIMG = JobsIMG(@"Check");
        model_1.bgCor = JobsGreenColor;
        
        MGSwipeButtonModel *model_2 = MGSwipeButtonModel.new;
        model_2.titleStr = @"L2";
        model_2.IconIMG = JobsIMG(@"Fav");
        model_2.bgCor = RGBA_COLOR(0, 0x99, 0xcc, 1);
        
        MGSwipeButtonModel *model_3 = MGSwipeButtonModel.new;
        model_3.titleStr = @"L3";
        model_3.IconIMG = JobsIMG(@"Menu");
        model_3.bgCor = RGBA_COLOR(0.59, 0.29, 0.08, 1);
        
        [_leftBtnMutArr addObject:model_1];
        [_leftBtnMutArr addObject:model_2];
        [_leftBtnMutArr addObject:model_3];
        
    }return _leftBtnMutArr;
}

-(NSMutableArray<MGSwipeButtonModel *> *)rightBtnMutArr{
    if (!_rightBtnMutArr) {
        _rightBtnMutArr = NSMutableArray.array;
        
        MGSwipeButtonModel *model_1 = MGSwipeButtonModel.new;
        model_1.titleStr = @"R1";
        model_1.IconIMG = JobsIMG(@"Class");
        model_1.bgCor = JobsPurpleColor;
        
        MGSwipeButtonModel *model_2 = MGSwipeButtonModel.new;
        model_2.titleStr = @"R2";
        model_2.IconIMG = JobsIMG(@"Drop");
        model_2.bgCor = JobsDarkTextColor;
        
        MGSwipeButtonModel *model_3 = MGSwipeButtonModel.new;
        model_3.titleStr = @"R3";
        model_3.IconIMG = JobsIMG(@"Header");
        model_3.bgCor = JobsCyanColor;
        
        [_rightBtnMutArr addObject:model_1];
        [_rightBtnMutArr addObject:model_2];
        [_rightBtnMutArr addObject:model_3];
        
    }return _rightBtnMutArr;
}
    
@end
