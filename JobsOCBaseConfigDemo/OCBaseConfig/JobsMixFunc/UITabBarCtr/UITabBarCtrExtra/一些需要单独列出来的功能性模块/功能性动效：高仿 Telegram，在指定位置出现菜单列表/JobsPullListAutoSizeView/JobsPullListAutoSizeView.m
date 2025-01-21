//
//  JobsPullListAutoSizeView.m
//  TabbarItemLottie
//
//  Created by Jobs on 2020/10/15.
//

#import "JobsPullListAutoSizeView.h"

@interface JobsPullListAutoSizeView ()
/// UI
//@property(nonatomic,strong)UITableView *tableView;//content
@property(nonatomic,strong)UIView *targetView;
/// Data
@property(nonatomic,copy)NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation JobsPullListAutoSizeView

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

+ (instancetype)initWithTargetView:(UIView *__nonnull)targetView
                        dataMutArr:(NSArray <UIViewModel *>*__nonnull)dataMutArr{
    /// 先检查MainWindow里面是否存在本类，如果存在即释放 保证只创建一次
    JobsPullListAutoSizeView *(^checkMainWindowExistSelf)(void) = ^(void){
        JobsPullListAutoSizeView *jobsPullListAutoSizeView = nil;
        for (UIView *subview in MainWindow.subviews) {
            if ([subview isKindOfClass:JobsPullListAutoSizeView.class]) {
                jobsPullListAutoSizeView = (JobsPullListAutoSizeView *)subview;
            }
        }return jobsPullListAutoSizeView;
    };
    
    JobsPullListAutoSizeView *view = checkMainWindowExistSelf();
    if (view) {
        [view removeFromSuperview];//释放
    }else{
        view = [JobsPullListAutoSizeView.alloc initWithTargetView:targetView
                                                       dataMutArr:dataMutArr];
    }return view;
}

- (instancetype)initWithTargetView:(UIView *__nonnull)targetView
                        dataMutArr:(NSArray <UIViewModel *>*__nonnull)dataMutArr{
    if (self = [super init]) {
        self.targetView = targetView;
        self.dataMutArr = (NSMutableArray *)dataMutArr;
        [self makeUI];
    }return self;
}

-(void)makeUI{
    self.backgroundColor = JobsGrayColor;
    self.alpha = 0.7;
    [MainWindow addSubview:self];
    self.frame = MainWindow.frame;
    [MainWindow bringSubviewToFront:self];
    self.tableView.reloadDatas();
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self removeFromSuperview];//释放
}
#pragma mark —————————— UITableViewDelegate,UITableViewDataSource ——————————
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.listTbVCellHeight;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

-(NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsPullListTBVCell *cell = JobsPullListTBVCell.cellStyleDefaultWithTableView(tableView);
    cell.contentView.backgroundColor = self.bgColorListTBV;
    cell.indexPath = indexPath;
    cell.jobsRichElementsCellBy(self.dataMutArr[indexPath.row]);
    return cell;
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.new;
        _tableView.scrollEnabled = NO;
        _tableView.cornerCutToCircleWithCornerRadius(JobsWidth(3));//圆润
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self addSubview:_tableView];
        
        CGRect d = [self.targetView convertRect:self.targetView.bounds toView:MainWindow];
        CGFloat tableviewHeight = self.listTbVCellHeight * self.dataMutArr.count;
        CGFloat tableviewY = d.origin.y - tableviewHeight - self.listTbVOffset;

        //做了适配
        _tableView.frame = CGRectMake(
                                      self.targetView.centerX + self.listTbVWidth < UIScreen.mainScreen.bounds.size.width ? self.targetView.centerX : self.targetView.centerX - self.listTbVWidth,
                                      tableviewY < 0 ? tableviewY += tableviewHeight : tableviewY,
                                      self.listTbVWidth,//相对固定
                                      tableviewHeight//相对固定
                                      );
    }return _tableView;
}

-(CGFloat)listTbVWidth{
    if (_listTbVWidth == 0) {
        _listTbVWidth = JobsWidth(100);
    }return _listTbVWidth;
}

-(CGFloat)listTbVCellHeight{
    if (_listTbVCellHeight == 0) {
        _listTbVCellHeight = JobsWidth(50);
    }return _listTbVCellHeight;
}

-(CGFloat)listTbVOffset{
    if (_listTbVOffset == 0) {
        _listTbVOffset = JobsWidth(10);
    }return _listTbVOffset;
}

-(UIColor *)bgColorListTBV{
    if (!_bgColorListTBV) {
        _bgColorListTBV = [UIColor whiteColor];
    }return _bgColorListTBV;
}

@end
