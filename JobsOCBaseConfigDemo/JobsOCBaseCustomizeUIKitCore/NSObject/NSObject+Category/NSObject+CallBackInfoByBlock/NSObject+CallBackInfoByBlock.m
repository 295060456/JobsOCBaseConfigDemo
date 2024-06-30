//
//  NSObject+CallBackInfoByBlock.m
//  DouDong-II
//
//  Created by Jobs on 2021/2/26.
//

#import "NSObject+CallBackInfoByBlock.h"

@implementation NSObject (CallBackInfoByBlock)
#pragma mark —— 1.1、无入参 ｜ 没有返回值
JobsKey(_voidBlock)
@dynamic voidBlock;
-(jobsByVoidBlock)voidBlock{
    return Jobs_getAssociatedObject(_voidBlock);
}

-(void)setVoidBlock:(jobsByVoidBlock)voidBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_voidBlock, voidBlock)
}

-(void)actionVoidBlock:(jobsByVoidBlock)voidBlock{
    self.voidBlock = voidBlock;
}
#pragma mark —— 1.2、（单一）入参 ｜ 无返回值
JobsKey(_objectBlock)
@dynamic objectBlock;
-(jobsByIDBlock)objectBlock{
    return Jobs_getAssociatedObject(_objectBlock);
}

-(void)setObjectBlock:(jobsByIDBlock)objectBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_objectBlock, objectBlock)
}

-(void)actionObjectBlock:(jobsByIDBlock)objectBlock{
    self.objectBlock = objectBlock;
}
JobsKey(_gestureRecognizerBlock)
@dynamic gestureRecognizerBlock;
-(jobsByGestureRecognizerBlock)gestureRecognizerBlock{
    return Jobs_getAssociatedObject(_gestureRecognizerBlock);
}

-(void)setGestureRecognizerBlock:(jobsByGestureRecognizerBlock)gestureRecognizerBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_gestureRecognizerBlock, gestureRecognizerBlock)
}
-(void)actionGestureRecognizerBlock:(jobsByGestureRecognizerBlock)gestureRecognizerBlock{
    self.gestureRecognizerBlock = gestureRecognizerBlock;
}
JobsKey(_selBlock)
@dynamic selBlock;
-(jobsBySELBlock)selBlock{
    return Jobs_getAssociatedObject(_selBlock);
}

-(void)setSelBlock:(jobsBySELBlock)selBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_selBlock, selBlock);
}
-(void)actionSELBlock:(jobsBySELBlock)selBlock{
    self.selBlock = selBlock;
}
JobsKey(_stringBlock)
@dynamic stringBlock;
-(jobsByStringBlock)stringBlock{
    return Jobs_getAssociatedObject(_stringBlock);
}

-(void)setStringBlock:(jobsByStringBlock)stringBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_stringBlock, stringBlock)
}

-(void)actionStringBlock:(jobsByStringBlock)stringBlock{
    self.stringBlock = stringBlock;
}
#pragma mark —— 1.3、（单一）入参为基本数据类型 ｜ 无返回值
JobsKey(_NSIntegerBlock)
@dynamic NSIntegerBlock;
-(jobsByNSIntegerBlock)NSIntegerBlock{
    return Jobs_getAssociatedObject(_NSIntegerBlock);
}

-(void)setNSIntegerBlock:(jobsByNSIntegerBlock)NSIntegerBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_NSIntegerBlock, NSIntegerBlock)
}

-(void)actionNSIntegerBlock:(jobsByNSIntegerBlock)NSIntegerBlock{
    self.NSIntegerBlock = NSIntegerBlock;
}
JobsKey(_NSUIntegerBlock)
@dynamic NSUIntegerBlock;
-(jobsByNSUIntegerBlock)NSUIntegerBlock{
    return Jobs_getAssociatedObject(_NSUIntegerBlock);
}

-(void)setNSUIntegerBlock:(jobsByNSUIntegerBlock)NSUIntegerBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_NSUIntegerBlock, NSUIntegerBlock)
}

-(void)actionNSUIntegerBlock:(jobsByNSUIntegerBlock)NSUIntegerBlock{
    self.NSUIntegerBlock = NSUIntegerBlock;
}
JobsKey(_CGFloatBlock)
@dynamic CGFloatBlock;
-(jobsByCGFloatBlock)CGFloatBlock{
    return Jobs_getAssociatedObject(_CGFloatBlock);
}

