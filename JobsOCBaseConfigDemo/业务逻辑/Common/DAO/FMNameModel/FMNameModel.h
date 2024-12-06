//
//  FMNameModel.h
//  FM
//
//  Created by Admin on 4/12/2024.
//

#import <Foundation/Foundation.h>
#import "DefineProperty.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface FMNameModel : NSObject

Prop_strong()__kindof UITextField *firstNameTF;
Prop_strong()__kindof UITextField *middleNameTF;
Prop_strong()__kindof UITextField *lastNameTF;
Prop_strong()__kindof UITextField *idTypeTF;
Prop_strong()__kindof UITextField *idNumberTF;

Prop_copy()NSString *firstName;
Prop_copy()NSString *middleName;
Prop_copy()NSString *lastName;
Prop_copy()NSString *idType;
Prop_copy()NSString *idNumber;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof FMNameModel *_Nonnull jobsMakeNameModel(jobsByNameModelBlock _Nonnull block){
    FMNameModel *data = FMNameModel.alloc.init;
    if (block) block(data);
    return data;
}
