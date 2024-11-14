//
//  CasinoCustomerContactModel.h
//  Casino
//
//  Created by Jobs on 2021/12/10.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CasinoCustomerContactElementModel : BaseModel

@property(nonatomic,copy)NSString *appIconUrl; // 移动端图标
@property(nonatomic,copy)NSString *namecreateBy;
@property(nonatomic,copy)NSString *createTime;
@property(nonatomic,copy)NSString *customer; // 客服平台
@property(nonatomic,copy)NSString *customerAccount; // 客服账号
@property(nonatomic,assign)JobsCustomerContactStyle customerMark; // 客服平台标识
@property(nonatomic,copy)NSString *ID;
@property(nonatomic,copy)NSString *pcIconUrl; // PC端图标
@property(nonatomic,assign)JobsSwitchType state;// 客服平台状态
@property(nonatomic,copy)NSString *updateBy;
@property(nonatomic,copy)NSString *updateTime;

@end

@interface CasinoCustomerContactModel : BaseModel

@property(nonatomic,strong)NSMutableArray <CasinoCustomerContactElementModel *>*customerList;
@property(nonatomic,strong)CasinoCustomerContactElementModel *onlineUrl;
@property(nonatomic,strong)CasinoCustomerContactElementModel *telephone;

@end

NS_ASSUME_NONNULL_END

//{
//    customerList =     (
//                {
//            appIconUrl = "/casino-admin/cc47c5a4-5e9f-48f9-a816-1e697c46f4f0.png";
//            createBy = "<null>";
//            createTime = "2021-12-13 19:44:31";
//            customer = "qq\U53f7";
//            customerAccount = 2701819719;
//            customerMark = 1;
//            id = 1;
//            pcIconUrl = "/casino-admin/fd36a5c4-0943-4fd5-b58b-095748446c43.png";
//            state = 1;
//            updateBy = "<null>";
//            updateTime = "2021-12-13 19:44:31";
//        },
//                {
//            appIconUrl = "/casino-admin/1724ef4a-d9e7-4b8f-a469-8a3ef9919c76.png";
//            createBy = "<null>";
//            createTime = "2021-12-13 19:44:31";
//            customer = "skype\U53f7";
//            customerAccount = "live:.cid.319676994e74d6f";
//            customerMark = 2;
//            id = 2;
//            pcIconUrl = "/casino-admin/3f3dd5a3-ccce-49f4-bf90-821bada82fa0.png";
//            state = 1;
//            updateBy = "<null>";
//            updateTime = "2021-12-13 19:44:31";
//        },
//                {
//            appIconUrl = "/casino-admin/6a96275c-f16f-45c5-8a08-e912b9f3cfb8.png";
//            createBy = "<null>";
//            createTime = "2021-12-13 19:44:32";
//            customer = "telegram\U53f7";
//            customerAccount = LucianKK;
//            customerMark = 3;
//            id = 3;
//            pcIconUrl = "/casino-admin/8d72660d-3986-404d-9f43-aea49bccfa75.png";
//            state = 1;
//            updateBy = "<null>";
//            updateTime = "2021-12-13 19:44:32";
//        },
//                {
//            appIconUrl = "/casino-admin/79d13b6f-bbac-4569-b5f9-dbb6453f8d78.png";
//            createBy = "<null>";
//            createTime = "2021-12-13 19:44:32";
//            customer = "whatsApp\U53f7";
//            customerAccount = "<null>";
//            customerMark = 4;
//            id = 4;
//            pcIconUrl = "/casino-admin/eb16a512-6ff6-45db-8f57-4341a1ad2938.png";
//            state = 1;
//            updateBy = "<null>";
//            updateTime = "2021-12-13 19:44:32";
//        }
//    );
//    onlineUrl =     {
//        appIconUrl = "<null>";
//        createBy = "<null>";
//        createTime = "2021-12-13 19:44:32";
//        customer = "onlineUrl\U53f7";
//        customerAccount = "http://www.okeexx.cn/#/test";
//        customerMark = 6;
//        id = 6;
//        pcIconUrl = "<null>";
//        state = 1;
//        updateBy = "<null>";
//        updateTime = "2021-12-13 19:44:32";
//    };
//    telephone =     {
//        appIconUrl = "<null>";
//        createBy = "<null>";
//        createTime = "2021-12-13 19:44:32";
//        customer = "\U624b\U673a\U53f7\U7801";
//        customerAccount = 85789457845;
//        customerMark = 5;
//        id = 5;
//        pcIconUrl = "/casino-admin/aad17d13-1d9a-46ac-820f-d026a084d231.png";
//        state = 1;
//        updateBy = "<null>";
//        updateTime = "2021-12-13 19:44:32";
//    };
//}