-(void)setCGFloatBlock:(jobsByCGFloatBlock)CGFloatBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_CGFloatBlock, CGFloatBlock)
}

-(void)actionCGFloatBlock:(jobsByCGFloatBlock)CGFloatBlock{
    self.CGFloatBlock = CGFloatBlock;
}
JobsKey(_BOOLBlock)
@dynamic BOOLBlock;
-(jobsByBOOLBlock)BOOLBlock{
    return Jobs_getAssociatedObject(_BOOLBlock);
}

-(void)setBOOLBlock:(jobsByBOOLBlock)BOOLBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_BOOLBlock, BOOLBlock)
}

-(void)actionBOOLBlock:(jobsByBOOLBlock)BOOLBlock{
    self.BOOLBlock = BOOLBlock;
}
JobsKey(_IntBlock)
@dynamic IntBlock;
-(jobsByIntBlock)IntBlock{
    return Jobs_getAssociatedObject(_IntBlock);
}

-(void)setIntBlock:(jobsByIntBlock)IntBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_IntBlock, IntBlock)
}

-(void)actionIntBlock:(jobsByIntBlock)IntBlock{
    self.IntBlock = IntBlock;
}
JobsKey(_UnsignedIntBlock)
@dynamic UnsignedIntBlock;
-(jobsByUnsignedIntBlock)UnsignedIntBlock{
    return Jobs_getAssociatedObject(_UnsignedIntBlock);
}

-(void)setUnsignedIntBlock:(jobsByUnsignedIntBlock)UnsignedIntBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_UnsignedIntBlock, UnsignedIntBlock)
}

-(void)actionUnsignedIntBlock:(jobsByUnsignedIntBlock)UnsignedIntBlock{
    self.UnsignedIntBlock = UnsignedIntBlock;
}
JobsKey(_FloatBlock)
@dynamic FloatBlock;
-(jobsByFloatBlock)FloatBlock{
    return Jobs_getAssociatedObject(_FloatBlock);
}

-(void)setFloatBlock:(jobsByFloatBlock)FloatBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_FloatBlock, FloatBlock)
}

-(void)actionFloatBlock:(jobsByFloatBlock)FloatBlock{
    self.FloatBlock = FloatBlock;
}
JobsKey(_DoubleBlock)
@dynamic DoubleBlock;
-(jobsByDoubleBlock)DoubleBlock{
    return Jobs_getAssociatedObject(_DoubleBlock);
}

-(void)setDoubleBlock:(jobsByDoubleBlock)DoubleBlock{
 Jobs_setAssociatedCOPY_NONATOMIC(_DoubleBlock, DoubleBlock)
}

-(void)actionDoubleBlock:(jobsByDoubleBlock)DoubleBlock{
    self.DoubleBlock = DoubleBlock;
}
JobsKey(_CharBlock)
@dynamic CharBlock;
-(jobsByCharBlock)CharBlock{
    return Jobs_getAssociatedObject(_CharBlock);
}

-(void)setCharBlock:(jobsByCharBlock)CharBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_CharBlock, CharBlock)
}

-(void)actionCharBlock:(jobsByCharBlock)CharBlock{
    self.CharBlock = CharBlock;
}
JobsKey(_UnsignedCharBlock)
@dynamic UnsignedCharBlock;
-(jobsByUnsignedCharBlock)UnsignedCharBlock{
    return Jobs_getAssociatedObject(_UnsignedCharBlock);
}

-(void)setUnsignedCharBlock:(jobsByUnsignedCharBlock)UnsignedCharBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_UnsignedCharBlock, UnsignedCharBlock)
}

-(void)actionUnsignedCharBlock:(jobsByUnsignedCharBlock)UnsignedCharBlock{
    self.UnsignedCharBlock = UnsignedCharBlock;
}
JobsKey(_ShortBlock)
@dynamic ShortBlock;
-(jobsByShortBlock)ShortBlock{
    return Jobs_getAssociatedObject(_ShortBlock);
}

-(void)setShortBlock:(jobsByShortBlock)ShortBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_ShortBlock, ShortBlock)
}

-(void)actionShortBlock:(jobsByShortBlock)ShortBlock{
    self.ShortBlock = ShortBlock;
}
JobsKey(_UnsignedShortBlock)
@dynamic UnsignedShortBlock;
-(jobsByUnsignedShortBlock)UnsignedShortBlock{
    return Jobs_getAssociatedObject(_UnsignedShortBlock);
}

