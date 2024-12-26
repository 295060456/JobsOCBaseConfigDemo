//
//  FileFolderHandleModel.h
//  FM
//
//  Created by Admin on 26/12/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FileFolderHandleModel : NSObject

@property(nonatomic,strong,nullable)AVAsset *asset;
@property(nonatomic,strong,nullable)AVAudioMix *audioMix;
@property(nonatomic,strong,nullable)NSDictionary *info;
@property(nonatomic,strong,nullable)NSData *data;
@property(nonatomic,strong,nullable)UIImage *image;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof FileFolderHandleModel *_Nonnull jobsMakeFileFolderHandleModel(jobsByFileFolderHandleModelBlock _Nonnull block){
    FileFolderHandleModel *data = FileFolderHandleModel.alloc.init;
    if (block) block(data);
    return data;
}
