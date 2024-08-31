//
//  OCDynamicRegisterVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/9.
//

#import "OCDynamicRegisterVC.h"

@interface OCDynamicRegisterVC (){
    Class newClass;
}

@end 
/**
 资料来源：
 https://cloud.tencent.com/developer/article/1799505
 http://southpeak.github.io/2014/10/25/objective-c-runtime-1/
 https://github.com/zhiyongzou/DynamicOC
 
 */
@implementation OCDynamicRegisterVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    //    JobsRemoveNotification(self);
    if (NSClassFromString(@"newClass")) objc_disposeClassPair(newClass);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    
    {
        self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
        self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
        self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
        self.viewModel.textModel.font = UIFontWeightRegularSize(16);
        
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
        self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    //    self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
        self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
        self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsRandomColor;
    self.setGKNav(nil);
    self.setGKNavBackBtn(nil);
    self.gk_navigationBar.jobsVisible = YES;
    
//    [self msgSend];
    [self work];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [OCDynamic Test];
    
    OCDynamic *dynamic = OCDynamic.new;
    [dynamic test];
    
    DynamicInvoke.new;
}
/**
 参考资料：https://www.iloveanan.com/new-prototype-of-objc_msgsend.html
 
 ABI的匹配：对于原来的实现，最后的参数是一个可变参数，在转化成最终的函数调用时，系统需要将其转化成“固定”参数的调用。比如按照定义，调用者将参数 self 放入某个寄存器来传递，执行者去该寄存器取该参数，并认为是该类型的。但问题是，如果两者不一致问题就打了。而不同处理器架构上，这样的处理过程是不一样的。
 
     【Intel 架构对可变参数函数的处理】
      对标准的System V ABI for x86-64，参数是这样传递到寄存器的：
     
        整型参数：依次使用 rdi, rsi, rcx, r8 和 r9。
        浮点参数：使用 SSE 寄存器 xmm0 ~ xmm7 (每个128位)
        当调用含可变参数函数时，可变参数的实际个数使用寄存器 al 存储；整型返回值放置在 rax 和 rdx，浮点型返回值放置在 xmm0 和 xmm1。
        但是，当调用可变参数函数时，C语言中会将某些特定的数据类型字节数变宽：比 int 字节数少的会使用 int 的字节宽度，float 会使用 double 的字节数。对于整型数据而言，这不会有影响，因为数据优先存储在低位，高位为零。但是对于浮点数而言，float和double各个位数的定义不一样，不能像整型那样简单地进行高位填充。因此， 对于含可变参数的函数而言，传 float 类型的参数就会造成错误。
     
     【ARM64 架构对可变参数函数的处理】
      众所周知，iOS上使用的 ARM64 处理器，其使用的是 ARM64 标准 ABI 的变体：

        整型参数：依次使用 x0 ~ x7。
        浮点参数：依次使用 v0 ~ v7。
        其余参数存储在栈上，返回值放置在对应的传参寄存器中。
        对于含可变参数的函数，可变参数一直放置在栈上。因此，对于固定参数函数和可变参数函数而言，ABI 就不一致了。
 
 严格的类型检查可以降低代码出现异常的几率，因此：
 1、尽量使用“新”的 objc_msgSend 如果需要自己传递消息
 2、对 Mac 平台，使用可变参数形式的 objc_msgSend 时要注意避免 float 参数
 
 */
-(void)msgSend{
    /// macOS升级到10.15后，宏OBJC_OLD_DISPATCH_PROTOTYPES的值变为0，导致objc_msgSend 定义发生变化
    /// 使用 objc_msgSend 的时候，要需要将Xcode中build setting中的 Enbale Strict of Checking of objc_msgSend Calls 设置为 NO。这样才不会报警告。（搜索objc_msgSend）
    
    /// 无返回值的调用
    ((void (*)(id, SEL, float)) objc_msgSend)(self, @selector(sendObjMsg:), (float)M_PI);
    /// 有返回值的调用，需要注明返回类型
    id f = ((NSString * (*)(id, SEL, float)) objc_msgSend)(self, @selector(sendObjMsg:), (float)M_PI);
    NSLog(@"");
}

-(NSString *)sendObjMsg: (float)x{
    NSLog(@"");
    return @"Jobs";
}