-(void)setUnsignedShortBlock:(jobsByUnsignedShortBlock)UnsignedShortBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_UnsignedShortBlock, UnsignedShortBlock)
}

-(void)actionUnsignedShortBlock:(jobsByUnsignedShortBlock)UnsignedShortBlock{
    self.UnsignedShortBlock = UnsignedShortBlock;
}
JobsKey(_LongBlock)
@dynamic LongBlock;
-(jobsByLongBlock)LongBlock{
    return Jobs_getAssociatedObject(_LongBlock);
}

-(void)setLongBlock:(jobsByLongBlock)LongBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_LongBlock, LongBlock)
}

-(void)actionLongBlock:(jobsByLongBlock)LongBlock{
    self.LongBlock = LongBlock;
}
JobsKey(_UnsignedLongBlock)
@dynamic UnsignedLongBlock;
-(jobsByUnsignedLongBlock)UnsignedLongBlock{
    return Jobs_getAssociatedObject(_UnsignedLongBlock);
}

-(void)setUnsignedLongBlock:(jobsByUnsignedLongBlock)UnsignedLongBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_UnsignedLongBlock, UnsignedLongBlock)
}

-(void)actionUnsignedLongBlock:(jobsByUnsignedLongBlock)UnsignedLongBlock{
    self.UnsignedLongBlock = UnsignedLongBlock;
}
JobsKey(_UnsignedLongLongBlock)
@dynamic UnsignedLongLongBlock;
-(jobsByUnsignedLongLongBlock)UnsignedLongLongBlock{
    return Jobs_getAssociatedObject(_UnsignedLongLongBlock);
}

-(void)setUnsignedLongLongBlock:(jobsByUnsignedLongLongBlock)UnsignedLongLongBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_UnsignedLongLongBlock, UnsignedLongLongBlock)
}

-(void)actionUnsignedLongLongBlock:(jobsByUnsignedLongLongBlock)UnsignedLongLongBlock{
    self.UnsignedLongLongBlock = UnsignedLongLongBlock;
}
#pragma mark —— 1.4、多入参（任意数据类型） ｜ 无返回值
JobsKey(_SelectorBlock)
@dynamic SelectorBlock;
-(JobsSelectorBlock)returnSelectorBlock{
    return Jobs_getAssociatedObject(_returnObjectBySELBlock);
}

-(void)setSelectorBlock:(JobsSelectorBlock)selectorBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_SelectorBlock, selectorBlock)
}

-(void)actionSelectorBlock:(JobsSelectorBlock)selectorBlock{
    self.SelectorBlock = selectorBlock;
}
#pragma mark —— 2.1、无入参 ｜ 有返回值
JobsKey(_returnObjectBySELBlock)
@dynamic returnObjectBySELBlock;
-(JobsReturnIDBySELBlock)returnObjectBySELBlock{
    return Jobs_getAssociatedObject(_returnObjectBySELBlock);
}

-(void)setReturnObjectBySELBlock:(JobsReturnIDBySELBlock)returnObjectBySELBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnObjectBySELBlock, returnObjectBySELBlock)
}

-(void)actionReturnIDBySELBlock:(JobsReturnIDBySELBlock)returnObjectBySELBlock{
    self.returnObjectBySELBlock = returnObjectBySELBlock;
}
JobsKey(_returnObjectByVoidBlock)
@dynamic returnObjectByVoidBlock;
-(JobsReturnIDByVoidBlock)returnObjectByVoidBlock{
    return Jobs_getAssociatedObject(_returnObjectByVoidBlock);
}

-(void)setReturnObjectByVoidBlock:(JobsReturnIDByVoidBlock)returnObjectByVoidBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnObjectByVoidBlock, returnObjectByVoidBlock)
}

-(void)actionReturnIDByVoidBlock:(JobsReturnIDByVoidBlock)returnObjectByVoidBlock{
    self.returnObjectByVoidBlock = returnObjectByVoidBlock;
}
#pragma mark —— 2.2、（单一）入参 ｜ （其他数据类型）返回值
JobsKey(_returnObjectByGestureRecognizerBlock)
@dynamic returnObjectByGestureRecognizerBlock;
-(JobsReturnIDByGestureRecognizerBlock)returnObjectByGestureRecognizerBlock{
    return Jobs_getAssociatedObject(_returnObjectByGestureRecognizerBlock);
}

