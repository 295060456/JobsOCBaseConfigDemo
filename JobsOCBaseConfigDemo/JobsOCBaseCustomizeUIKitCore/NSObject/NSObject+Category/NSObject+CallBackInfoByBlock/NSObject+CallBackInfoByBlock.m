//
//  NSObject+CallBackInfoByBlock.m
//  DouDong-II
//
//  Created by Jobs on 2021/2/26.
//

#import "NSObject+CallBackInfoByBlock.h"
//在 Objective-C 中，向 nil 对象发送消息不会崩溃
//但是如果你尝试对 nil 对象调用分类中的方法，可能会导致问题。
//这是因为 nil 对象并不会执行任何方法实现，分类中的方法也不会被调用。
@implementation NSObject (CallBackInfoByBlock)
#pragma mark —— 1.1、无入参 ｜ 没有返回值
JobsKey(_voidBlock)
@dynamic voidBlock;
-(jobsByVoidBlock _Nullable)voidBlock{
    return Jobs_getAssociatedObject(_voidBlock);
}

-(void)setVoidBlock:(jobsByVoidBlock _Nullable)voidBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_voidBlock, voidBlock)
}

-(void)actionVoidBlock:(jobsByVoidBlock _Nullable)voidBlock{
    self.voidBlock = voidBlock;
}
#pragma mark —— 1.2、（单一）入参 ｜ 无返回值
JobsKey(_objectBlock)
@dynamic objectBlock;
-(jobsByIDBlock _Nullable)objectBlock{
    return Jobs_getAssociatedObject(_objectBlock);
}

-(void)setObjectBlock:(jobsByIDBlock _Nullable)objectBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_objectBlock, objectBlock)
}

-(void)actionObjectBlock:(jobsByIDBlock _Nullable)objectBlock{
    self.objectBlock = objectBlock;
}
JobsKey(_gestureRecognizerBlock)
@dynamic gestureRecognizerBlock;
-(jobsByGestureRecognizerBlock _Nullable)gestureRecognizerBlock{
    return Jobs_getAssociatedObject(_gestureRecognizerBlock);
}

-(void)setGestureRecognizerBlock:(jobsByGestureRecognizerBlock _Nullable)gestureRecognizerBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_gestureRecognizerBlock, gestureRecognizerBlock)
}
-(void)actionGestureRecognizerBlock:(jobsByGestureRecognizerBlock _Nullable)gestureRecognizerBlock{
    self.gestureRecognizerBlock = gestureRecognizerBlock;
}
JobsKey(_selBlock)
@dynamic selBlock;
-(jobsBySELBlock _Nullable)selBlock{
    return Jobs_getAssociatedObject(_selBlock);
}

-(void)setSelBlock:(jobsBySELBlock _Nullable)selBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_selBlock, selBlock);
}
-(void)actionSELBlock:(jobsBySELBlock _Nullable)selBlock{
    self.selBlock = selBlock;
}
JobsKey(_stringBlock)
@dynamic stringBlock;
-(jobsByStringBlock _Nullable)stringBlock{
    return Jobs_getAssociatedObject(_stringBlock);
}

-(void)setStringBlock:(jobsByStringBlock _Nullable)stringBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_stringBlock, stringBlock)
}

-(void)actionStringBlock:(jobsByStringBlock _Nullable)stringBlock{
    self.stringBlock = stringBlock;
}
#pragma mark —— 1.3、（单一）入参为基本数据类型 ｜ 无返回值
JobsKey(_NSIntegerBlock)
@dynamic NSIntegerBlock;
-(jobsByNSIntegerBlock _Nullable)NSIntegerBlock{
    return Jobs_getAssociatedObject(_NSIntegerBlock);
}

-(void)setNSIntegerBlock:(jobsByNSIntegerBlock _Nullable)NSIntegerBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_NSIntegerBlock, NSIntegerBlock)
}

-(void)actionNSIntegerBlock:(jobsByNSIntegerBlock _Nullable)NSIntegerBlock{
    self.NSIntegerBlock = NSIntegerBlock;
}
JobsKey(_NSUIntegerBlock)
@dynamic NSUIntegerBlock;
-(jobsByNSUIntegerBlock _Nullable)NSUIntegerBlock{
    return Jobs_getAssociatedObject(_NSUIntegerBlock);
}

-(void)setNSUIntegerBlock:(jobsByNSUIntegerBlock _Nullable)NSUIntegerBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_NSUIntegerBlock, NSUIntegerBlock)
}

-(void)actionNSUIntegerBlock:(jobsByNSUIntegerBlock _Nullable)NSUIntegerBlock{
    self.NSUIntegerBlock = NSUIntegerBlock;
}
JobsKey(_CGFloatBlock)
@dynamic CGFloatBlock;
-(jobsByCGFloatBlock _Nullable)CGFloatBlock{
    return Jobs_getAssociatedObject(_CGFloatBlock);
}

