//
//  ImageModel.h
//  FM
//
//  Created by User on 9/21/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageModel : NSObject

@property(nonatomic,strong,nullable)UIImage *image;
@property(nonatomic,strong,nullable)NSDictionary *info;
@property(nonatomic,strong,nullable)NSDictionary *timeDic;

@end

NS_ASSUME_NONNULL_END