-(void)setReturnObjectByGestureRecognizerBlock:(JobsReturnIDByGestureRecognizerBlock)returnObjectByGestureRecognizerBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnObjectByGestureRecognizerBlock, returnObjectByGestureRecognizerBlock)
}

-(void)actionReturnIDByGestureRecognizerBlock:(JobsReturnIDByGestureRecognizerBlock)returnObjectByGestureRecognizerBlock{
    self.returnObjectByGestureRecognizerBlock = returnObjectByGestureRecognizerBlock;
}

JobsKey(_returnObjectByStringBlock)
@dynamic returnObjectByStringBlock;
-(JobsReturnIDByStringBlock)returnObjectByStringBlock{
    return Jobs_getAssociatedObject(_returnObjectByStringBlock);
}

-(void)setReturnObjectByStringBlock:(JobsReturnIDByStringBlock)returnObjectByStringBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnObjectByStringBlock, returnObjectByStringBlock)
}
-(void)actionReturnIDByStringBlock:(JobsReturnIDByStringBlock)returnObjectByStringBlock{
    self.returnObjectByStringBlock = returnObjectByStringBlock;
}
JobsKey(_returnNSIntegerByIDBlock)
@dynamic returnNSIntegerByIDBlock;
-(JobsReturnNSIntegerByIDBlock)returnNSIntegerByIDBlock{
    return Jobs_getAssociatedObject(_returnNSIntegerByIDBlock);
}

-(void)setReturnNSIntegerByIDBlock:(JobsReturnNSIntegerByIDBlock)returnNSIntegerByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnNSIntegerByIDBlock, returnNSIntegerByIDBlock)
}

-(void)actionReturnNSIntegerByIDBlock:(JobsReturnNSIntegerByIDBlock)returnNSIntegerByIDBlock{
    self.returnNSIntegerByIDBlock = returnNSIntegerByIDBlock;
}
JobsKey(_returnNSUIntegerByIDBlock)
@dynamic returnNSUIntegerByIDBlock;
-(JobsReturnNSUIntegerByIDBlock)returnNSUIntegerByIDBlock{
    return Jobs_getAssociatedObject(_returnNSUIntegerByIDBlock);
}

-(void)setReturnNSUIntegerByIDBlock:(JobsReturnNSUIntegerByIDBlock)returnNSUIntegerByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnNSUIntegerByIDBlock, returnNSUIntegerByIDBlock)
}

-(void)actionReturnNSUIntegerByIDBlock:(JobsReturnNSUIntegerByIDBlock)returnNSUIntegerByIDBlock{
    self.returnNSUIntegerByIDBlock = returnNSUIntegerByIDBlock;
}
JobsKey(_returnCGFloatByIDBlock)
@dynamic returnCGFloatByIDBlock;
-(JobsReturnCGFloatByIDBlock)returnCGFloatByIDBlock{
    return Jobs_getAssociatedObject(_returnCGFloatByIDBlock);
}

-(void)setReturnCGFloatByIDBlock:(JobsReturnCGFloatByIDBlock)returnCGFloatByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnCGFloatByIDBlock, returnCGFloatByIDBlock)
}

-(void)actionReturnCGFloatByIDBlock:(JobsReturnCGFloatByIDBlock)returnCGFloatByIDBlock{
    self.returnCGFloatByIDBlock = returnCGFloatByIDBlock;
}
JobsKey(_returnBOOLByIDBlock)
@dynamic returnBOOLByIDBlock;
-(JobsReturnBOOLByIDBlock)returnBOOLByIDBlock{
    return Jobs_getAssociatedObject(_returnBOOLByIDBlock);
}

-(void)setReturnBOOLByIDBlock:(JobsReturnBOOLByIDBlock)returnBOOLByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnBOOLByIDBlock, returnBOOLByIDBlock);
}

-(void)actionReturnBOOLByIDBlock:(JobsReturnBOOLByIDBlock)returnBOOLByIDBlock{
    self.returnBOOLByIDBlock = returnBOOLByIDBlock;
}
JobsKey(_returnIntByIDBlock)
@dynamic returnIntByIDBlock;
-(JobsReturnIntByIDBlock)returnIntByIDBlock{
    return Jobs_getAssociatedObject(_returnIntByIDBlock);
}

-(void)setReturnIntByIDBlock:(JobsReturnIntByIDBlock)returnIntByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnIntByIDBlock, returnIntByIDBlock)
}