-(void)setCGFloatBlock:(jobsByCGFloatBlock _Nullable)CGFloatBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_CGFloatBlock, CGFloatBlock)
}

-(void)actionCGFloatBlock:(jobsByCGFloatBlock _Nullable)CGFloatBlock{
    self.CGFloatBlock = CGFloatBlock;
}
JobsKey(_BOOLBlock)
@dynamic BOOLBlock;
-(jobsByBOOLBlock _Nullable)BOOLBlock{
    return Jobs_getAssociatedObject(_BOOLBlock);
}

-(void)setBOOLBlock:(jobsByBOOLBlock _Nullable)BOOLBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_BOOLBlock, BOOLBlock)
}

-(void)actionBOOLBlock:(jobsByBOOLBlock _Nullable)BOOLBlock{
    self.BOOLBlock = BOOLBlock;
}
JobsKey(_IntBlock)
@dynamic IntBlock;
-(jobsByIntBlock _Nullable)IntBlock{
    return Jobs_getAssociatedObject(_IntBlock);
}

-(void)setIntBlock:(jobsByIntBlock _Nullable)IntBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_IntBlock, IntBlock)
}

-(void)actionIntBlock:(jobsByIntBlock _Nullable)IntBlock{
    self.IntBlock = IntBlock;
}
JobsKey(_UnsignedIntBlock)
@dynamic UnsignedIntBlock;
-(jobsByUnsignedIntBlock _Nullable)UnsignedIntBlock{
    return Jobs_getAssociatedObject(_UnsignedIntBlock);
}

-(void)setUnsignedIntBlock:(jobsByUnsignedIntBlock _Nullable)UnsignedIntBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_UnsignedIntBlock, UnsignedIntBlock)
}

-(void)actionUnsignedIntBlock:(jobsByUnsignedIntBlock _Nullable)UnsignedIntBlock{
    self.UnsignedIntBlock = UnsignedIntBlock;
}
JobsKey(_FloatBlock)
@dynamic FloatBlock;
-(jobsByFloatBlock _Nullable)FloatBlock{
    return Jobs_getAssociatedObject(_FloatBlock);
}

-(void)setFloatBlock:(jobsByFloatBlock _Nullable)FloatBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_FloatBlock, FloatBlock)
}

-(void)actionFloatBlock:(jobsByFloatBlock _Nullable)FloatBlock{
    self.FloatBlock = FloatBlock;
}
JobsKey(_DoubleBlock)
@dynamic DoubleBlock;
-(jobsByDoubleBlock _Nullable)DoubleBlock{
    return Jobs_getAssociatedObject(_DoubleBlock);
}

-(void)setDoubleBlock:(jobsByDoubleBlock _Nullable)DoubleBlock{
 Jobs_setAssociatedCOPY_NONATOMIC(_DoubleBlock, DoubleBlock)
}

-(void)actionDoubleBlock:(jobsByDoubleBlock _Nullable)DoubleBlock{
    self.DoubleBlock = DoubleBlock;
}
JobsKey(_CharBlock)
@dynamic CharBlock;
-(jobsByCharBlock _Nullable)CharBlock{
    return Jobs_getAssociatedObject(_CharBlock);
}

-(void)setCharBlock:(jobsByCharBlock _Nullable)CharBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_CharBlock, CharBlock)
}

-(void)actionCharBlock:(jobsByCharBlock _Nullable)CharBlock{
    self.CharBlock = CharBlock;
}
JobsKey(_UnsignedCharBlock)
@dynamic UnsignedCharBlock;
-(jobsByUnsignedCharBlock _Nullable)UnsignedCharBlock{
    return Jobs_getAssociatedObject(_UnsignedCharBlock);
}

-(void)setUnsignedCharBlock:(jobsByUnsignedCharBlock _Nullable)UnsignedCharBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_UnsignedCharBlock, UnsignedCharBlock)
}

-(void)actionUnsignedCharBlock:(jobsByUnsignedCharBlock _Nullable)UnsignedCharBlock{
    self.UnsignedCharBlock = UnsignedCharBlock;
}
JobsKey(_ShortBlock)
@dynamic ShortBlock;
-(jobsByShortBlock _Nullable)ShortBlock{
    return Jobs_getAssociatedObject(_ShortBlock);
}

-(void)setShortBlock:(jobsByShortBlock _Nullable)ShortBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_ShortBlock, ShortBlock)
}

-(void)actionShortBlock:(jobsByShortBlock _Nullable)ShortBlock{
    self.ShortBlock = ShortBlock;
}
JobsKey(_UnsignedShortBlock)
@dynamic UnsignedShortBlock;
-(jobsByUnsignedShortBlock _Nullable)UnsignedShortBlock{
    return Jobs_getAssociatedObject(_UnsignedShortBlock);
}

