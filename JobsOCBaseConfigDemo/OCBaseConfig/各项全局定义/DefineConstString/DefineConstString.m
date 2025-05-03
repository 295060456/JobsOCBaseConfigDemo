//
//  DefineConstString.m
//  Casino
//
//  Created by Jobs on 2021/12/13.
//

#import "DefineConstString.h" /// 常量字符串的定义
///
NSRange const NSRangeZero = (NSRange){0, 0};/// 使用结构体直接赋值
/// SDK内部类
NSString *const UISystemBackgroundView = @"_UISystemBackgroundView";
NSString *const UITableViewHeaderFooterViewBackground = @"_UITableViewHeaderFooterViewBackground";
NSString *const UIScrollViewScrollIndicator = @"_UIScrollViewScrollIndicator";
NSString *const UIBarBackground = @"_UIBarBackground";
NSString *const UINavigationBarContentView = @"_UINavigationBarContentView";
NSString *const UITableViewCellSwipeContainerView = @"_UITableViewCellSwipeContainerView";
NSString *const UISwipeActionPullView = @"_UISwipeActionPullView";
NSString *const UITableViewCellDeleteConfirmationView = @"_UITableViewCellDeleteConfirmationView";
NSString *const UITabBarButtonLabel = @"UITabBarButtonLabel";
NSString *const UITabBarSwappableImageView = @"UITabBarSwappableImageView";
NSString *const UITAMICAdaptorView = @"_UITAMICAdaptorView";
NSString *const UITextContainerView = @"_UITextContainerView";
NSString *const UIBackdropView = @"_UIBackdropView";
NSString *const UIBackdropEffectView = @"_UIBackdropEffectView";
NSString *const UIStatusBar = @"_UIStatusBar";
NSString *const UIStatusBarModern = @"_UIStatusBarModern";
NSString *const UIStatusBarData = @"_UIStatusBarData";
NSString *const UIStatusBarRegion = @"_UIStatusBarRegion";
NSString *const UIStatusBarCellularItem = @"_UIStatusBarCellularItem";
NSString *const UIStatusBarWifiItem = @"_UIStatusBarWifiItem";
NSString *const UIStatusBarBatteryItem = @"_UIStatusBarBatteryItem";
NSString *const UITextEffectsWindow = @"_UITextEffectsWindow";
NSString *const UIRemoteKeyboardWindow = @"_UIRemoteKeyboardWindow";
NSString *const UIRemoteKeyboardPlaceholderView = @"_UIRemoteKeyboardPlaceholderView";
NSString *const UITableViewCellContentView = @"_UITableViewCellContentView";
NSString *const UITableViewHeaderFooterContentView = @"_UITableViewHeaderFooterContentView";
NSString *const UICollectionViewPlaceholderView = @"_UICollectionViewPlaceholderView";
NSString *const UICollectionViewCellActionsView = @"_UICollectionViewCellActionsView";
NSString *const UICollectionViewListCellSeparator = @"_UICollectionViewListCellSeparator";
NSString *const UINavigationBarLargeTitleView = @"_UINavigationBarLargeTitleView";
NSString *const UIButtonBarStackView = @"_UIButtonBarStackView";
NSString *const UIButtonBarButton = @"_UIButtonBarButton";
NSString *const UIButtonBar = @"_UIButtonBar";
NSString *const UIToolbarContentView = @"_UIToolbarContentView";
NSString *const UIToolbarNavigationButton = @"_UIToolbarNavigationButton";
NSString *const UIToolbarButton = @"_UIToolbarButton";
NSString *const UIInterfaceActionGroupView = @"_UIInterfaceActionGroupView";
NSString *const UIInterfaceActionRepresentationView = @"_UIInterfaceActionRepresentationView";
NSString *const UIInterfaceActionSeparatorView = @"_UIInterfaceActionSeparatorView";
NSString *const UIAlertControllerView = @"_UIAlertControllerView";
NSString *const UIAlertControllerShadowedScrollView = @"_UIAlertControllerShadowedScrollView";
NSString *const UIAlertControllerTextFieldView = @"_UIAlertControllerTextFieldView";
NSString *const UIContextMenuContainerView = @"_UIContextMenuContainerView";
NSString *const UIContextMenuActionsListView = @"_UIContextMenuActionsListView";
NSString *const UIPlatterMenuController = @"_UIPlatterMenuController";
NSString *const UILegacyPopoverController = @"_UILegacyPopoverController";
NSString *const UIPopoverView = @"_UIPopoverView";
NSString *const UITableViewCellEditControl = @"UITableViewCellEditControl";
NSString *const UITabBarButton = @"UITabBarButton";
/// 系统环境一览
NSString *const 应用程序的发布版本号 = @"CFBundleShortVersionString";
NSString *const APP编译构建的版本号 = @"CFBundleVersion";
NSString *const APP的名字 = @"CFBundleExecutable";
/// App 首次启动
NSString *const APP安装以后首次启动 = @"APP安装以后首次启动";
NSString *const APP今日首次启动 = @"APP今日首次启动";
/// 网速监控
NSString *const GSDownloadNetworkSpeedNotificationKey = @"GSDownloadNetworkSpeedNotificationKey";
NSString *const GSUploadNetworkSpeedNotificationKey = @"GSUploadNetworkSpeedNotificationKey";
NSString *const GSUploadAndDownloadNetworkSpeedNotificationKey = @"GSUploadAndDownloadNetworkSpeedNotificationKey";
/// 🔑钥匙串记录
NSString *const 设备ID = @"设备ID";
/// 多语言
NSString *const 菲律宾语_不带区域组合 = @"fil";
NSString *const 菲律宾语_菲律宾 = @"fil-PH";
NSString *const 简体中文 = @"zh-Hans";
NSString *const 繁体中文 = @"zh-Hant";
NSString *const 英文_不带区域组合 = @"en";
/// HTTP 协议
NSString *const HTTP = @"http";
NSString *const HTTPS = @"https";
NSString *const HTTP分割符 = @"://";
NSString *const GET = @"GET";
NSString *const POST = @"POST";
NSString *const PUT = @"PUT";
NSString *const DELETE = @"DELETE";
NSString *const PATCH = @"PATCH";
NSString *const HEAD = @"HEAD";
NSString *const APP_JSON = @"application/json";
/// 网络请求参数
NSString *const ContentType = @"Content-Type";
NSString *const Authorization = @"Authorization";
/// 网络数据处理后的标志位
NSString *const HTTPServiceErrorDomain = @"HTTPServiceErrorDomain";/// The Http request error domain
NSString *const HTTPServiceErrorResponseCodeKey = @"HTTPServiceErrorResponseCodeKey";/// 请求成功，但statusCode != 0
NSString *const HTTPServiceErrorRequestURLKey = @"HTTPServiceErrorRequestURLKey";/// 请求地址错误
NSString *const HTTPServiceErrorHTTPStatusCodeKey = @"HTTPServiceErrorHTTPStatusCodeKey";/// 请求错误的code码key: 请求成功了，但code码是错误提示的code,比如参数错误
NSString *const HTTPServiceErrorDescriptionKey = @"HTTPServiceErrorDescriptionKey";/// 请求错误，详细描述key
NSString *const HTTPServiceErrorMessagesKey = @"HTTPServiceErrorMessagesKey";/// 服务端错误提示，信息key
/// 特殊字符串
NSString *const 回车符号转义字符 = @"\r";       /// 回车符号转义字符
NSString *const 零宽转义字符 = @"\u200B";      /// 零宽转义字符
NSString *const JobsSeparation = @"/";       /// 分隔符
NSString *const JobsNewline = @"\n";         /// 换行符
NSString *const JobsTab = @"\t";             /// 制表符
NSString *const JobsSpace = @" ";            /// 空格
NSString *const JobsEmpty = @"";             /// 空字符串
NSString *const JobsComma = @",";            /// 逗号
NSString *const JobsDot = @".";              /// 句号
NSString *const JobsColon = @":";            /// 冒号
NSString *const JobsSemicolon = @";";        /// 分号
NSString *const JobsDash = @"-";             /// 连字符
NSString *const JobsUnderscore = @"_";       /// 下划线
NSString *const JobsAsterisk = @"*";         /// 星号
NSString *const JobsEqual = @"=";            /// 等于
NSString *const JobsPercent = @"%";          /// 百分号
/// 业务功能相关
NSString *const 网络状态监控 = @"网络状态监控";/// 网络状态监控
NSString *const 退到后台停止播放ZFPlayer = @"退到后台停止播放ZFPlayer";/// 退到后台停止播放ZFPlayer
NSString *const 语言切换 = @"语言切换";/// 语言切换
NSString *const 登录成功 = @"登录成功";/// 登录成功
NSString *const 退出登录成功 = @"退出登录成功";/// 退出登录成功
NSString *const 用户信息 = @"用户信息";
NSString *const 用户名数组 = @"用户名数组";
NSString *const FM个人中心Tab切换 = @"FM个人中心Tab切换";
NSString *const FM用户数据 = @"FM用户数据";
NSString *const FM用户协议 = @"FM用户协议";
NSString *const App当日首次进入 = @"App当日首次进入";
NSString *const 获取极验验证码成功 = @"获取极验验证码成功";
NSString *const 获取极验验证码失败 = @"获取极验验证码失败";
NSString *const JobsLanguageKey = @"JobsLanguageKey";
NSString *const KYC状态 = @"KYC状态";
NSString *const 菲律宾货币符号 = @"₱";
NSString *const 已点击 = @"已点击";
NSString *const 未点击 = @"未点击";
/*
 * 常用符号大全
 * 特殊符号 编号序号 数学符号 爱心符号 标点符号 单位符号 货币符号 箭头符号 符号图案 制表符 皇冠符号
 * 汉语拼音 中文字符 日语字符 希腊字母 俄语字母
 */
