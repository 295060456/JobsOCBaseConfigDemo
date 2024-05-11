//
//  MSCommentTBVCell.m
//  MataShop
//
//  Created by Jobs Hi on 10/2/23.
//

#import "MSCommentTBVCell.h"

@interface MSCommentTBVCell ()
/// UI
@property(nonatomic,strong)UILabel *titileLab;
/// Data
@property(nonatomic,strong)MSCommentDetailModel *commentDetailModel;

@end

@implementation MSCommentTBVCell
#pragma mark —— @synthesize UITableViewCellProtocol
UITableViewCellProtocol_synthesize
#pragma mark —— @synthesize UIViewModelProtocol
UIViewModelProtocol_synthesize
#pragma mark —— BaseCellProtocol
/// UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView{
    MSCommentTBVCell *cell = (MSCommentTBVCell *)[tableView tableViewCellClass:MSCommentTBVCell.class];
    if (!cell) {
        cell = [MSCommentTBVCell initTableViewCellWithStyle:UITableViewCellStyleDefault];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = cell.contentView.backgroundColor = JobsWhiteColor;
        /**
         ❤️如果单独的对每一个row对应的UITableViewCell的边距有缩进则使用下列方法❤️
         如果这个TableViewCell是JobsBaseTableViewCell则不需要复写-(void)setFrame:(CGRect)frame；否则是需要：
         
         UILocationProtocol_synthesize
         直接影响:
         cell.offsetXForEach = JobsWidth(8);
         cell.offsetYForEach = JobsWidth(6);
         
         // 在具体的子类去实现,分类调用异常
         #pragma mark —— 复写父类方法
         -(void)setFrame:(CGRect)frame{
         NSLog(@"self.offsetXForEach = %f",self.offsetXForEach);
         NSLog(@"self.offsetYForEach = %f",self.offsetYForEach);
         frame.origin.x += self.offsetXForEach;
         frame.origin.y += self.offsetYForEach;
         frame.size.height -= self.offsetYForEach * 2;
         frame.size.width -= self.offsetXForEach * 2;
         [super setFrame:frame];
         }
         
         ❤️ 如果对每一section的cell进行缩进，则在外层协议：❤️
         - (void)tableView:(UITableView *)tableView
         willDisplayCell:(UITableViewCell *)cell
         forRowAtIndexPath:(NSIndexPath *)indexPath{
         
         [UITableViewCell tableView:tableView
         makeSectionFirstAndLastCell:cell
         atIndexPath:indexPath
         cellBgCor:UIColor.whiteColor
         bottomLineCor:UIColor.whiteColor
         cellOutLineCor:HEXCOLOR(0xEEE2C8)
         roundCorner:JobsWidth(8)
         borderWidth:JobsWidth(1)
         dx:JobsWidth(0)
         dy:0];
         }
         */
        cell.offsetXForEach = JobsWidth(7);
        cell.offsetYForEach = JobsWidth(3);
        [cell cornerCutToCircleWithCornerRadius:JobsWidth(8)];
    }return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(MSCommentDetailModel *_Nullable)model{
    if([model isKindOfClass:MSCommentDetailModel.class]){
        self.commentDetailModel = model;
        self.titileLab.alpha = 1;
    }
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)cellHeightWithModel:(MSCommentDetailModel *_Nullable)model{
    return 3 * [self jobsGetLabelHeightByWidth:JobsWidth(355)
                                         title:model.rowTitle
                                          font:UIFontWeightRegularSize(14)];
}
// 在具体的子类去实现,分类调用异常
-(void)setFrame:(CGRect)frame{
    NSLog(@"self.offsetXForEach = %f",self.offsetXForEach);
    NSLog(@"self.offsetYForEach = %f",self.offsetYForEach);
    frame.origin.x += self.offsetXForEach;
    frame.origin.y += self.offsetYForEach;
    frame.size.height -= self.offsetYForEach * 2;
    frame.size.width -= self.offsetXForEach * 2;
    [super setFrame:frame];
}
#pragma mark —— lazyLoad
-(UILabel *)titileLab{
    if(!_titileLab){
        _titileLab = UILabel.new;
        _titileLab.textColor = JobsCor(@"#666666");
        _titileLab.backgroundColor = JobsCor(@"#F7F7F7");
        _titileLab.font = UIFontWeightRegularSize(14);
        [self.contentView addSubview:_titileLab];
        [_titileLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(JobsWidth(5), JobsWidth(25), JobsWidth(5), JobsWidth(25)));
        }];
        [_titileLab cornerCutToCircleWithCornerRadius:JobsWidth(8)];
    }
    _titileLab.text = self.commentDetailModel.rowTitle;
    return _titileLab;
}

@end