-(void)setUnsignedShortBlock:(jobsByUnsignedShortBlock _Nullable)UnsignedShortBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_UnsignedShortBlock, UnsignedShortBlock)
}

-(void)actionUnsignedShortBlock:(jobsByUnsignedShortBlock _Nullable)UnsignedShortBlock{
    self.UnsignedShortBlock = UnsignedShortBlock;
}
JobsKey(_LongBlock)
@dynamic LongBlock;
-(jobsByLongBlock _Nullable)LongBlock{
    return Jobs_getAssociatedObject(_LongBlock);
}

-(void)setLongBlock:(jobsByLongBlock _Nullable)LongBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_LongBlock, LongBlock)
}

-(void)actionLongBlock:(jobsByLongBlock _Nullable)LongBlock{
    self.LongBlock = LongBlock;
}
JobsKey(_UnsignedLongBlock)
@dynamic UnsignedLongBlock;
-(jobsByUnsignedLongBlock _Nullable)UnsignedLongBlock{
    return Jobs_getAssociatedObject(_UnsignedLongBlock);
}

-(void)setUnsignedLongBlock:(jobsByUnsignedLongBlock _Nullable)UnsignedLongBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_UnsignedLongBlock, UnsignedLongBlock)
}

-(void)actionUnsignedLongBlock:(jobsByUnsignedLongBlock _Nullable)UnsignedLongBlock{
    self.UnsignedLongBlock = UnsignedLongBlock;
}
JobsKey(_UnsignedLongLongBlock)
@dynamic UnsignedLongLongBlock;
-(jobsByUnsignedLongLongBlock _Nullable)UnsignedLongLongBlock{
    return Jobs_getAssociatedObject(_UnsignedLongLongBlock);
}

-(void)setUnsignedLongLongBlock:(jobsByUnsignedLongLongBlock _Nullable)UnsignedLongLongBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_UnsignedLongLongBlock, UnsignedLongLongBlock)
}

-(void)actionUnsignedLongLongBlock:(jobsByUnsignedLongLongBlock _Nullable)UnsignedLongLongBlock{
    self.UnsignedLongLongBlock = UnsignedLongLongBlock;
}
#pragma mark —— 1.4、多入参（任意数据类型） ｜ 无返回值
JobsKey(_SelectorBlock)
@dynamic SelectorBlock;
-(JobsSelectorBlock _Nullable)returnSelectorBlock{
    return Jobs_getAssociatedObject(_returnObjectBySELBlock);
}

-(void)setSelectorBlock:(JobsSelectorBlock _Nullable)selectorBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_SelectorBlock, selectorBlock)
}

-(void)actionSelectorBlock:(JobsSelectorBlock _Nullable)selectorBlock{
    self.SelectorBlock = selectorBlock;
}
#pragma mark —— 2.1、无入参 ｜ 有返回值
JobsKey(_returnObjectBySELBlock)
@dynamic returnObjectBySELBlock;
-(JobsReturnIDBySELBlock _Nullable)returnObjectBySELBlock{
    return Jobs_getAssociatedObject(_returnObjectBySELBlock);
}

-(void)setReturnObjectBySELBlock:(JobsReturnIDBySELBlock _Nullable)returnObjectBySELBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnObjectBySELBlock, returnObjectBySELBlock)
}

-(void)actionReturnIDBySELBlock:(JobsReturnIDBySELBlock _Nullable)returnObjectBySELBlock{
    self.returnObjectBySELBlock = returnObjectBySELBlock;
}
JobsKey(_returnObjectByVoidBlock)
@dynamic returnObjectByVoidBlock;
-(JobsReturnIDByVoidBlock _Nullable)returnObjectByVoidBlock{
    return Jobs_getAssociatedObject(_returnObjectByVoidBlock);
}

-(void)setReturnObjectByVoidBlock:(JobsReturnIDByVoidBlock _Nullable)returnObjectByVoidBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnObjectByVoidBlock, returnObjectByVoidBlock)
}

-(void)actionReturnIDByVoidBlock:(JobsReturnIDByVoidBlock _Nullable)returnObjectByVoidBlock{
    self.returnObjectByVoidBlock = returnObjectByVoidBlock;
}
#pragma mark —— 2.2、（单一）入参 ｜ （其他数据类型）返回值
JobsKey(_returnObjectByGestureRecognizerBlock)
@dynamic returnObjectByGestureRecognizerBlock;
-(JobsReturnIDByGestureRecognizerBlock _Nullable)returnObjectByGestureRecognizerBlock{
    return Jobs_getAssociatedObject(_returnObjectByGestureRecognizerBlock);
}

