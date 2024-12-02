//
//  UIViewModelProtocol.h
//  Casino
//
//  Created by Jobs on 2022/1/12.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "UIPictureAndBackGroundCorProtocol.h"
#import "UILocationProtocol.h"
#import "UIMarkProtocol.h"
#import "UIViewModelOthersProtocol.h"
#import "BaseButtonProtocol.h"
#import "UITextModelProtocol.h"

#import "MacroDef_App.h"
#import "MacroDef_Cor.h"
#import "MacroDef_Size.h"
#import "MacroDef_Func.h"
#import "UIImage+Extras.h"

@class UIViewModel;
@class UITextModel;
@class UIButtonModel;

NS_ASSUME_NONNULL_BEGIN
/// 全局的共用的属性。所有属性的大集合
@protocol UIViewModelProtocol
<
UIViewModelOthersProtocol /// UIViewModelOthersProtocol_synthesize、UIViewModelOthersProtocol_dynamic
,UIPictureAndBackGroundCorProtocol /// UIPictureAndBackGroundCorProtocol_synthesize、UIPictureAndBackGroundCorProtocol_dynamic
,UILocationProtocol /// UILocationProtocol_UIViewModelSynthesize、UILocationProtocol_UIViewModelDynamic
,UIMarkProtocol /// UIMarkProtocol_synthesize + UIMarkProtocol_UIViewModelSynthesize、UIMarkProtocol_dynamic
,BaseButtonProtocol /// BaseButtonProtocol_synthesize + BaseButtonProtocol_UIViewModelOthersProtocol_synthesize、BaseButtonProtocol_dynamic
,UITextModelProtocol /// UITextModelProtocol_UIViewModelSynthesize + UITextModelProtocol_synthesize、UITextModelProtocol_dynamic
>
@optional
#pragma mark —— 文字配置
@property(nonatomic,strong,nullable)UITextModel *textModel;
@property(nonatomic,strong,nullable)UITextModel *subTextModel;
@property(nonatomic,strong,nullable)UITextModel *backBtnTitleModel;/// 在具体的子类去实现，以覆盖父类的方法实现
@property(nonatomic,strong,nullable)UIButtonModel *buttonModel;
@property(nonatomic,strong,nullable)UIButtonModel *subButtonModel;
@property(nonatomic,copy,nullable)JobsReturnIDByIDBlock jobsBlock;
@property(nonatomic,strong,nullable)NSMutableArray <JobsReturnIDByIDBlock>*jobsBlockMutArr;
#pragma mark —— 图片配置
/// 普通图
@property(nonatomic,copy)NSString *normalImageURLString;
@property(nonatomic,strong)NSURL *normalImageURL;
/// 背景图
@property(nonatomic,copy)NSString *normalBgImageURLString;
@property(nonatomic,strong)NSURL *normalBgImageURL;
#pragma mark —— UI约束（Masonry）
@property(nonatomic,copy,nullable)jobsByMASConstraintMakerBlock masonryBlock;

@end

NS_ASSUME_NONNULL_END

#ifndef UIViewModelProtocol_self_synthesize
#define UIViewModelProtocol_self_synthesize \
\
@synthesize textModel = _textModel; \
@synthesize subTextModel = _subTextModel; \
@synthesize backBtnTitleModel = _backBtnTitleModel; \
@synthesize buttonModel = _buttonModel; \
@synthesize subButtonModel = _subButtonModel; \
@synthesize jobsBlock = _jobsBlock; \
@synthesize jobsBlockMutArr = _jobsBlockMutArr; \
@synthesize normalImageURLString = _normalImageURLString; \
@synthesize normalImageURL = _normalImageURL; \
@synthesize normalBgImageURLString = _normalBgImageURLString; \
@synthesize normalBgImageURL = _normalBgImageURL; \
@synthesize masonryBlock = _masonryBlock; \

#endif