-(void)actionReturnIntByIDBlock:(JobsReturnIntByIDBlock)returnIntByIDBlock{
    self.returnIntByIDBlock = returnIntByIDBlock;
}
JobsKey(_returnUnsignedIntByIDBlock)
@dynamic returnUnsignedIntByIDBlock;
-(JobsReturnUnsignedIntByIDBlock)returnUnsignedIntByIDBlock{
    return Jobs_getAssociatedObject(_returnUnsignedIntByIDBlock);
}

-(void)setReturnUnsignedIntByIDBlock:(JobsReturnUnsignedIntByIDBlock)returnUnsignedIntByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnUnsignedIntByIDBlock,returnUnsignedIntByIDBlock)
}

-(void)actionReturnUnsignedIntByIDBlock:(JobsReturnUnsignedIntByIDBlock)returnUnsignedIntByIDBlock{
    self.returnUnsignedIntByIDBlock = returnUnsignedIntByIDBlock;
}
JobsKey(_returnFloatByIDBlock)
@dynamic returnFloatByIDBlock;
-(JobsReturnFloatByIDBlock)returnFloatByIDBlock{
    return Jobs_getAssociatedObject(_returnFloatByIDBlock);
}

-(void)setReturnFloatByIDBlock:(JobsReturnFloatByIDBlock)returnFloatByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnFloatByIDBlock, returnFloatByIDBlock)
}

-(void)actionReturnFloatByIDBlock:(JobsReturnFloatByIDBlock)returnFloatByIDBlock{
    self.returnFloatByIDBlock = returnFloatByIDBlock;
}
JobsKey(_returnDoubleByIDBlock)
@dynamic returnDoubleByIDBlock;
-(JobsReturnDoubleByIDBlock)returnDoubleByIDBlock{
    return Jobs_getAssociatedObject(_returnDoubleByIDBlock);
}

-(void)setReturnDoubleByIDBlock:(JobsReturnDoubleByIDBlock)returnDoubleByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnDoubleByIDBlock, returnDoubleByIDBlock)
}

-(void)actionReturnDoubleByIDBlock:(JobsReturnDoubleByIDBlock)returnDoubleByIDBlock{
    self.returnDoubleByIDBlock = returnDoubleByIDBlock;
}
JobsKey(_returnCharByIDBlock)
@dynamic returnCharByIDBlock;
-(JobsReturnCharByIDBlock)returnCharByIDBlock{
    return Jobs_getAssociatedObject(_returnCharByIDBlock);
}

-(void)setReturnCharByIDBlock:(JobsReturnCharByIDBlock)returnCharByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnCharByIDBlock, returnCharByIDBlock)
}

-(void)actionReturnCharByIDBlock:(JobsReturnCharByIDBlock)returnCharByIDBlock{
    self.returnCharByIDBlock = returnCharByIDBlock;
}
JobsKey(_returnUnsignedCharByIDBlock)
@dynamic returnUnsignedCharByIDBlock;
-(JobsReturnUnsignedCharByIDBlock)returnUnsignedCharByIDBlock{
    return Jobs_getAssociatedObject(_returnUnsignedCharByIDBlock);
}

-(void)setReturnUnsignedCharByIDBlock:(JobsReturnUnsignedCharByIDBlock)returnUnsignedCharByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnUnsignedCharByIDBlock, returnUnsignedCharByIDBlock)
}

-(void)actionReturnUnsignedCharByIDBlock:(JobsReturnUnsignedCharByIDBlock)returnUnsignedCharByIDBlock{
    self.returnUnsignedCharByIDBlock = returnUnsignedCharByIDBlock;
}
JobsKey(_returnShortByIDBlock)
@dynamic returnShortByIDBlock;
-(JobsReturnShortByIDBlock)returnShortByIDBlock{
    return Jobs_getAssociatedObject(_returnShortByIDBlock);
}

-(void)setReturnShortByIDBlock:(JobsReturnShortByIDBlock)returnShortByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnShortByIDBlock, returnShortByIDBlock)
}

-(void)actionReturnShortByIDBlock:(JobsReturnShortByIDBlock)returnShortByIDBlock{
    self.returnShortByIDBlock = returnShortByIDBlock;
}
JobsKey(_returnUnsignedShortByIDBlock)
@dynamic returnUnsignedShortByIDBlock;
-(JobsReturnUnsignedShortByIDBlock)returnUnsignedShortByIDBlock{
    return Jobs_getAssociatedObject(_returnUnsignedShortByIDBlock);
}

