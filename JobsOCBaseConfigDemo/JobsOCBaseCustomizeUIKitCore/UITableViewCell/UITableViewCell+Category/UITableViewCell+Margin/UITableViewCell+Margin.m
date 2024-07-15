//
//  UITableViewCell+Margin.m
//  JobsIM
//
//  Created by Jobs on 2020/11/13.
//

#import "UITableViewCell+Margin.h"

@implementation UITableViewCell (Margin)

@dynamic offsetXForEach;
@dynamic offsetYForEach;
// 在具体的子类去实现,分类调用异常
//-(void)setFrame:(CGRect)frame{
//    NSLog(@"self.offsetXForEach = %f",self.offsetXForEach);
//    NSLog(@"self.offsetYForEach = %f",self.offsetYForEach);
//    frame.origin.x += self.offsetXForEach;
//    frame.origin.y += self.offsetYForEach;
//    frame.size.height -= self.offsetYForEach * 2;
//    frame.size.width -= self.offsetXForEach * 2;
//    [super setFrame:frame];
//}
#pragma mark —— <UIViewModelProtocol> @property(nonatomic,strong)NSIndexPath *indexPath;
JobsKey(_indexPath)
@dynamic indexPath;
-(NSIndexPath *)indexPath{
    return Jobs_getAssociatedObject(_indexPath);
}

-(void)setIndexPath:(NSIndexPath *)indexPath{
    Jobs_setAssociatedRETAIN_NONATOMIC(_indexPath, indexPath)
}
#pragma mark —— <UIViewModelProtocol> @property(nonatomic,assign)NSInteger index;
JobsKey(_index)
@dynamic index;
-(NSInteger)index{
    return [Jobs_getAssociatedObject(_index) integerValue];
}

-(void)setIndex:(NSInteger)index{
    Jobs_setAssociatedRETAIN_NONATOMIC(_index, @(index))
}

@end