-(void)setReturnObjectByGestureRecognizerBlock:(JobsReturnIDByGestureRecognizerBlock _Nullable)returnObjectByGestureRecognizerBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnObjectByGestureRecognizerBlock, returnObjectByGestureRecognizerBlock)
}

-(void)actionReturnIDByGestureRecognizerBlock:(JobsReturnIDByGestureRecognizerBlock _Nullable)returnObjectByGestureRecognizerBlock{
    self.returnObjectByGestureRecognizerBlock = returnObjectByGestureRecognizerBlock;
}

JobsKey(_returnObjectByStringBlock)
@dynamic returnObjectByStringBlock;
-(JobsReturnIDByStringBlock _Nullable)returnObjectByStringBlock{
    return Jobs_getAssociatedObject(_returnObjectByStringBlock);
}

-(void)setReturnObjectByStringBlock:(JobsReturnIDByStringBlock _Nullable)returnObjectByStringBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnObjectByStringBlock, returnObjectByStringBlock)
}
-(void)actionReturnIDByStringBlock:(JobsReturnIDByStringBlock _Nullable)returnObjectByStringBlock{
    self.returnObjectByStringBlock = returnObjectByStringBlock;
}
JobsKey(_returnNSIntegerByIDBlock)
@dynamic returnNSIntegerByIDBlock;
-(JobsReturnNSIntegerByIDBlock _Nullable)returnNSIntegerByIDBlock{
    return Jobs_getAssociatedObject(_returnNSIntegerByIDBlock);
}

-(void)setReturnNSIntegerByIDBlock:(JobsReturnNSIntegerByIDBlock _Nullable)returnNSIntegerByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnNSIntegerByIDBlock, returnNSIntegerByIDBlock)
}

-(void)actionReturnNSIntegerByIDBlock:(JobsReturnNSIntegerByIDBlock _Nullable)returnNSIntegerByIDBlock{
    self.returnNSIntegerByIDBlock = returnNSIntegerByIDBlock;
}
JobsKey(_returnNSUIntegerByIDBlock)
@dynamic returnNSUIntegerByIDBlock;
-(JobsReturnNSUIntegerByIDBlock _Nullable)returnNSUIntegerByIDBlock{
    return Jobs_getAssociatedObject(_returnNSUIntegerByIDBlock);
}

-(void)setReturnNSUIntegerByIDBlock:(JobsReturnNSUIntegerByIDBlock _Nullable)returnNSUIntegerByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnNSUIntegerByIDBlock, returnNSUIntegerByIDBlock)
}

-(void)actionReturnNSUIntegerByIDBlock:(JobsReturnNSUIntegerByIDBlock _Nullable)returnNSUIntegerByIDBlock{
    self.returnNSUIntegerByIDBlock = returnNSUIntegerByIDBlock;
}
JobsKey(_returnCGFloatByIDBlock)
@dynamic returnCGFloatByIDBlock;
-(JobsReturnCGFloatByIDBlock _Nullable)returnCGFloatByIDBlock{
    return Jobs_getAssociatedObject(_returnCGFloatByIDBlock);
}

-(void)setReturnCGFloatByIDBlock:(JobsReturnCGFloatByIDBlock _Nullable)returnCGFloatByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnCGFloatByIDBlock, returnCGFloatByIDBlock)
}

-(void)actionReturnCGFloatByIDBlock:(JobsReturnCGFloatByIDBlock _Nullable)returnCGFloatByIDBlock{
    self.returnCGFloatByIDBlock = returnCGFloatByIDBlock;
}
JobsKey(_returnBoolByIDBlock)
@dynamic returnBoolByIDBlock;
-(JobsReturnBOOLByIDBlock _Nullable)returnBoolByIDBlock{
    return Jobs_getAssociatedObject(_returnBoolByIDBlock);
}

-(void)setReturnBoolByIDBlock:(JobsReturnBOOLByIDBlock _Nullable)returnBoolByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnBoolByIDBlock, returnBoolByIDBlock);
}

-(void)actionReturnBoolByIDBlock:(JobsReturnBOOLByIDBlock _Nullable)returnBoolByIDBlock{
    self.returnBoolByIDBlock = returnBoolByIDBlock;
}
JobsKey(_returnIntByIDBlock)
@dynamic returnIntByIDBlock;
-(JobsReturnIntByIDBlock _Nullable)returnIntByIDBlock{
    return Jobs_getAssociatedObject(_returnIntByIDBlock);
}

-(void)setReturnIntByIDBlock:(JobsReturnIntByIDBlock _Nullable)returnIntByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnIntByIDBlock, returnIntByIDBlock)
}

-(void)actionReturnIntByIDBlock:(JobsReturnIntByIDBlock _Nullable)returnIntByIDBlock{
    self.returnIntByIDBlock = returnIntByIDBlock;
}
JobsKey(_returnUnsignedIntByIDBlock)
@dynamic returnUnsignedIntByIDBlock;
-(JobsReturnUnsignedIntByIDBlock _Nullable)returnUnsignedIntByIDBlock{
    return Jobs_getAssociatedObject(_returnUnsignedIntByIDBlock);
}