-(void)setReturnUnsignedShortByIDBlock:(JobsReturnUnsignedShortByIDBlock)returnUnsignedShortByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnUnsignedShortByIDBlock, returnUnsignedShortByIDBlock)
}

-(void)actionReturnUnsignedShortByIDBlock:(JobsReturnUnsignedShortByIDBlock)returnUnsignedShortByIDBlock{
    self.returnUnsignedShortByIDBlock = returnUnsignedShortByIDBlock;
}
JobsKey(_returnLongByIDBlock)
@dynamic returnLongByIDBlock;
-(JobsReturnLongByIDBlock)returnLongByIDBlock{
    return Jobs_getAssociatedObject(_returnLongByIDBlock);
}

-(void)setReturnLongByIDBlock:(JobsReturnLongByIDBlock)returnLongByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnLongByIDBlock, returnLongByIDBlock)
}

-(void)actionReturnLongByIDBlock:(JobsReturnLongByIDBlock)returnLongByIDBlock{
    self.returnLongByIDBlock = returnLongByIDBlock;
}
JobsKey(_returnUnsignedLongByIDBlock)
@dynamic returnUnsignedLongByIDBlock;
-(JobsReturnUnsignedLongByIDBlock)returnUnsignedLongByIDBlock{
    return Jobs_getAssociatedObject(_returnUnsignedLongByIDBlock);
}

-(void)setReturnUnsignedLongByIDBlock:(JobsReturnUnsignedLongByIDBlock)returnUnsignedLongByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnUnsignedLongByIDBlock, returnUnsignedLongByIDBlock)
}

-(void)actionReturnUnsignedLongByIDBlock:(JobsReturnUnsignedLongByIDBlock)returnUnsignedLongByIDBlock{
    self.returnUnsignedLongByIDBlock = returnUnsignedLongByIDBlock;
}
JobsKey(_returnUnsignedLongLongByIDBlock)
@dynamic returnUnsignedLongLongByIDBlock;
-(JobsReturnUnsignedLongLongByIDBlock)returnUnsignedLongLongByIDBlock{
    return Jobs_getAssociatedObject(_returnUnsignedLongLongByIDBlock);
}

-(void)setReturnUnsignedLongLongByIDBlock:(JobsReturnUnsignedLongLongByIDBlock)returnUnsignedLongLongByIDBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnUnsignedLongLongByIDBlock, returnUnsignedLongLongByIDBlock)
}

-(void)actionReturnUnsignedLongLongByIDBlock:(JobsReturnUnsignedLongLongByIDBlock)returnUnsignedLongLongByIDBlock{
    self.returnUnsignedLongLongByIDBlock = returnUnsignedLongLongByIDBlock;
}
#pragma mark —— 2.3、（单一）入参 ｜ 返回（入参类型）值
JobsKey(_returnObjectBlock)
@dynamic returnObjectBlock;
-(JobsReturnIDByIDBlock)returnObjectBlock{
    return Jobs_getAssociatedObject(_returnObjectBlock);
}

-(void)setReturnObjectBlock:(JobsReturnIDByIDBlock)returnObjectBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnObjectBlock, returnObjectBlock)
}

-(void)actionReturnObjectBlock:(JobsReturnIDByIDBlock)returnObjectBlock{
    self.returnObjectBlock = returnObjectBlock;
}
JobsKey(_returnNSIntegerBlock)
@dynamic returnNSIntegerBlock;
-(JobsReturnByNSIntegerBlock)returnNSIntegerBlock{
    return Jobs_getAssociatedObject(_returnNSIntegerBlock);
}

-(void)setReturnNSIntegerBlock:(JobsReturnByNSIntegerBlock)returnNSIntegerBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnNSIntegerBlock, returnNSIntegerBlock)
}

-(void)actionReturnNSIntegerBlock:(JobsReturnByNSIntegerBlock)returnNSIntegerBlock{
    self.returnNSIntegerBlock = returnNSIntegerBlock;
}
JobsKey(_returnNSUIntegerBlock)
@dynamic returnNSUIntegerBlock;
-(JobsReturnByNSUIntegerBlock)returnNSUIntegerBlock{
    return Jobs_getAssociatedObject(_returnNSUIntegerBlock);
}

