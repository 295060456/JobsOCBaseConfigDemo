//
//  MacroDef_Sys.h
//  UBallLive
//
//  Created by Jobs on 2020/10/9.
//

#ifndef MacroDef_Sys_h
#define MacroDef_Sys_h
/// BaseURL
#ifndef server_URL
#define server_URL NSObject.BaseUrl
#endif /* server_URL */
/// 服务器相关
#ifndef HTTPRequestTokenKey
#define HTTPRequestTokenKey @"token"
#endif /* HTTPRequestTokenKey */
/// 签名key
#ifndef HTTPServiceSignKey
#define HTTPServiceSignKey @"sign"
#endif /* HTTPServiceSignKey */
/// 私钥key
#ifndef HTTPServiceKey
#define HTTPServiceKey @"privatekey"
#endif /* HTTPServiceKey */
/// 私钥Value
#ifndef HTTPServiceKeyValue
#define HTTPServiceKeyValue @"/** 你的私钥 **/"
#endif /* HTTPServiceKeyValue */
/// 状态码key
#ifndef HTTPServiceResponseCodeKey
#define HTTPServiceResponseCodeKey @"code"
#endif /* HTTPServiceResponseCodeKey */
/// 消息key
#ifndef HTTPServiceResponseMsgKey
#define HTTPServiceResponseMsgKey @"msg"
#endif /* HTTPServiceResponseMsgKey */
/// 数据data
#ifndef HTTPServiceResponseDataKey
#define HTTPServiceResponseDataKey @"data"
#endif /* HTTPServiceResponseDataKey */
/// 懒加载
#ifndef Jobs_Lazy_Load_Property
#define Jobs_Lazy_Load_Property(PropertyType, Name, InitCode) \
- (PropertyType *)Name { \
    if (!_##Name) { \
        InitCode \
    } return _##Name; \
}
#endif /* Jobs_Lazy_Load_Property */
/// 用于分类定义属性Set和Get方法
/// Key
#ifndef JobsKey
#define JobsKey(key) static void *key = &key;
#endif /* JobsKey */
/// Get
#ifndef Jobs_getAssociatedObject
#define Jobs_getAssociatedObject(key) objc_getAssociatedObject(self, &key)
#endif /* Jobs_getAssociatedObject */
/// Set
#ifndef Jobs_setAssociatedASSIGN /// 封装成对象（NSNumber *）进行存储
#define Jobs_setAssociatedASSIGN(key, Object) \
    objc_setAssociatedObject(self, \
                             &(key), \
                             (Object), \
                             OBJC_ASSOCIATION_ASSIGN);