-(void)setReturnUnsignedIntByIDBlock:(JobsReturnUnsignedIntByIDBlock _Nullable)returnUnsignedIntByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnUnsignedIntByIDBlock,returnUnsignedIntByIDBlock)
}

-(void)actionReturnUnsignedIntByIDBlock:(JobsReturnUnsignedIntByIDBlock _Nullable)returnUnsignedIntByIDBlock{
    self.returnUnsignedIntByIDBlock = returnUnsignedIntByIDBlock;
}
JobsKey(_returnFloatByIDBlock)
@dynamic returnFloatByIDBlock;
-(JobsReturnFloatByIDBlock _Nullable)returnFloatByIDBlock{
    return Jobs_getAssociatedObject(_returnFloatByIDBlock);
}

-(void)setReturnFloatByIDBlock:(JobsReturnFloatByIDBlock _Nullable)returnFloatByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnFloatByIDBlock, returnFloatByIDBlock)
}

-(void)actionReturnFloatByIDBlock:(JobsReturnFloatByIDBlock _Nullable)returnFloatByIDBlock{
    self.returnFloatByIDBlock = returnFloatByIDBlock;
}
JobsKey(_returnDoubleByIDBlock)
@dynamic returnDoubleByIDBlock;
-(JobsReturnDoubleByIDBlock _Nullable)returnDoubleByIDBlock{
    return Jobs_getAssociatedObject(_returnDoubleByIDBlock);
}

-(void)setReturnDoubleByIDBlock:(JobsReturnDoubleByIDBlock _Nullable)returnDoubleByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnDoubleByIDBlock, returnDoubleByIDBlock)
}

-(void)actionReturnDoubleByIDBlock:(JobsReturnDoubleByIDBlock _Nullable)returnDoubleByIDBlock{
    self.returnDoubleByIDBlock = returnDoubleByIDBlock;
}
JobsKey(_returnCharByIDBlock)
@dynamic returnCharByIDBlock;
-(JobsReturnCharByIDBlock _Nullable)returnCharByIDBlock{
    return Jobs_getAssociatedObject(_returnCharByIDBlock);
}

-(void)setReturnCharByIDBlock:(JobsReturnCharByIDBlock _Nullable)returnCharByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnCharByIDBlock, returnCharByIDBlock)
}

-(void)actionReturnCharByIDBlock:(JobsReturnCharByIDBlock _Nullable)returnCharByIDBlock{
    self.returnCharByIDBlock = returnCharByIDBlock;
}
JobsKey(_returnUnsignedCharByIDBlock)
@dynamic returnUnsignedCharByIDBlock;
-(JobsReturnUnsignedCharByIDBlock _Nullable)returnUnsignedCharByIDBlock{
    return Jobs_getAssociatedObject(_returnUnsignedCharByIDBlock);
}

-(void)setReturnUnsignedCharByIDBlock:(JobsReturnUnsignedCharByIDBlock _Nullable)returnUnsignedCharByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnUnsignedCharByIDBlock, returnUnsignedCharByIDBlock)
}

-(void)actionReturnUnsignedCharByIDBlock:(JobsReturnUnsignedCharByIDBlock _Nullable)returnUnsignedCharByIDBlock{
    self.returnUnsignedCharByIDBlock = returnUnsignedCharByIDBlock;
}
JobsKey(_returnShortByIDBlock)
@dynamic returnShortByIDBlock;
-(JobsReturnShortByIDBlock _Nullable)returnShortByIDBlock{
    return Jobs_getAssociatedObject(_returnShortByIDBlock);
}

-(void)setReturnShortByIDBlock:(JobsReturnShortByIDBlock _Nullable)returnShortByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnShortByIDBlock, returnShortByIDBlock)
}

-(void)actionReturnShortByIDBlock:(JobsReturnShortByIDBlock _Nullable)returnShortByIDBlock{
    self.returnShortByIDBlock = returnShortByIDBlock;
}
JobsKey(_returnUnsignedShortByIDBlock)
@dynamic returnUnsignedShortByIDBlock;
-(JobsReturnUnsignedShortByIDBlock _Nullable)returnUnsignedShortByIDBlock{
    return Jobs_getAssociatedObject(_returnUnsignedShortByIDBlock);
}

-(void)setReturnUnsignedShortByIDBlock:(JobsReturnUnsignedShortByIDBlock _Nullable)returnUnsignedShortByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnUnsignedShortByIDBlock, returnUnsignedShortByIDBlock)
}

