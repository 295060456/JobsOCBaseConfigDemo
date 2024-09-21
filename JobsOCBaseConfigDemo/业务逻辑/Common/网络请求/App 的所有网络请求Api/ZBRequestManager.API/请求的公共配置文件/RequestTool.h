//
//  RequestTool.h
//  ZBNetworkingDemo
//
//  Created by Suzhibin on 2020/6/2.
//  Copyright © 2020 Suzhibin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+URLManager.h"
#import "ZBNetworking.h"
#import "DataManager.h"
#import "NetworkingConstant.h"

NS_ASSUME_NONNULL_BEGIN

@interface RequestTool : NSObject

@property(nonatomic,assign)HTTPRequestHeaderLanguageType languageType;

+(void)setupPublicParameters:(RequestTool *)config;

@end

NS_ASSUME_NONNULL_END
