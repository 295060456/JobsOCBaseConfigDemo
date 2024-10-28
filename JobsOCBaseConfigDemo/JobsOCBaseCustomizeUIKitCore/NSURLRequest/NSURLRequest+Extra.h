//
//  NSURLRequest+Extra.h
//  FM
//
//  Created by User on 9/12/24.
//

#import <Foundation/Foundation.h>
#import "YTKNetworkToolsHeader.h"
#import "JobsBlock.h"

#define GETMethod httpMethod(YTKRequestMethodGET);
#define POSTMethod httpMethod(YTKRequestMethodPOST);
#define PUTMethod httpMethod(YTKRequestMethodPUT);
#define DELETEMethod httpMethod(YTKRequestMethodDELETE);
#define PATCHMethod httpMethod(YTKRequestMethodPATCH);
#define HEADMethod httpMethod(YTKRequestMethodHEAD);

NS_INLINE NSString * _Nullable httpMethod(YTKRequestMethod method){
    switch (method) {
        case YTKRequestMethodGET:{
            return @"GET";
        }break;
        case YTKRequestMethodPOST:{
            return @"POST";
        }break;
        case YTKRequestMethodPUT:{
            return @"PUT";
        }break;
        case YTKRequestMethodDELETE:{
            return @"DELETE";
        }break;
        case YTKRequestMethodPATCH:{
            return @"PATCH";
        }break;
        case YTKRequestMethodHEAD:{
            return @"HEAD";
        }break;
            
        default:
            return @"";
            break;
    }
}

NS_ASSUME_NONNULL_BEGIN

@interface NSURLRequest (Extra)

-(JobsReturnMutableURLRequestByVoidBlock _Nonnull)print;

@end

NS_ASSUME_NONNULL_END