-(void)actionReturnUnsignedShortByIDBlock:(JobsReturnUnsignedShortByIDBlock _Nullable)returnUnsignedShortByIDBlock{
    self.returnUnsignedShortByIDBlock = returnUnsignedShortByIDBlock;
}
JobsKey(_returnLongByIDBlock)
@dynamic returnLongByIDBlock;
-(JobsReturnLongByIDBlock _Nullable)returnLongByIDBlock{
    return Jobs_getAssociatedObject(_returnLongByIDBlock);
}

-(void)setReturnLongByIDBlock:(JobsReturnLongByIDBlock _Nullable)returnLongByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnLongByIDBlock, returnLongByIDBlock)
}

-(void)actionReturnLongByIDBlock:(JobsReturnLongByIDBlock _Nullable)returnLongByIDBlock{
    self.returnLongByIDBlock = returnLongByIDBlock;
}
JobsKey(_returnUnsignedLongByIDBlock)
@dynamic returnUnsignedLongByIDBlock;
-(JobsReturnUnsignedLongByIDBlock _Nullable)returnUnsignedLongByIDBlock{
    return Jobs_getAssociatedObject(_returnUnsignedLongByIDBlock);
}

-(void)setReturnUnsignedLongByIDBlock:(JobsReturnUnsignedLongByIDBlock _Nullable)returnUnsignedLongByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnUnsignedLongByIDBlock, returnUnsignedLongByIDBlock)
}

-(void)actionReturnUnsignedLongByIDBlock:(JobsReturnUnsignedLongByIDBlock _Nullable)returnUnsignedLongByIDBlock{
    self.returnUnsignedLongByIDBlock = returnUnsignedLongByIDBlock;
}
JobsKey(_returnUnsignedLongLongByIDBlock)
@dynamic returnUnsignedLongLongByIDBlock;
-(JobsReturnUnsignedLongLongByIDBlock _Nullable)returnUnsignedLongLongByIDBlock{
    return Jobs_getAssociatedObject(_returnUnsignedLongLongByIDBlock);
}

-(void)setReturnUnsignedLongLongByIDBlock:(JobsReturnUnsignedLongLongByIDBlock _Nullable)returnUnsignedLongLongByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnUnsignedLongLongByIDBlock, returnUnsignedLongLongByIDBlock)
}

-(void)actionReturnUnsignedLongLongByIDBlock:(JobsReturnUnsignedLongLongByIDBlock _Nullable)returnUnsignedLongLongByIDBlock{
    self.returnUnsignedLongLongByIDBlock = returnUnsignedLongLongByIDBlock;
}
#pragma mark —— 2.3、（单一）入参 ｜ 返回（入参类型）值
JobsKey(_returnObjectBlock)
@dynamic returnObjectBlock;
-(JobsReturnIDByIDBlock _Nullable)returnObjectBlock{
    return Jobs_getAssociatedObject(_returnObjectBlock);
}

-(void)setReturnObjectBlock:(JobsReturnIDByIDBlock _Nullable)returnObjectBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnObjectBlock, returnObjectBlock)
}

-(void)actionReturnObjectBlock:(JobsReturnIDByIDBlock _Nullable)returnObjectBlock{
    self.returnObjectBlock = returnObjectBlock;
}
JobsKey(_returnNSIntegerBlock)
@dynamic returnNSIntegerBlock;
-(JobsReturnByNSIntegerBlock _Nullable)returnNSIntegerBlock{
    return Jobs_getAssociatedObject(_returnNSIntegerBlock);
}

-(void)setReturnNSIntegerBlock:(JobsReturnByNSIntegerBlock _Nullable)returnNSIntegerBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnNSIntegerBlock, returnNSIntegerBlock)
}

-(void)actionReturnNSIntegerBlock:(JobsReturnByNSIntegerBlock _Nullable)returnNSIntegerBlock{
    self.returnNSIntegerBlock = returnNSIntegerBlock;
}
JobsKey(_returnNSUIntegerBlock)
@dynamic returnNSUIntegerBlock;
-(JobsReturnByNSUIntegerBlock _Nullable)returnNSUIntegerBlock{
    return Jobs_getAssociatedObject(_returnNSUIntegerBlock);
}

-(void)setReturnUIntegerBlock:(JobsReturnByNSUIntegerBlock _Nullable)returnNSUIntegerBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnNSUIntegerBlock, returnNSUIntegerBlock)
}

-(void)actionReturnNSUIntegerBlock:(JobsReturnByNSUIntegerBlock _Nullable)returnNSUIntegerBlock{
    self.returnNSUIntegerBlock = returnNSUIntegerBlock;
}
JobsKey(_returnCGFloatBlock)
@dynamic returnCGFloatBlock;
-(JobsReturnByCGFloatBlock _Nullable)returnCGFloatBlock{
    return Jobs_getAssociatedObject(_returnCGFloatBlock);
}