#pragma mark —— @synthesize UIViewModelProtocol
#ifndef UIViewModelProtocol_synthesize
#define UIViewModelProtocol_synthesize \
\
@synthesize navBgImage = _navBgImage;\
@synthesize navBgCor = _navBgCor;\
@synthesize image = _image;\
@synthesize bgImage = _bgImage;\
@synthesize imageURLString = _imageURLString;\
@synthesize bgImageURLString = _bgImageURLString;\
@synthesize bgCor = _bgCor;\
@synthesize backBtnIMG = _backBtnIMG;\
@synthesize bgImageView = _bgImageView;\
@synthesize bgSelectedImage = _bgSelectedImage;\
@synthesize selectedImageURLString = _selectedImageURLString;\
@synthesize bgSelectedImageURLString = _bgSelectedImageURLString;\
@synthesize bgSelectedCor = _bgSelectedCor;\
@synthesize backBtnSelectedIMG = _backBtnSelectedIMG;\
@synthesize bgSelectedConfig = _bgSelectedConfig;\
\
@synthesize cornerRadius = _cornerRadius;\
@synthesize masksToBounds = _masksToBounds;\
@synthesize rectCorner = _rectCorner;\
@synthesize cornerRadii = _cornerRadii;\
@synthesize jobsX = _jobsX;\
@synthesize jobsY = _jobsY;\
@synthesize jobsWidth = _jobsWidth;\
@synthesize jobsHeight = _jobsHeight;\
@synthesize jobsTop = _jobsTop;\
@synthesize jobsLeft = _jobsLeft;\
@synthesize jobsRight = _jobsRight;\
@synthesize jobsBottom = _jobsBottom;\
@synthesize location = _location;\
@synthesize length = _length;\
@synthesize jobsOffsetX = _jobsOffsetX;\
@synthesize jobsOffsetY = _jobsOffsetY;\
@synthesize jobsSize = _jobsSize;\
@synthesize jobsRect = _jobsRect;\
@synthesize jobsPoint = _jobsPoint;\
@synthesize offsetXForEach = _offsetXForEach;\
@synthesize offsetYForEach = _offsetYForEach;\
@synthesize offsetHeight = _offsetHeight;\
@synthesize offsetWidth = _offsetWidth;\
@synthesize axis = _axis;\
@synthesize distribution = _distribution;\
@synthesize alignment = _alignment;\
@synthesize buttonEdgeInsetsStyle;\
@synthesize imageTitleSpace;\
@synthesize titleSpace;\
@synthesize cellWidth = _cellWidth;\
@synthesize cellHeight = _cellHeight;\
@synthesize heightForHeaderInSection = _heightForHeaderInSection;\
@synthesize cellSize = _cellSize;\
@synthesize tableHeaderViewSize = _tableHeaderViewSize;\
@synthesize tableFooterViewSize = _tableFooterViewSize;\
@synthesize usesTableViewHeaderView = _usesTableViewHeaderView;\
@synthesize usesTableViewFooterView = _usesTableViewFooterView;\
\
@synthesize indexPath = _indexPath;\
@synthesize section = _section;\
@synthesize row = _row;\
@synthesize item = _item;\
@synthesize lastPoint = _lastPoint;\
@synthesize index = _index;\
@synthesize currentPage = _currentPage;\
@synthesize pageSize = _pageSize;\
@synthesize pageNum = _pageNum;\
@synthesize isMark = _isMark;\
@synthesize presentUpHeight = _presentUpHeight;\
\
@synthesize racDisposable = _racDisposable;\
@synthesize racSubject = _racSubject;\
@synthesize reqSignal = _reqSignal;\
@synthesize actionCommand = actionCommand;\
@synthesize dataSequence = dataSequence;\
@synthesize dataConnection = dataConnection;\
@synthesize mainScheduler = mainScheduler;\
@synthesize backgroundScheduler = backgroundScheduler;\
@synthesize dataTuple = dataTuple;\
\
@synthesize isLock = _isLock;\
@synthesize layerBorderCor = _layerBorderCor;\
@synthesize layerBorderWidth = _layerBorderWidth;\
@synthesize layerCornerRadius = _layerCornerRadius;\
@synthesize isTranslucent = _isTranslucent;\
@synthesize isVisible = _isVisible;\
@synthesize isInvisible = _isInvisible;\
@synthesize isMultiLineShows = _isMultiLineShows;\
@synthesize labelShowingType = _labelShowingType;\
@synthesize appLanguage = _appLanguage;\
@synthesize internationalizationKEY = _internationalizationKEY;\
@synthesize jobsDataMutSet = _jobsDataMutSet;\
@synthesize jobsDataMutArr = _jobsDataMutArr;\
@synthesize viewModelMutArr = _viewModelMutArr;\
@synthesize jobsDataMutDic = _jobsDataMutDic;\
@synthesize cls = _cls;\
@synthesize data = _data;\
@synthesize data_weak = _data_weak;\
@synthesize requestParams = _requestParams;\
@synthesize requestParams_weak = _requestParams_weak;\
@synthesize viewModel = _viewModel;\
@synthesize viewModel_weak = _viewModel_weak;\
@synthesize url = _url;\
@synthesize jobsTag = _jobsTag;\
@synthesize jobsSelected = _jobsSelected;\
@synthesize jobsEnabled = _jobsEnabled;\
@synthesize primaryAction = _primaryAction;\
@synthesize longPressGestureEventBlock = _longPressGestureEventBlock;\
@synthesize clickEventBlock = _clickEventBlock;\
\
@synthesize buttonConfiguration = _buttonConfiguration;\
@synthesize backgroundConfiguration = _backgroundConfiguration;\
@synthesize titleAlignment = _titleAlignment;\
@synthesize buttonConfigurationTitleAlignment = _buttonConfigurationTitleAlignment;\
@synthesize btnBackgroundColor = _btnBackgroundColor;\
@synthesize imageSize = _imageSize;\
@synthesize contentHorizontalAlignment = _contentHorizontalAlignment;\
@synthesize contentVerticalAlignment = _contentVerticalAlignment;\
@synthesize directionalRectEdge = _directionalRectEdge;\
@synthesize contentEdgeInsets = _contentEdgeInsets;\
@synthesize contentInsets = _contentInsets;\
@synthesize contentSpacing = _contentSpacing;\
@synthesize btnWidth = _btnWidth;\
@synthesize textLabelFrame = _textLabelFrame;\
@synthesize subTextLabelFrame = _subTextLabelFrame;\
@synthesize imageViewFrame = _imageViewFrame;\
@synthesize textLabelSize = _textLabelSize;\
@synthesize subTextLabelSize = _subTextLabelSize;\
@synthesize imageViewSize = _imageViewSize;\
@synthesize textLabelWidth = _textLabelWidth;\
@synthesize subTextLabelWidth = _subTextLabelWidth;\
@synthesize imageViewWidth = _imageViewWidth;\
@synthesize textLabelHeight = _textLabelHeight;\
@synthesize subTextLabelHeight = _subTextLabelHeight;\
@synthesize imageViewHeight = _imageViewHeight;\
@synthesize textLabelFrameOffsetX = _textLabelFrameOffsetX;\
@synthesize textLabelFrameOffsetY = _textLabelFrameOffsetY;\
@synthesize textLabelFrameOffsetWidth = _textLabelFrameOffsetWidth;\
@synthesize textLabelFrameOffsetHeight = _textLabelFrameOffsetHeight;\
@synthesize subTextLabelFrameOffsetX = _subTextLabelFrameOffsetX;\
@synthesize subTextLabelFrameOffsetY = _subTextLabelFrameOffsetY;\
@synthesize subTextLabelFrameOffsetWidth = _subTextLabelFrameOffsetWidth;\
@synthesize subTextLabelFrameOffsetHeight = _subTextLabelFrameOffsetHeight;\
@synthesize imageViewFrameOffsetX = _imageViewFrameOffsetX;\
@synthesize imageViewFrameOffsetY = _imageViewFrameOffsetY;\
@synthesize imageViewFrameOffsetWidth = _imageViewFrameOffsetWidth;\
@synthesize imageViewFrameOffsetHeight = _imageViewFrameOffsetHeight;\
\
@synthesize textAlignment = _textAlignment;\
@synthesize subTextAlignment = _subTextAlignment;\
@synthesize lineBreakMode = _lineBreakMode;\
@synthesize subLineBreakMode = _subLineBreakMode;\
@synthesize textLineSpacing = _textLineSpacing;\
@synthesize placeholder = _placeholder;\
@synthesize placeholderColor = _placeholderColor;\
@synthesize placeholderFont = _placeholderFont;\
@synthesize curWordCount = _curWordCount;\
@synthesize maxWordCount = _maxWordCount;\
@synthesize text = _text;\
@synthesize font = _font;\
@synthesize textCor = _textCor;\
@synthesize subText = _subText;\
@synthesize subFont = _subFont;\
@synthesize subTextCor = _subTextCor;\
@synthesize attributedTitle = _attributedTitle;\
@synthesize titleAttributedDataMutArr = _titleAttributedDataMutArr;\
@synthesize selectedText = _selectedText;\
@synthesize selectedFont = _selectedFont;\
@synthesize selectedTextCor = _selectedTextCor;\
@synthesize selectedAttributedText = _selectedAttributedText;\
@synthesize selectedTitleAttributedDataMutArr = _selectedTitleAttributedDataMutArr;\