-(void)setReturnUIntegerBlock:(JobsReturnByNSUIntegerBlock)returnNSUIntegerBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnNSUIntegerBlock, returnNSUIntegerBlock)
}

-(void)actionReturnNSUIntegerBlock:(JobsReturnByNSUIntegerBlock)returnNSUIntegerBlock{
    self.returnNSUIntegerBlock = returnNSUIntegerBlock;
}
JobsKey(_returnCGFloatBlock)
@dynamic returnCGFloatBlock;
-(JobsReturnByCGFloatBlock)returnCGFloatBlock{
    return Jobs_getAssociatedObject(_returnCGFloatBlock);
}

-(void)setReturnCGFloatBlock:(JobsReturnByCGFloatBlock)returnCGFloatBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnCGFloatBlock, returnCGFloatBlock)
}

-(void)actionReturnCGFloatBlock:(JobsReturnByCGFloatBlock)returnCGFloatBlock{
    self.returnCGFloatBlock = returnCGFloatBlock;
}
JobsKey(_returnBOOLBlock)
@dynamic returnBOOLBlock;
-(JobsReturnByBOOLBlock)returnBOOLBlock{
    return Jobs_getAssociatedObject(_returnBOOLBlock);
}

-(void)setReturnBOOLBlock:(JobsReturnByBOOLBlock)returnBOOLBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnBOOLBlock, returnBOOLBlock)
}

-(void)actionReturnBOOLBlock:(JobsReturnByBOOLBlock)returnBOOLBlock{
    self.returnBOOLBlock = returnBOOLBlock;
}
JobsKey(_returnIntBlock)
@dynamic returnIntBlock;
-(JobsReturnByIntBlock)returnIntBlock{
    return Jobs_getAssociatedObject(_returnIntBlock);
}

-(void)setReturnIntBlock:(JobsReturnByIntBlock)returnIntBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnIntBlock, returnIntBlock)
}

-(void)actionReturnIntBlock:(JobsReturnByIntBlock)returnIntBlock{
    self.returnIntBlock = returnIntBlock;
}
JobsKey(_returnUnsignedIntBlock)
@dynamic returnUnsignedIntBlock;
-(JobsReturnByUnsignedIntBlock)returnUnsignedIntBlock{
    return Jobs_getAssociatedObject(_returnUnsignedIntBlock);
}

-(void)setReturnUnsignedIntBlock:(JobsReturnByUnsignedIntBlock)returnUnsignedIntBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnUnsignedIntBlock, returnUnsignedIntBlock)
}

-(void)actionReturnUnsignedIntBlock:(JobsReturnByUnsignedIntBlock)returnUnsignedIntBlock{
    self.returnUnsignedIntBlock = returnUnsignedIntBlock;
}
JobsKey(_returnFloatBlock)
@dynamic returnFloatBlock;
-(JobsReturnByFloatBlock)returnFloatBlock{
    return Jobs_getAssociatedObject(_returnFloatBlock);
}

-(void)setReturnFloatBlock:(JobsReturnByFloatBlock)returnFloatBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnFloatBlock, returnFloatBlock)
}

-(void)actionReturnFloatBlock:(JobsReturnByFloatBlock)returnFloatBlock{
    self.returnFloatBlock = returnFloatBlock;
}
JobsKey(_returnDoubleBlock)
@dynamic returnDoubleBlock;
-(JobsReturnByDoubleBlock)returnDoubleBlock{
    return Jobs_getAssociatedObject(_returnDoubleBlock);
}

-(void)setReturnDoubleBlock:(JobsReturnByDoubleBlock)returnDoubleBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnDoubleBlock, returnDoubleBlock)
}

-(void)actionReturnDoubleBlock:(JobsReturnByDoubleBlock)returnDoubleBlock{
    self.returnDoubleBlock = returnDoubleBlock;
}
JobsKey(_returnCharBlock)
@dynamic returnCharBlock;
-(JobsReturnByCharBlock)returnCharBlock{
    return Jobs_getAssociatedObject(_returnCharBlock);
}

-(void)setReturnCharBlock:(JobsReturnByCharBlock)returnCharBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnCharBlock, returnCharBlock)
}

-(void)actionReturnCharBlock:(JobsReturnByCharBlock)returnCharBlock{
    self.returnCharBlock = returnCharBlock;
}
JobsKey(_returnUnsignedCharBlock)
@dynamic returnUnsignedCharBlock;
-(JobsReturnByUnsignedCharBlock)returnUnsignedCharBlock{
    return Jobs_getAssociatedObject(_returnUnsignedCharBlock);
}