-(void)setReturnCGFloatBlock:(JobsReturnByCGFloatBlock _Nullable)returnCGFloatBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnCGFloatBlock, returnCGFloatBlock)
}

-(void)actionReturnCGFloatBlock:(JobsReturnByCGFloatBlock _Nullable)returnCGFloatBlock{
    self.returnCGFloatBlock = returnCGFloatBlock;
}
JobsKey(_returnBoolBlock)
@dynamic returnBoolBlock;
-(JobsReturnByBOOLBlock _Nullable)returnBoolBlock{
    return Jobs_getAssociatedObject(_returnBoolBlock);
}

-(void)setReturnBoolBlock:(JobsReturnByBOOLBlock _Nullable)returnBoolBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnBoolBlock, returnBoolBlock)
}

-(void)actionReturnBOOLBlock:(JobsReturnByBOOLBlock _Nullable)returnBoolBlock{
    self.returnBoolBlock = returnBoolBlock;
}
JobsKey(_returnBoolByNSUIntegerBlock)
@dynamic returnBoolByNSUIntegerBlock;
-(JobsReturnBOOLByNSUIntegerBlock _Nullable)returnBoolByNSUIntegerBlock{
    return Jobs_getAssociatedObject(_returnBoolByNSUIntegerBlock);
}

-(void)setReturnBoolByNSUIntegerBlock:(JobsReturnBOOLByNSUIntegerBlock _Nullable)returnBoolByNSUIntegerBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnBoolByNSUIntegerBlock, returnBoolByNSUIntegerBlock)
}

-(void)actionReturnBoolByNSUIntegerBlock:(JobsReturnBOOLByNSUIntegerBlock _Nullable)returnBoolByNSUIntegerBlock{
    self.returnBoolByNSUIntegerBlock = returnBoolByNSUIntegerBlock;
}
JobsKey(_returnIntBlock)
@dynamic returnIntBlock;
-(JobsReturnByIntBlock _Nullable)returnIntBlock{
    return Jobs_getAssociatedObject(_returnIntBlock);
}

-(void)setReturnIntBlock:(JobsReturnByIntBlock _Nullable)returnIntBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnIntBlock, returnIntBlock)
}

-(void)actionReturnIntBlock:(JobsReturnByIntBlock _Nullable)returnIntBlock{
    self.returnIntBlock = returnIntBlock;
}
JobsKey(_returnUnsignedIntBlock)
@dynamic returnUnsignedIntBlock;
-(JobsReturnByUnsignedIntBlock _Nullable)returnUnsignedIntBlock{
    return Jobs_getAssociatedObject(_returnUnsignedIntBlock);
}

-(void)setReturnUnsignedIntBlock:(JobsReturnByUnsignedIntBlock _Nullable)returnUnsignedIntBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnUnsignedIntBlock, returnUnsignedIntBlock)
}

-(void)actionReturnUnsignedIntBlock:(JobsReturnByUnsignedIntBlock _Nullable)returnUnsignedIntBlock{
    self.returnUnsignedIntBlock = returnUnsignedIntBlock;
}
JobsKey(_returnFloatBlock)
@dynamic returnFloatBlock;
-(JobsReturnByFloatBlock _Nullable)returnFloatBlock{
    return Jobs_getAssociatedObject(_returnFloatBlock);
}

-(void)setReturnFloatBlock:(JobsReturnByFloatBlock _Nullable)returnFloatBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnFloatBlock, returnFloatBlock)
}

-(void)actionReturnFloatBlock:(JobsReturnByFloatBlock _Nullable)returnFloatBlock{
    self.returnFloatBlock = returnFloatBlock;
}
JobsKey(_returnDoubleBlock)
@dynamic returnDoubleBlock;
-(JobsReturnByDoubleBlock _Nullable)returnDoubleBlock{
    return Jobs_getAssociatedObject(_returnDoubleBlock);
}

-(void)setReturnDoubleBlock:(JobsReturnByDoubleBlock _Nullable)returnDoubleBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnDoubleBlock, returnDoubleBlock)
}

-(void)actionReturnDoubleBlock:(JobsReturnByDoubleBlock _Nullable)returnDoubleBlock{
    self.returnDoubleBlock = returnDoubleBlock;
}
JobsKey(_returnCharBlock)
@dynamic returnCharBlock;
-(JobsReturnByCharBlock _Nullable)returnCharBlock{
    return Jobs_getAssociatedObject(_returnCharBlock);
}

-(void)setReturnCharBlock:(JobsReturnByCharBlock _Nullable)returnCharBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnCharBlock, returnCharBlock)
}