#endif /* Jobs_setAssociatedASSIGN */
#ifndef Jobs_setAssociatedRETAIN_NONATOMIC /// 适用于被 strong 和 retain 修饰的属性
#define Jobs_setAssociatedRETAIN_NONATOMIC(key, Object) \
    objc_setAssociatedObject(self, \
                             &(key), \
                             (Object), \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
#endif /* Jobs_setAssociatedRETAIN_NONATOMIC */
#ifndef Jobs_setAssociatedRETAIN /// 适用于被 strong 和 retain 修饰的属性
#define Jobs_setAssociatedRETAIN(key, Object) \
    objc_setAssociatedObject(self, \
                             &(key), \
                             (Object), \
                             OBJC_ASSOCIATION_RETAIN);
#endif /* Jobs_setAssociatedRETAIN */
#ifndef Jobs_setAssociatedCOPY_NONATOMIC
#define Jobs_setAssociatedCOPY_NONATOMIC(key, Object) \
    objc_setAssociatedObject(self, \
                             &(key), \
                             (Object), \
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
#endif /* Jobs_setAssociatedCOPY_NONATOMIC */
#ifndef Jobs_setAssociatedCOPY
#define Jobs_setAssociatedCOPY(key, Object) \
    objc_setAssociatedObject(self, \
                             &(key), \
                             (Object), \
                             OBJC_ASSOCIATION_COPY);
#endif /* Jobs_setAssociatedCOPY */
/// 二次封装分类挂载属性的set/get方法
/// 对象
#ifndef PROP_STRONG_OBJECT_TYPE
#define PROP_STRONG_OBJECT_TYPE(type, varName, VarName) \
static void * _##varName = &_##varName; \
@dynamic varName;\
-(type *)varName{ \
    return objc_getAssociatedObject(self, &_##varName); \
} \
\
- (void)set##VarName:(type *)varName { \
    objc_setAssociatedObject(self, \
                             &_##varName, \
                             varName, \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
}
#endif /* PROP_STRONG_OBJECT_TYPE */
#ifndef PROP_STRONG_OBJECT_Default_TYPE
#define PROP_STRONG_OBJECT_Default_TYPE(type, varName, VarName) \
static void * _##varName = &_##varName; \
@dynamic varName;\
-(type *)varName{ \
    type *obj = objc_getAssociatedObject(self, &_##varName); \
    if (!obj) { \
        obj = type.alloc.init; \
        objc_setAssociatedObject(self, \
                                 &_##varName, \
                                 obj, \
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
    } return obj; \
} \
\
- (void)set##VarName:(type *)varName { \
    objc_setAssociatedObject(self, \
                             &_##varName, \
                             varName, \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
}
#endif /* PROP_STRONG_OBJECT_Default_TYPE */
#ifndef PROP_COPY_OBJECT_TYPE2
#define PROP_COPY_OBJECT_TYPE2(type, varName, VarName) \
static void * _##varName = &_##varName; \
@dynamic varName;\
-(type)varName{ \
    return objc_getAssociatedObject(self, &_##varName); \
} \
\
-(void)set##VarName:(type)varName{ \
    objc_setAssociatedObject(self,\
                             &_##varName,\
                             varName,\
                             OBJC_ASSOCIATION_COPY_NONATOMIC); \
}
#endif /* PROP_COPY_OBJECT_TYPE2 */
#ifndef PROP_COPY_OBJECT_TYPE
#define PROP_COPY_OBJECT_TYPE(type, varName, VarName) \
PROP_COPY_OBJECT_TYPE2(type *, varName, VarName)
#endif /* PROP_COPY_OBJECT_TYPE */
#ifndef PROP_COPY_OBJECT_Default_TYPE
#define PROP_COPY_OBJECT_Default_TYPE(type, varName, VarName) \
static void * _##varName = &_##varName; \
@dynamic varName;\
-(type *)varName{ \
    type *obj = objc_getAssociatedObject(self, &_##varName); \
    if (!obj) { \
        obj = type.alloc.init; \
        objc_setAssociatedObject(self, \
                                 &_##varName, \
                                 obj, \
                                 OBJC_ASSOCIATION_COPY_NONATOMIC); \
    } return obj; \
} \
\
-(void)set##VarName:(type *)varName{ \
    objc_setAssociatedObject(self,\
                             &_##varName,\
                             varName,\
                             OBJC_ASSOCIATION_COPY_NONATOMIC); \
}
#endif /* PROP_COPY_OBJECT_Default_TYPE */
#ifndef PROP_ASSIGN_OBJECT_TYPE
#define PROP_ASSIGN_OBJECT_TYPE(type, varName, VarName) \
static void * _##varName = &_##varName; \
@dynamic varName;\
-(type)varName{ \
    return objc_getAssociatedObject(self, &_##varName); \
} \
\
-(void)set##VarName:(type)varName{ \
    objc_setAssociatedObject(self,\
                             &_##varName,\
                             varName,\
                             OBJC_ASSOCIATION_ASSIGN); \
}
#endif /* PROP_ASSIGN_OBJECT_TYPE */
/// 基本数据类型
#ifndef PROP_CGFloat
#define PROP_CGFloat(varName, VarName) \
static void * _##varName = &_##varName; \
@dynamic varName;\
-(CGFloat)varName{ \
    return [objc_getAssociatedObject(self, &_##varName) byFloat]; \
} \
\
-(void)set##VarName:(CGFloat)varName{ \
    objc_setAssociatedObject(self, \
                             &_##varName,\
                             @(varName), \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
}
#endif /* PROP_CGFloat */
#ifndef PROP_CHAR
#define PROP_CHAR(varName, VarName) \
static void * _##varName = &_##varName; \
@dynamic varName;\
-(char)varName{ \
    return [objc_getAssociatedObject(self, &_##varName) charValue]; \
} \
\
-(void)set##VarName:(char)varName{ \
    objc_setAssociatedObject(self, \
                             &_##varName,\
                             @(varName), \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
}
#endif /* PROP_CHAR */
#ifndef PROP_UNSIGNED_CHAR
#define PROP_UNSIGNED_CHAR(varName, VarName) \
@dynamic varName;\
static void * _##varName = &_##varName; \
-(unsigned char)varName{ \
    return [objc_getAssociatedObject(self, &_##varName) unsignedCharValue]; \
} \
\
-(void)set##VarName:(unsigned char)varName{ \
    objc_setAssociatedObject(self, \
                             &_##varName,\
                             @(varName), \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
}
#endif /* PROP_UNSIGNED_CHAR */
#ifndef PROP_SHORT
#define PROP_SHORT(varName, VarName) \
@dynamic varName;\
static void * _##varName = &_##varName; \
-(short)varName{ \
    return [objc_getAssociatedObject(self, &_##varName) shortValue]; \
} \
\
-(void)set##VarName:(short)varName{ \
    objc_setAssociatedObject(self, \
                             &_##varName,\
                             @(varName), \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
}
#endif /* PROP_SHORT */
#ifndef PROP_UNSIGNED_SHORT
#define PROP_UNSIGNED_SHORT(varName, VarName) \
@dynamic varName;\
static void * _##varName = &_##varName; \
-(unsigned short)varName{ \
    return [objc_getAssociatedObject(self, &_##varName) unsignedShortValue]; \
} \
\
-(void)set##VarName:(unsigned short)varName{ \
    objc_setAssociatedObject(self, \
                             &_##varName,\
                             @(varName), \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
}
#endif /* PROP_UNSIGNED_SHORT */
#ifndef PROP_INT
#define PROP_INT(varName, VarName) \
static void * _##varName = &_##varName; \
@dynamic varName;\
-(int)varName{ \
    return [objc_getAssociatedObject(self, &_##varName) intValue]; \
} \
\
-(void)set##VarName:(int)varName{ \
    objc_setAssociatedObject(self, \
                             &_##varName,\
                             @(varName), \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
}
#endif /* PROP_INT */
#ifndef PROP_UNSIGNED_INT
#define PROP_UNSIGNED_INT(varName, VarName) \
@dynamic varName;\
static void * _##varName = &_##varName; \
-(unsigned int)varName{ \
    return [objc_getAssociatedObject(self, &_##varName) unsignedIntValue]; \
} \
\
-(void)set##VarName:(unsigned int)varName{ \
    objc_setAssociatedObject(self, \
                             &_##varName,\
                             @(varName), \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
}
#endif /* PROP_UNSIGNED_INT */
#ifndef PROP_LONG
#define PROP_LONG(varName, VarName) \
static void * _##varName = &_##varName; \
@dynamic varName;\
-(long)varName{ \
    return [objc_getAssociatedObject(self, &_##varName) longValue]; \
} \
\
-(void)set##VarName:(long)varName{ \
    objc_setAssociatedObject(self, \
                             &_##varName,\
                             @(varName), \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
}
#endif /* PROP_LONG */
#ifndef PROP_UNSIGNED_LONG
#define PROP_UNSIGNED_LONG(varName, VarName) \
static void * _##varName = &_##varName; \
@dynamic varName;\
-(unsigned long)varName{ \
    return [objc_getAssociatedObject(self, &_##varName) unsignedLongValue]; \
} \
\
-(void)set##VarName:(unsigned long)varName{ \
    objc_setAssociatedObject(self, \
                             &_##varName,\
                             @(varName), \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
}
#endif /* PROP_UNSIGNED_LONG */
#ifndef PROP_LONG_LONG
#define PROP_LONG_LONG(varName, VarName) \
static void * _##varName = &_##varName; \
@dynamic varName;\
-(long long)varName{ \
    return [objc_getAssociatedObject(self, &_##varName) longLongValue]; \
} \
\
-(void)set##VarName:(long long)varName{ \
    objc_setAssociatedObject(self, \
                             &_##varName,\
                             @(varName), \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
}
#endif /* PROP_LONG_LONG */
#ifndef PROP_UNSIGNED_LONG_LONG
#define PROP_UNSIGNED_LONG_LONG(varName, VarName) \
static void * _##varName = &_##varName; \
@dynamic varName;\
-(unsigned long long)varName{ \
    return [objc_getAssociatedObject(self, &_##varName) unsignedLongLongValue]; \
} \
\
-(void)set##VarName:(unsigned long long)varName{ \
    objc_setAssociatedObject(self, \
                             &_##varName,\
                             @(varName), \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
}
#endif /* PROP_UNSIGNED_LONG_LONG */
#ifndef PROP_FLOAT
#define PROP_FLOAT(varName, VarName) \
static void * _##varName = &_##varName; \
@dynamic varName;\
-(float)varName{ \
    return [objc_getAssociatedObject(self, &_##varName) floatValue]; \
} \
\
-(void)set##VarName:(float)varName{ \
    objc_setAssociatedObject(self, \
                             &_##varName,\
                             @(varName), \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
}
#endif /* PROP_FLOAT */
#ifndef PROP_DOUBLE
#define PROP_DOUBLE(varName, VarName) \
static void * _##varName = &_##varName; \
@dynamic varName;\
-(double)varName{ \
    return [objc_getAssociatedObject(self, &_##varName) doubleValue]; \
} \
\
-(void)set##VarName:(double)varName{ \
    objc_setAssociatedObject(self, \
                             &_##varName,\
                             @(varName), \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
}
#endif /* PROP_DOUBLE */
#ifndef PROP_BOOL
#define PROP_BOOL(varName, VarName) \
static void * _##varName = &_##varName; \
@dynamic varName;\
-(BOOL)varName{ \
    return [objc_getAssociatedObject(self, &_##varName) boolValue]; \
} \
\
-(void)set##VarName:(BOOL)varName{ \
    objc_setAssociatedObject(self, \
                             &_##varName,\
                             @(varName), \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
}
#endif /* PROP_BOOL */
#ifndef PROP_NSInteger
#define PROP_NSInteger(varName, VarName) \
static void * _##varName = &_##varName; \
@dynamic varName;\
-(NSInteger)varName{ \
    return [objc_getAssociatedObject(self, &_##varName) integerValue]; \
} \
\
-(void)set##VarName:(NSInteger)varName{ \
    objc_setAssociatedObject(self, \
                             &_##varName,\
                             @(varName), \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
}
#endif /* PROP_NSInteger */
#ifndef PROP_NSUInteger
#define PROP_NSUInteger(varName, VarName) \
static void * _##varName = &_##varName; \
@dynamic varName;\
-(NSUInteger)varName{ \
    return [objc_getAssociatedObject(self, &_##varName) unsignedIntegerValue]; \
} \
\
-(void)set##VarName:(NSUInteger)varName{ \
    objc_setAssociatedObject(self, \
                             &_##varName,\
                             @(varName), \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
}
#endif /* PROP_NSUInteger */
/// 结构体类型
#ifndef PROP_CGPOINT
#define PROP_CGPOINT(varName, VarName) \
static void * _##varName = &_##varName; \
@dynamic varName;\
-(CGPoint)varName{ \
    return [objc_getAssociatedObject(self, &_##varName) CGPointValue]; \
} \
\
-(void)set##VarName:(CGPoint)varName{ \
    objc_setAssociatedObject(self, \
                             &_##varName,\
                             NSValue.byPoint(varName), \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
}
#endif /* PROP_CGPOINT */
#ifndef PROP_CGSIZE
#define PROP_CGSIZE(varName, VarName) \
static void * _##varName = &_##varName; \
@dynamic varName;\
-(CGSize)varName{ \
    return [objc_getAssociatedObject(self, &_##varName) CGSizeValue]; \
} \
\
-(void)set##VarName:(CGSize)varName{ \
    objc_setAssociatedObject(self, \
                             &_##varName,\
                             NSValue.bySize(varName), \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
}
#endif /* PROP_CGSIZE */
#ifndef PROP_CGRECT
#define PROP_CGRECT(varName, VarName) \
static void * _##varName = &_##varName; \
@dynamic varName;\
-(CGRect)varName{ \
    return [objc_getAssociatedObject(self, &_##varName) CGRectValue]; \
} \
\
- (void)set##VarName:(CGRect)varName{ \
    objc_setAssociatedObject(self, \
                             &_##varName,\
                             NSValue.byRect(varName), \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
}
#endif /* PROP_CGRECT */
#ifndef DEFINE_ACTION_METHOD
#define DEFINE_ACTION_METHOD(type, varName, VarName) \
- (void)action##VarName:(type _Nullable)varName { \
    self.varName = varName; \
}
#endif /* DEFINE_ACTION_METHOD */
#ifndef JobsDynamicPropSetAndGet
#define JobsDynamicPropSetAndGet(type, varName, VarName) \
PROP_COPY_OBJECT_TYPE2(type, varName, VarName) \
DEFINE_ACTION_METHOD(type, varName, VarName)
#endif /* JobsDynamicPropSetAndGet */

#endif /* MacroDef_Sys_h */