NSString *const 皇冠符号 = @"♚　♛　♝　♞　♜　♟　♔　♕　♗　♘　♖　♟";
NSString *const 数学符号 = @" ﹢﹣×÷±/=≌∽≦≧≒﹤﹥≈≡≠=≤≥<>≮≯∷∶∫∮∝∞∧∨∑∏∪∩∈∵∴⊥∥∠⌒⊙√∟⊿㏒㏑%‰⅟½⅓⅕⅙⅛⅔⅖⅚⅜¾⅗⅝⅞⅘≂≃≄≅≆≇≈≉≊≋≌≍≎≏≐≑≒≓≔≕≖≗≘≙≚≛≜≝≞≟≠≡≢≣≤≥≦≧≨≩⊰⊱⋛⋚∫∬∭∮∯∰∱∲∳%℅‰‱øØπ";
NSString *const 标点符号 = @"。，、＇：∶；?‘’“”〝〞ˆˇ﹕︰﹔﹖﹑·¨….¸;！´？！～—ˉ｜‖＂〃｀@﹫¡¿﹏﹋﹌︴々﹟#﹩$﹠&﹪%*﹡﹢﹦﹤‐￣¯―﹨ˆ˜﹍﹎+=<＿_-ˇ~﹉﹊（）〈〉‹›﹛﹜『』〖〗［］《》〔〕{}「」【】︵︷︿︹︽_﹁﹃︻︶︸﹀︺︾ˉ﹂﹄︼❝❞!():,'[]｛｝^・.·．•＃＾＊＋＝＼＜＞＆§⋯`－–／—|\"\\";
NSString *const 单位符号 = @"°′″＄￥〒￠￡％＠℃℉﹩﹪‰﹫㎡㏕㎜㎝㎞㏎m³㎎㎏㏄º○¤%$º¹²³";
NSString *const 货币符号 = @"₽€£Ұ₴$₰¢₤¥₳₲₪₵元₣₱฿¤₡₮₭₩ރ円₢₥₫₦zł﷼₠₧₯₨Kčर₹ƒ₸￠";
NSString *const 制表符 = @"─ ━│┃╌╍╎╏┄ ┅┆┇┈ ┉┊┋┌┍┎┏┐┑┒┓└ ┕┖┗ ┘┙┚┛├┝┞┟┠┡┢┣ ┤┥┦┧┨┩┪┫┬ ┭ ┮ ┯ ┰ ┱ ┲ ┳ ┴ ┵ ┶ ┷ ┸ ┹ ┺ ┻┼ ┽ ┾ ┿ ╀ ╁ ╂ ╃ ╄ ╅ ╆ ╇ ╈ ╉ ╊ ╋ ╪ ╫ ╬═║╒╓╔ ╕╖╗╘╙╚ ╛╜╝╞╟╠ ╡╢╣╤ ╥ ╦ ╧ ╨ ╩ ╳╔ ╗╝╚ ╬ ═ ╓ ╩ ┠ ┨┯ ┷┏ ┓┗ ┛┳ ⊥ ﹃ ﹄┌ ╮ ╭ ╯╰";
NSString *const 特殊符号 = @"♠♣♧♡♥❤❥❣♂♀✲☀☼☾☽◐◑☺☻☎☏✿❀№↑↓←→√×÷★℃℉°◆◇⊙■□△▽¿½☯✡㍿卍卐♂♀✚〓㎡♪♫♩♬㊚㊛囍㊒㊖Φ♀♂‖$@*&#※卍卐Ψ♫♬♭♩♪♯♮⌒¶∮‖€￡¥$";
NSString *const 键盘特殊符号 = @"~`!@#$%^&*()_-+={[「【}]」』:;：；'<,《，>.》。？、?/\"|\\";
NSString *const 编号序号 = @"①②③④⑤⑥⑦⑧⑨⑩⑪⑫⑬⑭⑮⑯⑰⑱⑲⑳⓪❶❷❸❹❺❻❼❽❾❿⓫⓬⓭⓮⓯⓰⓱⓲⓳⓴㊀㊁㊂㊃㊄㊅㊆㊇㊈㊉㈠㈡㈢㈣㈤㈥㈦㈧㈨㈩⑴⑵⑶⑷⑸⑹⑺⑻⑼⑽⑾⑿⒀⒁⒂⒃⒄⒅⒆⒇⒈⒉⒊⒋⒌⒍⒎⒏⒐⒑⒒⒓⒔⒕⒖⒗⒘⒙⒚⒛ⅠⅡⅢⅣⅤⅥⅦⅧⅨⅩⅪⅫⅰⅱⅲⅳⅴⅵⅶⅷⅸⅹⒶⒷⒸⒹⒺⒻⒼⒽⒾⒿⓀⓁⓂⓃⓄⓅⓆⓇⓈⓉⓊⓋⓌⓍⓎⓏⓐⓑⓒⓓⓔⓕⓖⓗⓘⓙⓚⓛⓜⓝⓞⓟⓠⓡⓢⓣⓤⓥⓦⓧⓨⓩ⒜⒝⒞⒟⒠⒡⒢⒣⒤⒥⒦⒧⒨⒩⒪⒫⒬⒭⒮⒯⒰⒱⒲⒳⒴⒵";
NSString *const 爱心符号 = @"♥❣ღ♠♡♤❤❥";
NSString *const 箭头符号 = @"↑↓←→↖↗↘↙↔↕➻➼➽➸➳➺➻➴➵➶➷➹▶►▷◁◀◄«»➩➪➫➬➭➮➯➱⏎➲➾➔➘➙➚➛➜➝➞➟➠➡➢➣➤➥➦➧➨↚↛↜↝↞↟↠↠↡↢↣↤↤↥↦↧↨⇄⇅⇆⇇⇈⇉⇊⇋⇌⇍⇎⇏⇐⇑⇒⇓⇔⇖⇗⇘⇙⇜↩↪↫↬↭↮↯↰↱↲↳↴↵↶↷↸↹☇☈↼↽↾↿⇀⇁⇂⇃⇞⇟⇠⇡⇢⇣⇤⇥⇦⇧⇨⇩⇪↺↻⇚⇛♐";
NSString *const 符号图案 = @"✐✎✏✑✒✍✉✁✂✃✄✆✉☎☏☑✓✔√☐☒✗✘ㄨ✕✖✖☢☠☣✈★☆✡囍㍿☯☰☲☱☴☵☶☳☷☜☞☝✍☚☛☟✌♤♧♡♢♠♣♥♦☀☁☂❄☃♨웃유❖☽☾☪✿♂♀✪✯☭➳卍卐√×■◆●○◐◑✙☺☻❀⚘♔♕♖♗♘♙♚♛♜♝♞♟♧♡♂♀♠♣♥❤☜☞☎☏⊙◎☺☻☼▧▨♨◐◑↔↕▪▒◊◦▣▤▥▦▩◘◈◇♬♪♩♭♪の★☆→あぃ￡Ю〓§♤♥▶¤✲❈✿✲❈➹☀☂☁【】┱┲❣✚✪✣✤✥✦❉❥❦❧❃❂❁❀✄☪☣☢☠☭ღ▶▷◀◁☀☁☂☃☄★☆☇☈⊙☊☋☌☍ⓛⓞⓥⓔ╬『』∴☀♫♬♩♭♪☆∷﹌の★◎▶☺☻►◄▧▨♨◐◑↔↕↘▀▄█▌◦☼♪の☆→♧ぃ￡❤▒▬♦◊◦♠♣▣۰•❤•۰►◄▧▨♨◐◑↔↕▪▫☼♦⊙●○①⊕◎Θ⊙¤㊣★☆♀◆◇◣◢◥▲▼△▽⊿◤◥✐✌✍✡✓✔✕✖♂♀♥♡☜☞☎☏⊙◎☺☻►◄▧▨♨◐◑↔↕♥♡▪▫☼♦▀▄█▌▐░▒▬♦◊◘◙◦☼♠♣▣▤▥▦▩◘◙◈♫♬♪♩♭♪✄☪☣☢☠♯♩♪♫♬♭♮☎☏☪♈ºº₪¤큐«»™♂✿♥　◕‿-｡　｡◕‿◕｡";
/// 语言文字类型
NSString *const 希腊字母 = @"ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩαβγδεζνξοπρσηθικλμτυφχψω";
NSString *const 俄语字母 = @"АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя";
NSString *const 汉语拼音 = @"āáǎàōóǒòēéěèīíǐìūúǔùǖǘǚǜüêɑńňɡㄅㄆㄇㄈㄉㄊㄋㄌㄍㄎㄏㄐㄑㄒㄓㄔㄕㄖㄗㄘㄙㄚㄛㄜㄝㄞㄟㄠㄡㄢㄣㄤㄥㄦㄧㄨㄩ";
NSString *const 中文字符 = @"零壹贰叁肆伍陆柒捌玖拾佰仟万亿吉太拍艾分厘毫微卍卐卄巜弍弎弐朤氺曱甴囍兀々〆のぁ〡〢〣〤〥〦〧〨〩㊎㊍㊌㊋㊏㊚㊛㊐㊊㊣㊤㊥㊦㊧㊨㊒㊫㊑㊓㊔㊕㊖㊗㊘㊜㊝㊞㊟㊠㊡㊢㊩㊪㊬㊭㊮㊯㊰㊀㊁㊂㊃㊄㊅㊆㊇㊈㊉";
NSString *const 日文平假名和片假名 = @"ぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんゔゕゖァアィイゥウェエォオカガキギクグケゲコゴサザシジスズセゼソゾタダチヂッツヅテデトドナニヌネノハバパヒビピフブプヘベペホボポマミムメモャヤュユョヨラリルレロヮワヰヱヲンヴヵヶヷヸヹヺ・ーヽヾヿ゠ㇰㇱㇲㇳㇴㇵㇶㇷㇸㇹㇺㇻㇼㇽㇾㇿ";
/// TMSCollectionView
NSString * const TMSCollectionViewSectionHeader = @"NTCollectionViewSectionHeader";
NSString * const TMSCollectionViewSectionFooter = @"NTCollectionViewSectionFooter";
/// WebSocket
NSString * const kNeedPayOrderNote               = @"kNeedPayOrderNote";
NSString * const kWebSocketDidOpenNote           = @"kWebSocketDidOpenNote";
NSString * const kWebSocketDidCloseNote          = @"kWebSocketDidCloseNote";
NSString * const kWebSocketdidReceiveMessageNote = @"kWebSocketdidReceiveMessageNote";
/// 默认占位
NSString *const 主标题文字默认占位内容 = @"主标题文字默认占位内容";
NSString *const 副标题文字默认占位内容 = @"副标题文字默认占位内容";
NSString *const B体育 = @"B体育";
NSString *const BSPORTS = @"BSPORTS";
