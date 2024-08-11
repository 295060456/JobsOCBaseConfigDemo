//
//  MyFansTBVCell.m
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/7/3.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "MyFansTBVCell.h"

@interface MyFansTBVCell ()

@end

@implementation MyFansTBVCell

+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleValue1WithTableView{
    return ^(UITableView * _Nonnull tableView) {
        MyFansTBVCell *cell = (MyFansTBVCell *)tableView.tableViewCellClass(MyFansTBVCell.class,@"");
        if (!cell) {
            cell = MyFansTBVCell.initTableViewCellWithStyle(UITableViewCellStyleDefault);
            cell.offsetXForEach = 10;
            cell.offsetYForEach = 20;
            //加阴影立体效果
            [UIView makeTargetShadowview:cell
                               superView:nil
                         shadowDirection:ShadowDirection_rightDown
                       shadowWithOffsetX:5
                                 offsetY:5
                            cornerRadius:8
                            shadowOffset:JobsDefaultSize
                           shadowOpacity:1
                        layerShadowColor:JobsDefaultObj
                       layerShadowRadius:JobsDefaultValue];
        }return cell;
    };
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)setFrame:(CGRect)frame{
    NSLog(@"self.offsetXForEach = %f",self.offsetXForEach);
    NSLog(@"self.offsetYForEach = %f",self.offsetYForEach);

    if (!frame.origin.x) {
        frame.origin.x += self.offsetXForEach;
        frame.size.width -= self.offsetXForEach * 2;
    }
    
    if (!frame.origin.y) {
        frame.origin.y += self.offsetYForEach;
        frame.size.height -= self.offsetYForEach * 2;
    }
    
    [super setFrame:frame];
}
#pragma mark —— BaseCellProtocol
+(CGFloat)cellHeightWithModel:(id _Nullable)model{
    return 238;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)richElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        [self.imgView sd_setImageWithURL:@" ".jobsUrl
                        placeholderImage:JobsIMG(toStringByInt([model intValue]).add(@".jpeg"))];
    };
}
#pragma mark —— lazyLoad
-(UIImageView *)imgView{
    if (!_imgView) {
        _imgView = UIImageView.new;
        _imgView.clipsToBounds = YES;
        _imgView.layer.cornerRadius = 20;
        [self.contentView addSubview:_imgView];
        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _imgView;
}

@end
