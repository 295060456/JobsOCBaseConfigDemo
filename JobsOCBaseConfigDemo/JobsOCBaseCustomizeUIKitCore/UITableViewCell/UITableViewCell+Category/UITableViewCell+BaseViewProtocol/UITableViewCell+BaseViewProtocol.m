//
//  UITableViewCell+BaseViewProtocol.m
//  FMNormal
//
//  Created by Jobs on 2025/5/3.
//

#import "UITableViewCell+BaseViewProtocol.h"

@implementation UITableViewCell (BaseViewProtocol)
/// 用于实例
-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        /// TODO
        return self;
    };
}

@end