-(void)actionReturnCharBlock:(JobsReturnByCharBlock _Nullable)returnCharBlock{
    self.returnCharBlock = returnCharBlock;
}
JobsKey(_returnUnsignedCharBlock)
@dynamic returnUnsignedCharBlock;
-(JobsReturnByUnsignedCharBlock _Nullable)returnUnsignedCharBlock{
    return Jobs_getAssociatedObject(_returnUnsignedCharBlock);
}

-(void)setReturnUnsignedCharBlock:(JobsReturnByUnsignedCharBlock _Nullable)returnUnsignedCharBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnUnsignedCharBlock, returnUnsignedCharBlock)
}

-(void)actionReturnUnsignedCharBlock:(JobsReturnByUnsignedCharBlock _Nullable)returnUnsignedCharBlock{
    self.returnUnsignedCharBlock = returnUnsignedCharBlock;
}
JobsKey(_returnShortBlock)
@dynamic returnShortBlock;
-(JobsReturnByShortBlock _Nullable)returnShortBlock{
    return Jobs_getAssociatedObject(_returnShortBlock);
}

-(void)setReturnShortBlock:(JobsReturnByShortBlock _Nullable)returnShortBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnShortBlock, returnShortBlock)
}

-(void)actionReturnShortBlock:(JobsReturnByShortBlock _Nullable)returnShortBlock{
    self.returnShortBlock = returnShortBlock;
}
JobsKey(_returnUnsignedShortBlock)
@dynamic returnUnsignedShortBlock;
-(JobsReturnByUnsignedShortBlock _Nullable)returnUnsignedShortBlock{
    return Jobs_getAssociatedObject(_returnUnsignedShortBlock);
}

-(void)setReturnUnsignedShortBlock:(JobsReturnByUnsignedShortBlock _Nullable)returnUnsignedShortBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnUnsignedShortBlock, returnUnsignedShortBlock)
}

-(void)actionReturnUnsignedShortBlock:(JobsReturnByUnsignedShortBlock _Nullable)returnUnsignedShortBlock{
    self.returnUnsignedShortBlock = returnUnsignedShortBlock;
}
JobsKey(_returnLongBlock)
@dynamic returnLongBlock;
-(JobsReturnByNSIntegerBlock _Nullable)returnLongBlock{
    return Jobs_getAssociatedObject(_returnLongBlock);
}

-(void)setReturnLongBlock:(JobsReturnByNSIntegerBlock _Nullable)returnLongBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnLongBlock, returnLongBlock)
}

-(void)actionReturnLongBlock:(JobsReturnByLongBlock _Nullable)returnLongBlock{
    self.returnLongBlock = returnLongBlock;
}
JobsKey(_returnUnsignedLongBlock)
@dynamic returnUnsignedLongBlock;
-(JobsReturnByUnsignedLongBlock _Nullable)returnUnsignedLongBlock{
    return Jobs_getAssociatedObject(_returnUnsignedLongBlock);
}

-(void)setReturnUnsignedLongBlock:(JobsReturnByUnsignedLongBlock _Nullable)returnUnsignedLongBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnUnsignedLongBlock, returnUnsignedLongBlock)
}

-(void)actionReturnUnsignedLongBlock:(JobsReturnByUnsignedLongBlock _Nullable)returnUnsignedLongBlock{
    self.returnUnsignedLongBlock = returnUnsignedLongBlock;
}
JobsKey(_returnUnsignedLongLongBlock)
@dynamic returnUnsignedLongLongBlock;
-(JobsReturnByUnsignedLongLongBlock _Nullable)returnUnsignedLongLongBlock{
    return Jobs_getAssociatedObject(_returnUnsignedLongLongBlock);
}

-(void)setReturnUnsignedLongLongBlock:(JobsReturnByUnsignedLongLongBlock _Nullable)returnUnsignedLongLongBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnUnsignedLongLongBlock, returnUnsignedLongLongBlock)
}

-(void)actionReturnUnsignedLongLongBlock:(JobsReturnByUnsignedLongLongBlock _Nullable)returnUnsignedLongLongBlock{
    self.returnUnsignedLongLongBlock = returnUnsignedLongLongBlock;
}
JobsKey(_returnIDBySelectorBlock)
@dynamic returnIDBySelectorBlock;
-(JobsReturnIDBySelectorBlock _Nullable)returnIDBySelectorBlock{
    return Jobs_getAssociatedObject(_returnIDBySelectorBlock);
}

-(void)setReturnIDBySelectorBlock:(JobsReturnIDBySelectorBlock _Nullable)returnIDBySelectorBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnIDBySelectorBlock, returnIDBySelectorBlock)
}
#pragma mark —— 2.4、多入参（任意数据类型） ｜ 有返回（其他类型）值
-(void)actionReturnIDBySelectorBlock:(JobsReturnIDBySelectorBlock _Nullable)returnIDBySelectorBlock{
    self.returnIDBySelectorBlock = returnIDBySelectorBlock;
}

@end