-(void)work{
    /// 动态创建类
    Class MyClass = [self createClass:@"dynaminClass"];
    /// 各种添加赋值
    [self addProperty:@"jackName"];
    [self addIvarStr:@"jobsName"];
    [self addMethod];
    [self addProtocol];
    /// 注册到内存
    [self registerClass:MyClass];
    id myobjc = [self createInstanceByClass:@"dynaminClass"];
    /// 通过KVC的方式给myObj对象的jobsName属性赋值
    [myobjc setValue:@"我是Jobs" forKey:@"jobsName"];// ⚠️注意⚠️：此时，运行程序后会报错。这是因为我只添加了属性，并没有给属性添加对应的setter和getter
    /// 添加对应的setter和getter
    /**
     方法签名由方法名称和一个参数列表（方法的参数的顺序和类型）组成
     注意：方法签名不包括方法的返回类型。不包括返回值和访问修饰符
     第一个参数是在哪个类中添加方法
     第二个参数是所添加方法的编号SEL
     第三个参数是所添加方法的函数实现的指针IMP
     第四个参数是所添加方法的签名
     */
    class_addMethod(MyClass,
                    @selector(setJobsName:),
                    (IMP)jobsNameSetter,
                    "v@:@");
    class_addMethod(MyClass,
                    @selector(jobsName),
                    (IMP)jobsName,
                    "@@:");
    
    id A = [myobjc performSelector:@selector(setJobsName:) withObject:@"bmw"];
    id B = [myobjc performSelector:@selector(jobsName) withObject:nil];
    NSLog(@"");
    /// 如果不调用- (void)addMethodForMyClass:(NSString *)string 这个方法，就不会调用static void addMethodForMyClass(id self, SEL _cmd, NSString *test) 函数
//    [myobjc addMethodForMyClass:@"参数"];
}
// setter
void jobsNameSetter(NSString *value){
    printf("%s/n",__func__);
}
// getter
NSString *jobsName(){
    printf("%s/n",__func__);
    return @"master NB";
}
#pragma mark —— 一些私有方法
/// 动态创建类并添加：成员变量、属性、方法、协议
-(Class)createClass:(NSString *)className {
    if (!NSClassFromString(className)) {
        /// ❤️添加一个集成NSObject的类  类名是className；注意：调用的c语言的方法  所以不要使用JobsInternationalization(@"")表示字符串 应该使用""❤️
        /// 我们如果使用objc_allocateClassPair函数来创建一个类对象失败了，那么objc_allocateClassPair就会返回Nil。如果所要创建的类已经存在了，那么就会返回Nil.
        newClass = objc_allocateClassPair(OCDynamic.class,/// 第一个参数是父类对象，如果传nil那么新创建的类就是跟NSObject同等级别的根类对象;
                                          className.UTF8String,/// 第二个参数是本类类名;
                                          0);/// 第三个参数是初始的内存空间大小;
        return newClass;
/*
 1、objc_registerClassPair函数是将创建的类对象加载到内存，加载完成之后，本类中的ro就已经确定了;
 2、我们知道，ro是只读的，它在确定之后就不可以动态增加内容了，如果我们想在运行时增加一些内容，只能是往rw中去增加;
 3、存储成员变量的数组ivars只在ro中有，rw中是没有ivars的;
 4、因此，成员变量在ro初始化了之后就不能再继续动态新增了;
 5、所以，必须在ro初始化之前（即在调用objc_registerClassPair函数之前）完成成员变量的定义;
 6、rw的结构，可以看到是有methods、properties和protocols三个变量的

 结论：
 1、【在类注册完成之后，不可以继续添加成员变量了】
 2、【所以，在类注册完成之后，可以继续添加方法、属性和协议】
 */
    }return NSClassFromString(className);
}
/// 【添加属性】
-(void)addProperty:(NSString *)propertyName{
    jobs_class_addProperty(newClass, propertyName.UTF8String);
}
/// 【添加方法】
-(void)addMethod{
    /**
     方法签名由方法名称和一个参数列表（方法的参数的顺序和类型）组成
     注意：方法签名不包括方法的返回类型。不包括返回值和访问修饰符
     */
    class_addMethod(newClass,/// 第一个参数是在哪个类中添加方法
                    @selector(test),/// 第二个参数是所添加方法的编号SEL
                    (IMP)funcIMP,/// 第三个参数是所添加方法的函数实现的指针IMP
                    "v@:");/// 第四个参数是所添加方法的签名
}
/// 【添加协议】❤️
-(void)addProtocol{
    
}
/// 【添加成员变量NSString *】
-(void)addIvarStr:(NSString *)ivarName{
    /// ⚠️注意⚠️：不能在objc_registerClassPair之后进行调用
    class_addIvar(newClass,/// 第一个参数cls是类对象，它表示是往哪个类添加成员变量。需要注意的是，这个cls不能是元类对象，因为我们不支持在元类中添加实例变量;
                  ivarName.UTF8String,/// 第二个参数name是成员变量的名字;
                  sizeof(NSString *),/// 第三个参数size是成员变量的类型的大小;
                  log2(sizeof(NSString *)),/// 第四个参数alignment是对齐处理方式，即二进制对齐位数，对于所有指针类型的变量，都是取成员变量类型大小以2为底的对数。比如8=2^3，因此这里就应该赋值3;
                  "@");/// 第五个参数types是签名
}
/// 注册到内存
-(void)registerClass:(Class)cls{
    objc_registerClassPair(cls);
}
/// 生成类的实例
-(id)createInstanceByClass:(NSString *)className {
    newClass = NSClassFromString(className);
    if (!newClass) {
        /// 第一个参数是父类对象，如果传nil那么新创建的类就是跟NSObject同等级别的根类对象;
        /// 第二个参数是本类类名;
        /// 第三个参数是初始的内存空间大小;
        /// 我们如果使用objc_allocateClassPair函数来创建一个类对象失败了，那么objc_allocateClassPair就会返回Nil。如果所要创建的类已经存在了，那么就会返回Nil.
        newClass = objc_allocateClassPair(OCDynamic.class,
                                          className.UTF8String,
                                          0);
    }
    id intanceOfClass = [newClass.alloc init];
    id PropertyList = printPropertyListByObj(intanceOfClass);
    id MethodList = printMethodListByObj(intanceOfClass);
    NSLog(@"PropertyList = %@",PropertyList);
    NSLog(@"MethodList = %@",MethodList);
    [intanceOfClass performSelector:@selector(test)];
    return intanceOfClass;
}
/// 调用方法
void funcIMP(Class self, SEL _cmd){
    Class class = [self class];
    // 类： dynaminClass, sel： test.
    NSLog(@"self: %@ sel: %s", class, _cmd);
}
/// 封装的添加属性的方法
void jobs_class_addProperty(Class targetClass , const char *propertyName) {
    objc_property_attribute_t type = { "T", [[NSString stringWithFormat:@"@\"%@\"",NSStringFromClass([NSString class])] UTF8String] }; //type
    objc_property_attribute_t ownership0 = { "C", "" }; // C = copy
    objc_property_attribute_t ownership = { "N", "" }; //N = nonatomic
    objc_property_attribute_t backingivar  = { "V", [NSString stringWithFormat:@"_%@",[NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding]].UTF8String };  //variable name
    objc_property_attribute_t attrs[] = {type,
                                         ownership0,
                                         ownership,
                                         backingivar};
    /// 第一个参数是给哪个类添加属性
    /// 第二个参数是属性名
    /// 第三个参数是所添加的属性的一些属性，比如所属类、读写性、原子性、内存管理策略等。见图：objc_property_attribute_t
    /// 第四个参数是属性的属性的数量。
    class_addProperty(targetClass,
                      propertyName,
                      attrs,
                      4);
    /// 光添加属性，运行会报错，因为没有添加属性的 set / get 方法
}
/// self和_cmd是必须的，在之后可以随意添加其他参数
static void addMethodForMyClass(id self, SEL _cmd, NSString *test) {
    // 获取类中指定名称实例成员变量的信息
    Ivar ivar = class_getInstanceVariable([self class], "test");
// 获取整个成员变量列表
//   Ivar * class_copyIvarList ( Class cls, unsigned intint * outCount );
// 获取类中指定名称实例成员变量的信息
//   Ivar class_getInstanceVariable ( Class cls, const charchar *name );
// 获取类成员变量的信息
//   Ivar class_getClassVariable ( Class cls, const charchar *name );
    // 返回名为test的ivar变量的值
    id obj = object_getIvar(self, ivar);
    NSLog(@"%@",obj);
    NSLog(@"addMethodForMyClass:参数：%@",test);
    NSLog(@"ClassName：%@",NSStringFromClass([self class]));
}
/// 这个方法实际上没有被调用,但是必须实现否则不会调用下面的方法
- (void)addMethodForMyClass:(NSString *)string {
    NSLog(@"");
}

-(void)知识点{
    /// Class 反射创建
    // 方式1
    NSClassFromString(@"NSObject");
    // 方式2
    objc_getClass("NSObject");
    
    /// SEL 反射创建
    // 方式1
    @selector(init);
    // 方式2
    sel_registerName("init");
    // 方式3
    NSSelectorFromString(@"init");
    
    /*
     IMP是”implementation”的缩写,它是objetive-C 方法 (method)实现代码块的地址,类似函数指针,通过它可以 直接访问任意一个方法。免去发送消息的代价
     获取方法的IMP：-(IMP)methodForSelector:(SEL)aSelector;
     */
}

@end
