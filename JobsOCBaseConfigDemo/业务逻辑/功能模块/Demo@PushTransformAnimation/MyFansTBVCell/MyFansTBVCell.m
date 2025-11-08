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
#pragma mark —— UITableViewCellProtocol
+(JobsRetTableViewCellByTableViewBlock _Nonnull)cellStyleValue1WithTableView{
    return ^(UITableView * _Nonnull tableView) {
        MyFansTBVCell *cell = JobsRegisterDequeueTableViewDefaultCell(MyFansTBVCell);
        cell.offsetXForEach = 10;
        cell.offsetYForEach = 20;
        /// 加阴影立体效果
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
        return cell;
    };
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)setFrame:(CGRect)frame{
    JobsLog(@"self.offsetXForEach = %f",self.offsetXForEach);
    JobsLog(@"self.offsetYForEach = %f",self.offsetYForEach);

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
+(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(238);
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(id _Nullable model) {
        @jobs_strongify(self)
        self.imgView
                .imageURL(@" ".jobsUrl)
                .placeholderImage(toStringByInt([model intValue]).add(@".jpeg").img)
                .options(self.makeSDWebImageOptions)
                .completed(^(UIImage * _Nullable image,
                             NSError * _Nullable error,
                             SDImageCacheType cacheType,
                             NSURL * _Nullable imageURL) {
                    if (error) {
                        JobsLog(@"aa图片加载失败: %@-%@", error,imageURL);
                    } else {
                        JobsLog(@"图片加载成功");
                    }
                }).load();
        return self;
    };
}
#pragma mark —— lazyLoad
-(UIImageView *)imgView{
    if (!_imgView) {
        @jobs_weakify(self)
        _imgView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.clipsToBounds = YES;
            imageView.layer.cornerRadius = 20;
            [self.contentView.addSubview(imageView) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.contentView);
            }];
        });
    }return _imgView;
}

@end
