//
//  YTKCustomBaseRequest.h
//  FM
//
//  Created by Admin on 31/10/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YTKCustomBaseRequest <NSObject>

@optional

@property(nonatomic,strong,nullable)id urlParameters;
@property(nonatomic,strong,nullable)NSMutableDictionary *parameters;
@property(nonatomic,strong,nullable)NSMutableDictionary *customHTTPHeader;

@end

NS_ASSUME_NONNULL_END