#endif

#ifndef UIViewModelProtocol_self_dynamic
#define UIViewModelProtocol_self_dynamic \
\
@dynamic textModel;\
@dynamic subTextModel;\
@dynamic backBtnTitleModel;\
@dynamic buttonModel;\
@dynamic subButtonModel;\
@dynamic jobsBlock;\
@dynamic jobsBlockMutArr;\
@dynamic normalImageURLString;\
@dynamic normalImageURL;\
@dynamic normalBgImageURLString;\
@dynamic normalBgImageURL;\
@dynamic masonryBlock;\

#endif

#pragma mark —— @dynamic UIViewModelProtocol
#ifndef UIViewModelProtocol_dynamic
#define UIViewModelProtocol_dynamic \
\
@dynamic navBgImage;\
@dynamic navBgCor;\
@dynamic image;\
@dynamic bgImage;\
@dynamic imageURLString;\
@dynamic bgImageURLString;\
@dynamic bgCor;\
@dynamic backBtnIMG;\
@dynamic bgImageView;\
@dynamic bgSelectedImage;\
@dynamic selectedImageURLString;\
@dynamic bgSelectedImageURLString;\
@dynamic bgSelectedCor;\
@dynamic backBtnSelectedIMG;\
@dynamic bgSelectedConfig;\
\
@dynamic cornerRadius;\
@dynamic masksToBounds;\
@dynamic rectCorner;\
@dynamic cornerRadii;\
@dynamic jobsX;\
@dynamic jobsY;\
@dynamic jobsWidth;\
@dynamic jobsHeight;\
@dynamic jobsTop;\
@dynamic jobsLeft;\
@dynamic jobsRight;\
@dynamic jobsBottom;\
@dynamic location;\
@dynamic length;\
@dynamic jobsOffsetX;\
@dynamic jobsOffsetY;\
@dynamic jobsSize;\
@dynamic jobsRect;\
@dynamic jobsPoint;\
@dynamic offsetXForEach;\
@dynamic offsetYForEach;\
@dynamic offsetHeight;\
@dynamic offsetWidth;\
@dynamic axis;\
@dynamic distributio;\
@dynamic alignment;\
@dynamic row;\
@dynamic item;\
@dynamic section;\
@dynamic buttonEdgeInsetsStyle;\
@dynamic imageTitleSpace;\
@dynamic titleSpace;\
@dynamic cellWidth;\
@dynamic cellHeight;\
@dynamic heightForHeaderInSection;\
@dynamic cellSize;\
@dynamic tableHeaderViewSize;\
@dynamic tableFooterViewSize;\
@dynamic usesTableViewHeaderView;\
@dynamic usesTableViewFooterView;\
\
@dynamic indexPath;\
@dynamic section;\
@dynamic rowp;\
@dynamic item;\
@dynamic lastPoint;\
@dynamic index;\
@dynamic currentPage;\
@dynamic pageSize;\
@dynamic pageNum;\
@dynamic isMark;\
@dynamic presentUpHeight;\
\
@dynamic racDisposable = _racDisposable;\
@dynamic racSubject = _racSubject;\
@dynamic reqSignal = _reqSignal;\
@dynamic actionCommand = actionCommand;\
@dynamic dataSequence = dataSequence;\
@dynamic dataConnection = dataConnection;\
@dynamic mainScheduler = mainScheduler;\
@dynamic backgroundScheduler = backgroundScheduler;\
@dynamic dataTuple = dataTuple;\
\
@dynamic isLock;\
@dynamic layerBorderCor;\
@dynamic layerBorderWidth;\
@dynamic layerCornerRadius;\
@dynamic isTranslucent;\
@dynamic isVisible;\
@dynamic isInvisible;\
@dynamic isMultiLineShows;\
@dynamic labelShowingType;\
@dynamic appLanguage;\
@dynamic internationalizationKEY;\
@dynamic jobsDataMutSet;\
@dynamic jobsDataMutArr;\
@dynamic viewModelMutArr;\
@dynamic jobsDataMutDic;\
@dynamic cls;\
@dynamic data;\
@dynamic requestParams;\
@dynamic viewModel;\
@dynamic data_weak;\
@dynamic requestParams_weak;\
@dynamic viewModel_weak;\
@dynamic url;\
@dynamic jobsTag;\
@dynamic jobsSelected;\
@dynamic jobsEnabled;\
@dynamic primaryAction;\
@dynamic longPressGestureEventBlock;\
@dynamic clickEventBlock;\
\
@dynamic buttonConfiguration;\
@dynamic backgroundConfiguration;\
@dynamic titleAlignment;\
@dynamic buttonConfigurationTitleAlignment;\
@dynamic btnBackgroundColor;\
@dynamic imageSize;\
@dynamic contentHorizontalAlignment;\
@dynamic contentVerticalAlignment;\
@dynamic directionalRectEdge;\
@dynamic contentEdgeInsets;\
@dynamic contentInsets;\
@dynamic contentSpacing;\
@dynamic lineBreakMode;\
@dynamic subLineBreakMode;\
@dynamic btnWidth;\
@dynamic textLabelFrame;\
@dynamic subTextLabelFrame;\
@dynamic imageViewFrame;\
@dynamic textLabelSize;\
@dynamic subTextLabelSize;\
@dynamic imageViewSize;\
@dynamic textLabelWidth;\
@dynamic subTextLabelWidth;\
@dynamic imageViewWidth;\
@dynamic textLabelHeight;\
@dynamic subTextLabelHeight;\
@dynamic imageViewHeight;\
@dynamic textLabelFrameOffsetX;\
@dynamic textLabelFrameOffsetY;\
@dynamic textLabelFrameOffsetWidth;\
@dynamic textLabelFrameOffsetHeight;\
@dynamic subTextLabelFrameOffsetX;\
@dynamic subTextLabelFrameOffsetY;\
@dynamic subTextLabelFrameOffsetWidth;\
@dynamic subTextLabelFrameOffsetHeight;\
@dynamic imageViewFrameOffsetX;\
@dynamic imageViewFrameOffsetY;\
@dynamic imageViewFrameOffsetWidth;\
@dynamic imageViewFrameOffsetHeight;\
\
@dynamic textAlignment;\
@dynamic subTextAlignment;\
@dynamic textLineSpacing;\
@dynamic placeholder;\
@dynamic placeholderColor;\
@dynamic placeholderFont;\
@dynamic curWordCount;\
@dynamic maxWordCount;\
@dynamic text;\
@dynamic font;\
@dynamic textCor;\
@dynamic subText;\
@dynamic subFont;\
@dynamic subTextCor;\
@dynamic attributedText;\
@dynamic titleAttributedDataMutArr;\
@dynamic selectedText;\
@dynamic selectedFont;\
@dynamic selectedTextCor;\
@dynamic selectedAttributedText;\
@dynamic selectedTitleAttributedDataMutArr;\

#endif
