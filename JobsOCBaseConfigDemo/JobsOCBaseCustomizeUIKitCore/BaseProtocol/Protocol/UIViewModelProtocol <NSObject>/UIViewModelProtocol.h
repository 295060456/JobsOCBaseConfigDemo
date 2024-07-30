//
//  UIViewModelProtocol.h
//  Casino
//
//  Created by Jobs on 2022/1/12.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

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
UIPictureAndBackGroundCorProtocol
,UILocationProtocol
,UIMarkProtocol
,UIViewModelOthersProtocol
,BaseButtonProtocol
,UITextModelProtocol
>

@optional
#pragma mark —— 文字配置
@property(nonatomic,strong,nullable)UITextModel *textModel;
@property(nonatomic,strong,nullable)UITextModel *subTextModel;
@property(nonatomic,strong,nullable)UITextModel *backBtnTitleModel;
@property(nonatomic,strong,nullable)UIButtonModel *buttonModel;
@property(nonatomic,strong,nullable)UIButtonModel *subButtonModel;
@property(nonatomic,strong,nullable)JobsReturnIDByIDBlock jobsBlock;
@property(nonatomic,strong,nullable)NSMutableArray <JobsReturnIDByIDBlock>*jobsBlockMutArr;

@end

NS_ASSUME_NONNULL_END

#pragma mark —— @synthesize UIViewModelProtocol
#ifndef UIViewModelProtocol_synthesize
#define UIViewModelProtocol_synthesize \
\
@synthesize textModel = _textModel;\
@synthesize subTextModel = _subTextModel;\
@synthesize backBtnTitleModel = _backBtnTitleModel;\
@synthesize buttonModel = _buttonModel;\
@synthesize subButtonModel = _subButtonModel;\
@synthesize jobsBlock = _jobsBlock;\
@synthesize jobsBlockMutArr = _jobsBlockMutArr;\
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
@synthesize rectCorner = _rectCorner;\
@synthesize cornerRadii = _cornerRadii;\
@synthesize jobsWidth = _jobsWidth;\
@synthesize jobsHeight = _jobsHeight;\
@synthesize jobsTop = _jobsTop;\
@synthesize jobsLeft = _jobsLeft;\
@synthesize jobsRight = _jobsRight;\
@synthesize jobsBottom = _jobsBottom;\
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
@synthesize isMark = _isMark;\
@synthesize presentUpHeight = _presentUpHeight;\
\
@synthesize appLanguage = _appLanguage;\
@synthesize cls = _cls;\
@synthesize viewModel = _viewModel;\
@synthesize viewModelMutArr = _viewModelMutArr;\
@synthesize reqSignal = _reqSignal;\
@synthesize internationalizationKEY = _internationalizationKEY;\
@synthesize jobsTag = _jobsTag;\
@synthesize jobsSelected = _jobsSelected;\
@synthesize isMultiLineShows = _isMultiLineShows;\
@synthesize isTranslucent = _isTranslucent;\
@synthesize isVisible = _isVisible;\
@synthesize labelShowingType = _labelShowingType;\
@synthesize layerBorderCor = _layerBorderColour;\
@synthesize layerBorderWidth = _layerBorderWidth;\
@synthesize layerCornerRadius = _layerCornerRadius;\
@synthesize data = _data;\
@synthesize requestParams = _requestParams;\
@synthesize jobsDataMutSet = _jobsDataMutSet;\
@synthesize jobsDataMutArr = _jobsDataMutArr;\
@synthesize jobsDataMutDic = _jobsDataMutDic;\
\
@synthesize titleAlignment = _titleAlignment;\
@synthesize btnBackgroundColor = _btnBackgroundColor;\
@synthesize imageSize = _imageSize;\
@synthesize contentHorizontalAlignment = _contentHorizontalAlignment;\
@synthesize contentVerticalAlignment = _contentVerticalAlignment;\
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
@synthesize lineBreakMode = _lineBreakMode;\
@synthesize textLineSpacing = _textLineSpacing;\
@synthesize placeholder = _placeholder;\
@synthesize placeholderColor = _placeholderColor;\
@synthesize curWordCount = _curWordCount;\
@synthesize maxWordCount = _maxWordCount;\
@synthesize text = _text;\
@synthesize font = _font;\
@synthesize textCor = _textCor;\
@synthesize subText = _subText;\
@synthesize subFont = _subFont;\
@synthesize subTextCor = _subTextCor;\
@synthesize attributedText = _attributedText;\
@synthesize titleAttributedDataMutArr = _titleAttributedDataMutArr;\
@synthesize selectedText = _selectedText;\
@synthesize selectedFont = _selectedFont;\
@synthesize selectedTextCor = _selectedTextCor;\
@synthesize selectedAttributedText = _selectedAttributedText;\
@synthesize selectedTitleAttributedDataMutArr = _selectedTitleAttributedDataMutArr;\

#endif

#pragma mark —— @dynamic UIViewModelProtocol
#ifndef UIViewModelProtocol_dynamic
#define UIViewModelProtocol_dynamic \
@dynamic textModel;\
@dynamic subTextModel;\
@dynamic backBtnTitleModel;\
@dynamic buttonModel;\
@dynamic subButtonModel;\
@dynamic jobsBlock;\
@dynamic jobsBlockMutArr;\
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
@dynamic rectCorner;\
@dynamic cornerRadii;\
@dynamic jobsWidth;\
@dynamic jobsHeight;\
@dynamic jobsTop;\
@dynamic jobsLeft;\
@dynamic jobsRight;\
@dynamic jobsBottom;\
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
@dynamic buttonEdgeInsetsStyle;\
@dynamic imageTitleSpace;\
@dynamic titleSpace;\
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
@dynamic isMark;\
@dynamic presentUpHeight;\
\
@dynamic appLanguage;\
@dynamic cls;\
@dynamic viewModel;\
@dynamic viewModelMutArr;\
@dynamic reqSignal;\
@dynamic internationalizationKEY;\
@dynamic jobsTag;\
@dynamic jobsSelected;\
@dynamic isMultiLineShows;\
@dynamic isTranslucent;\
@dynamic isVisible;\
@dynamic labelShowingType;\
@dynamic layerBorderCor;\
@dynamic layerBorderWidth;\
@dynamic layerCornerRadius;\
@dynamic data;\
@dynamic requestParams;\
@dynamic jobsDataMutSet;\
@dynamic jobsDdataMutArr;\
@dynamic jobsDataMutDic;\
\
@dynamic titleAlignment;\
@dynamic btnBackgroundColor;\
@dynamic imageSize;\
@dynamic contentHorizontalAlignment;\
@dynamic contentVerticalAlignment;\
@dynamic contentEdgeInsets;\
@dynamic contentInsets;\
@dynamic contentSpacing;\
@dynamic lineBreakMode;\
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
@dynamic textLineSpacing;\
@dynamic placeholder;\
@dynamic placeholderColor;\
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