-(void)setReturnUnsignedCharBlock:(JobsReturnByUnsignedCharBlock)returnUnsignedCharBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnUnsignedCharBlock, returnUnsignedCharBlock)
}

-(void)actionReturnUnsignedCharBlock:(JobsReturnByUnsignedCharBlock)returnUnsignedCharBlock{
    self.returnUnsignedCharBlock = returnUnsignedCharBlock;
}
JobsKey(_returnShortBlock)
@dynamic returnShortBlock;
-(JobsReturnByShortBlock)returnShortBlock{
    return Jobs_getAssociatedObject(_returnShortBlock);
}

-(void)setReturnShortBlock:(JobsReturnByShortBlock)returnShortBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnShortBlock, returnShortBlock)
}

-(void)actionReturnShortBlock:(JobsReturnByShortBlock)returnShortBlock{
    self.returnShortBlock = returnShortBlock;
}
JobsKey(_returnUnsignedShortBlock)
@dynamic returnUnsignedShortBlock;
-(JobsReturnByUnsignedShortBlock)returnUnsignedShortBlock{
    return Jobs_getAssociatedObject(_returnUnsignedShortBlock);
}

-(void)setReturnUnsignedShortBlock:(JobsReturnByUnsignedShortBlock)returnUnsignedShortBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnUnsignedShortBlock, returnUnsignedShortBlock)
}

-(void)actionReturnUnsignedShortBlock:(JobsReturnByUnsignedShortBlock)returnUnsignedShortBlock{
    self.returnUnsignedShortBlock = returnUnsignedShortBlock;
}
JobsKey(_returnLongBlock)
@dynamic returnLongBlock;
-(JobsReturnByNSIntegerBlock)returnLongBlock{
    return Jobs_getAssociatedObject(_returnLongBlock);
}

-(void)setReturnLongBlock:(JobsReturnByNSIntegerBlock)returnLongBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnLongBlock, returnLongBlock)
}

-(void)actionReturnLongBlock:(JobsReturnByLongBlock)returnLongBlock{
    self.returnLongBlock = returnLongBlock;
}
JobsKey(_returnUnsignedLongBlock)
@dynamic returnUnsignedLongBlock;
-(JobsReturnByUnsignedLongBlock)returnUnsignedLongBlock{
    return Jobs_getAssociatedObject(_returnUnsignedLongBlock);
}

-(void)setReturnUnsignedLongBlock:(JobsReturnByUnsignedLongBlock)returnUnsignedLongBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnUnsignedLongBlock, returnUnsignedLongBlock)
}

-(void)actionReturnUnsignedLongBlock:(JobsReturnByUnsignedLongBlock)returnUnsignedLongBlock{
    self.returnUnsignedLongBlock = returnUnsignedLongBlock;
}
JobsKey(_returnUnsignedLongLongBlock)
@dynamic returnUnsignedLongLongBlock;
-(JobsReturnByUnsignedLongLongBlock)returnUnsignedLongLongBlock{
    return Jobs_getAssociatedObject(_returnUnsignedLongLongBlock);
}

-(void)setReturnUnsignedLongLongBlock:(JobsReturnByUnsignedLongLongBlock)returnUnsignedLongLongBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnUnsignedLongLongBlock, returnUnsignedLongLongBlock)
}

-(void)actionReturnUnsignedLongLongBlock:(JobsReturnByUnsignedLongLongBlock)returnUnsignedLongLongBlock{
    self.returnUnsignedLongLongBlock = returnUnsignedLongLongBlock;
}
JobsKey(_returnIDBySelectorBlock)
@dynamic returnIDBySelectorBlock;
-(JobsReturnIDBySelectorBlock)returnIDBySelectorBlock{
    return Jobs_getAssociatedObject(_returnIDBySelectorBlock);
}

-(void)setReturnIDBySelectorBlock:(JobsReturnIDBySelectorBlock)returnIDBySelectorBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_returnIDBySelectorBlock, returnIDBySelectorBlock)
}
#pragma mark —— 2.4、多入参（任意数据类型） ｜ 有返回（其他类型）值
-(void)actionReturnIDBySelectorBlock:(JobsReturnIDBySelectorBlock)returnIDBySelectorBlock{
    self.returnIDBySelectorBlock = returnIDBySelectorBlock;
}

@end
