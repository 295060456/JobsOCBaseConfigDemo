//
//  BaseTableViewer.h
//  Feidegou
//
//  Created by Kite on 2019/10/31.
//  Copyright © 2019 朝花夕拾. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN
/**
    1、子类如果重写-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event，
        则将会被优先执行，从而忽略UITableViewDelegate方法；
    2、监听reloadData的方法： 因为reloadData刷新UI是在主线程上，那么就在主线程上等待。直接在reloadData后获取主线程操作等待；
 */
@interface BaseTableView : UITableView

+(instancetype)initWithStylePlain;
+(instancetype)initWithStyleGrouped;
+(instancetype)initWithStyleInsetGrouped API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(tvos);

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UITableView *_Nonnull jobsMakeBaseTableViewByGrouped(jobsByBaseTableViewBlock _Nonnull block){
    BaseTableView *data = BaseTableView.initWithStyleGrouped;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UITableView *_Nonnull jobsMakeBaseTableViewByPlain(jobsByBaseTableViewBlock _Nonnull block){
    BaseTableView *data = BaseTableView.initWithStylePlain;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UITableView *_Nonnull jobsMakebaseTableViewByInsetGrouped(jobsByBaseTableViewBlock _Nonnull block){
    BaseTableView *data = BaseTableView.initWithStyleInsetGrouped;
    if (block) block(data);
    return data;
}
