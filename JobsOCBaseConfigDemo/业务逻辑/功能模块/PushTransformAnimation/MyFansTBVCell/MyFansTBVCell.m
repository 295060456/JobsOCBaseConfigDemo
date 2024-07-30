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

+(instancetype)cellStyleValue1WithTableView:(UITableView *)tableView{
    MyFansTBVCell *cell = (MyFansTBVCell *)tableView.tableViewCellClass(MyFansTBVCell.class,@"");
    if (!cell) {
        cell = [MyFansTBVCell initTableViewCellWithStyle:UITableViewCellStyleDefault];
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

- (void)richElementsInCellWithModel:(id _Nullable)model{
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:@" "]
                    placeholderImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpeg",[model intValue]]]];
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
