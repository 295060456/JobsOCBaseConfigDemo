//
//  JobsIMChatInfoTBVCell.m
//  JobsIM
//
//  Created by Jobs on 2020/11/10.
//

#import "JobsIMChatInfoTBVCell.h"

@interface JobsIMChatInfoTBVCell ()
/// UI
Prop_strong()UIImageView *iconIMGV;/// 用户头像
Prop_strong()UIImageView *chatBubbleIMGV;/// 聊天气泡
Prop_strong()UILabel *chatUserNameLab;/// 用户名
Prop_strong()UILabel *chatContentLab;/// 聊天信息承接
Prop_strong()UILabel *timeLab;
Prop_strong()UILongPressGestureRecognizer *longPG;
Prop_strong()NSMutableArray <UIImage *>*chatBubbleMutArr;
Prop_strong()NSMutableArray <UIMenuItem *>*menuItemMutArr;
/// data
Prop_copy()NSString *senderChatTextStr;/// 该聊天的文本信息
Prop_copy()NSString *senderChatTextTimeStr;/// 该聊天的时间戳
Prop_copy()NSString *senderUserNameStr;/// 用户名
Prop_strong()UIImage *senderChatUserIconIMG;/// 该聊天的用户头像
Prop_copy()NSString *identification;/// 该聊天对应的数据库坐标ID
Prop_assign()CGFloat contentHeight;/// 内容高
Prop_assign()CGFloat contentWidth;/// 内容宽
Prop_assign()InfoLocation infoLocation;
Prop_strong()NSMutableArray <MGSwipeButtonModel *>*leftBtnMutArr;
Prop_strong()NSMutableArray <MGSwipeButtonModel *>*rightBtnMutArr;

@end

@implementation JobsIMChatInfoTBVCell
UITextFieldProtocol_synthesize_part2
-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        self.longPG.enabled = YES;
        self.swipeBackgroundColor = JobsClearColor;
        self.selectedBackgroundView = UIView.new;
        self.selectedBackgroundView.backgroundColor = JobsYellowColor.colorWithAlphaComponentBy(.3f);
        self.leftSwipeSettings.transition = MGSwipeTransitionBorder;
        self.rightSwipeSettings.transition = MGSwipeTransitionDrag;
        self.leftExpansion.buttonIndex = 0;
        self.leftExpansion.fillOnTrigger = NO;
        self.rightExpansion.buttonIndex = 0;
        self.rightExpansion.fillOnTrigger = YES;
        self.leftButtons = self.createLeftButtons;
        self.rightButtons = self.createRightButtons;
    }return self;
}
#pragma mark —— BaseCellProtocol
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleValue1WithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsIMChatInfoTBVCell *cell = JobsRegisterDequeueTableViewDefaultCell(JobsIMChatInfoTBVCell);
        return cell;
    };
}

+(JobsReturnCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        if ([data isKindOfClass:JobsIMChatInfoModel.class]){
//            JobsIMChatInfoModel *chatInfoModel = (JobsIMChatInfoModel *)data;
    #warning 这里需要被修改
            CGFloat CellHeight = 0;
    //        CGFloat CellHeight = [chatInfoModel.chatTextStr getContentHeightOrWidthWithParagraphStyleLineSpacing:0
    //                                                                                       calcLabelHeight_Width:CalcLabelHeight
    //                                                                                                        font:NULL
    //                                                                                boundingRectWithHeight_Width:JobsIMChatInfoTBVChatContentLabWidth()];
            JobsLog(@"%f",CellHeight);
            return (CellHeight < JobsIMChatInfoTBVDefaultCellHeight() ? JobsIMChatInfoTBVDefaultCellHeight() : CellHeight) + (JobsIMChatInfoTBVDefaultCellHeight() / 2 - 5);
        }else{
            return 0;
        }
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        if ([model isKindOfClass:JobsIMChatInfoModel.class]) {
            JobsIMChatInfoModel *chatInfoModel = (JobsIMChatInfoModel *)model;
            if (chatInfoModel.identification.isEqualToString(JobsInternationalization(@"我是服务器"))) {/// 对方发的消息
                self.infoLocation = InfoLocation_Left;
            }else if (chatInfoModel.identification.isEqualToString(JobsInternationalization(@"我是我自己"))){/// 自己发的消息
                self.infoLocation = InfoLocation_Right;
            }else{
                self.infoLocation = InfoLocation_Unknown;
            }
            
            self.senderChatTextStr = chatInfoModel.chatTextStr;
            self.senderChatTextTimeStr = chatInfoModel.chatTextTimeStr;
            self.senderChatUserIconIMG = chatInfoModel.userIconIMG;
            self.senderUserNameStr = chatInfoModel.userNameStr;
            self.identification = chatInfoModel.identification;
            
    #warning 这里需要被修改
            //先定宽，再定高
    //        CGFloat contentWidthTemp = [self.senderChatTextStr getContentHeightOrWidthWithParagraphStyleLineSpacing:0
    //                                                                                          calcLabelHeight_Width:CalcLabelWidth
    //                                                                                                           font:NULL
    //                                                                                   boundingRectWithHeight_Width:JobsIMChatInfoTBVDefaultCellHeight()];
    //        //保证最小宽度 且 小于最大宽度
    //        self.contentWidth = MIN(JobsIMChatInfoTBVChatContentLabWidth(), MAX(JobsIMChatInfoTBVChatContentLabDefaultWidth(), contentWidthTemp));
    //
    //        self.contentHeight = [self.senderChatTextStr getContentHeightOrWidthWithParagraphStyleLineSpacing:0
    //                                                                                    calcLabelHeight_Width:CalcLabelHeight
    //                                                                                                     font:NULL
    //                                                                             boundingRectWithHeight_Width:self.contentWidth];
            
            JobsLog(@"contentHeight = %f",self.contentHeight);
            JobsLog(@"contentWidth = %f",self.contentWidth);
            
            self.iconIMGV
                    .imageURL(chatInfoModel.userIconURLStr.jobsUrl)
                    .placeholderImage(chatInfoModel.userIconIMG)
                    .options(self.makeSDWebImageOptions)
                    .completed(^(UIImage * _Nullable image,
                                 NSError * _Nullable error,
                                 SDImageCacheType cacheType,
                                 NSURL * _Nullable imageURL) {
                        if (error) {
                            JobsLog(@"aa图片加载失败: %@-%@", error,imageURL);
                        } else {
                            JobsLog(@"图片加载成功");
                        }
                    }).load();
            self.chatUserNameLab.alpha = self.isShowChatUserName;
            self.chatBubbleIMGV.alpha = 1;
            self.chatContentLab.alpha = 1;
            self.timeLab.alpha= 1;
        } return self;
    };
}
#pragma mark —— UITableViewCellProtocol
-(JobsReturnMGSwipeTableCellByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^JobsIMChatInfoTBVCell *_Nonnull(id<MGSwipeTableCellDelegate> delegate){
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}
#pragma mark —— 一些私有化方法
-(NSArray *)createLeftButtons{
    @jobs_weakify(self)
    return jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
        @jobs_strongify(self)
        for (MGSwipeButtonModel *model in self.leftBtnMutArr) {
            arr.add([MGSwipeButton buttonWithTitle:model.titleStr
                                              icon:model.IconIMG
                                   backgroundColor:model.bgCor
                                           padding:15
                                          callback:^BOOL(MGSwipeTableCell * sender){
                JobsLog(@"Convenience callback received (left).");
                return YES;
            }]);
        }
    });;
}

-(JobsReturnTableViewCellByBOOLBlock _Nonnull)byAllowsMultipleSwipe{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.allowsMultipleSwipe = YES;
        return self;
    };
}

-(JobsReturnTableViewCellByBOOLBlock _Nonnull)byShowChatUserName{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.isShowChatUserName = YES;
        return self;
    };
}

-(NSArray *)createRightButtons{
    @jobs_weakify(self)
    return jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
        @jobs_strongify(self)
        for (MGSwipeButtonModel *model in self.rightBtnMutArr) {
            arr.add([MGSwipeButton buttonWithTitle:model.titleStr
                                              icon:model.IconIMG
                                   backgroundColor:model.bgCor
                                           padding:15
                                          callback:^BOOL(MGSwipeTableCell * sender){
                JobsLog(@"Convenience callback received (left).");
                return YES;
            }]);
        }
    });;
}

-(void)menuTopBtnPressed:(id)sender{
    JobsLog(@"123");
}

-(void)menuDelBtnPressed:(id)sender{
    JobsLog(@"456");
}

-(BOOL)canPerformAction:(SEL)action
             withSender:(id)sender{
    return action == @selector(menuDelBtnPressed:) || action == @selector(menuTopBtnPressed:);
}

-(BOOL)canBecomeFirstResponder{
    return YES;
}
#pragma mark —— lazyLoad
-(UIImageView *)iconIMGV{
    if (!_iconIMGV) {
        @jobs_weakify(self)
        _iconIMGV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            [self.contentView.addSubview(imageView) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsIMChatInfoTBVDefaultCellHeight() - 5, JobsIMChatInfoTBVDefaultCellHeight() - 5));
                make.top.equalTo(self.contentView).offset(5);
                switch (self.infoLocation) {
                    case InfoLocation_Left:{
                        make.left.equalTo(self.contentView).offset(10);
                    }break;
                    case InfoLocation_Right:{
                        make.right.equalTo(self.contentView).offset(-10);
                    }break;
                    default:
                        break;
                }
            }];
        });
    }return _iconIMGV;
}

-(UIImageView *)chatBubbleIMGV{
    if (!_chatBubbleIMGV) {
        @jobs_weakify(self)
        _chatBubbleIMGV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            switch (self.infoLocation) {
                case InfoLocation_Left:{
                    imageView.image = self.chatBubbleMutArr[0];
                }break;
                case InfoLocation_Right:{
                    imageView.image = self.chatBubbleMutArr[1];
                }break;
                default:
                    break;
            }
            [self.contentView.addSubview(imageView) mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.equalTo(self.iconIMGV.mas_centerY);
                make.bottom.equalTo(self.contentView).offset(-5);
                make.width.mas_equalTo(self.contentWidth);
                
                switch (self.infoLocation) {
                    case InfoLocation_Left:{
                        make.left.equalTo(self.iconIMGV.mas_right).offset(5);
                        
                    }break;
                    case InfoLocation_Right:{
                        make.right.equalTo(self.iconIMGV.mas_left).offset(-5);
                    }break;
                    default:
                        break;
                }
            }];
        });
    }return _chatBubbleIMGV;
}

-(UILabel *)chatUserNameLab{
    if (!_chatUserNameLab) {
        @jobs_weakify(self)
        _chatUserNameLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.textColor = JobsBlackColor;
            label.font = UIFontWeightRegularSize(JobsWidth(10));
            label.textAlignment = NSTextAlignmentCenter;
            label.text = self.senderUserNameStr;
            [self.contentView.addSubview(label) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.iconIMGV);
                make.bottom.equalTo(self.iconIMGV.mas_centerY).offset(-3);
                switch (self.infoLocation) {
                    case InfoLocation_Left:{
                        make.left.equalTo(self.iconIMGV.mas_right).offset(5);
                    }break;
                    case InfoLocation_Right:{
                        make.right.equalTo(self.iconIMGV.mas_left).offset(-5);
                    }break;
                    default:
                        break;
                }
            }];label.makeLabelByShowingType(UILabelShowingType_03);
        });
    }return _chatUserNameLab;
}

-(UILabel *)chatContentLab{
    if (!_chatContentLab) {
        @jobs_weakify(self)
        _chatContentLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.numberOfLines = 0;
            label.textColor = JobsBlackColor;
            label.font = UIFontWeightRegularSize(JobsWidth(10));
            
            switch (self.infoLocation) {
                case InfoLocation_Left:{
                    label.textAlignment = NSTextAlignmentRight;
                }break;
                case InfoLocation_Right:{
                    label.textAlignment = NSTextAlignmentLeft;
                }break;
                default:
                    break;
            }
    
            label.text = self.senderChatTextStr;
            [self.chatBubbleIMGV.addSubview(label) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.chatBubbleIMGV).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
            }];
        });
    }return _chatContentLab;
}

-(UILabel *)timeLab{
    if (!_timeLab) {
        @jobs_weakify(self)
        _timeLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.font = UIFontWeightRegularSize(JobsWidth(10));
            label.textAlignment = NSTextAlignmentCenter;
            label.text = self.senderChatTextTimeStr;
            label.textColor = JobsWhiteColor;
            label.backgroundColor = JobsLightGrayColor;
            [self.contentView.addSubview(label) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.chatBubbleIMGV);
                make.size.mas_equalTo(CGSizeMake(JobsIMChatInfoTimeLabWidth(), 20));
                switch (self.infoLocation) {
                    case InfoLocation_Left:{
                        make.left.equalTo(self.chatBubbleIMGV.mas_right).offset(5);
                    }break;
                    case InfoLocation_Right:{
                        make.right.equalTo(self.chatBubbleIMGV.mas_left).offset(-5);
                    }break;
                    default:
                        break;
                }
            }];
            label.makeLabelByShowingType(UILabelShowingType_03);
            label.cornerCutToCircleWithCornerRadius(20 / 2);
        });
    }return _timeLab;
}

-(NSMutableArray<UIImage *> *)chatBubbleMutArr{
    if (!_chatBubbleMutArr) {
        _chatBubbleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <UIImage *>* _Nullable arr) {
            arr.add(@"左气泡".img)
            .add(@"右气泡".img);
        });
    }return _chatBubbleMutArr;
}

-(UILongPressGestureRecognizer *)longPG{
    if (!_longPG) {
        @jobs_weakify(self)
        _longPG = [jobsMakeLongPressGesture(^(UILongPressGestureRecognizer * _Nullable gesture) {
            /// 这里写手势的配置
        }) GestureActionBy:^(__kindof UIGestureRecognizer * _Nullable gesture) {
            @jobs_strongify(self)
            if (gesture.state == UIGestureRecognizerStateBegan) {
                JobsIMChatInfoTBVCell *cell = (JobsIMChatInfoTBVCell *)gesture.view;
                //这里把cell做为第一响应(cell默认是无法成为responder,需要重写canBecomeFirstResponder方法)
                [cell becomeFirstResponder];
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
                jobsMakeMenuController(^(__kindof UIMenuController * _Nullable menuController) {
                    @jobs_strongify(self)
                    menuController.arrowDirection = UIMenuControllerArrowDefault;/// 控制箭头方向
                    menuController.menuItems = self.menuItemMutArr;/// 自定义事件
                    if (@available(iOS 13.0, *)) {
                        [menuController showMenuFromView:self rect:cell.chatBubbleIMGV.frame];
                    }else{
                        [menuController setTargetRect:cell.frame inView:self];
                        [menuController setMenuVisible:YES animated:YES];
                    }
                });
#pragma clang diagnostic pop
            }
        }];self.addGesture(_longPG);
    }return _longPG;
}

-(NSMutableArray<UIMenuItem *> *)menuItemMutArr{
    if (!_menuItemMutArr) {
        _menuItemMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <UIMenuItem *>* _Nullable arr) {
            arr.add(JobsInternationalization(@"置顶").initMenuItemBy(@selector(menuTopBtnPressed:)))
            .add(JobsInternationalization(@"删除").initMenuItemBy(@selector(menuDelBtnPressed:)));
        });
    }return _menuItemMutArr;
}

-(NSMutableArray<MGSwipeButtonModel *> *)leftBtnMutArr{
    if (!_leftBtnMutArr) {
        _leftBtnMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
            arr.add(jobsMakeMGSwipeButtonModel(^(__kindof MGSwipeButtonModel * _Nullable model) {
                model.titleStr = JobsInternationalization(@"L1");
                model.IconIMG = @"Check".img;
                model.bgCor = JobsGreenColor;
            }))
            .add(jobsMakeMGSwipeButtonModel(^(__kindof MGSwipeButtonModel * _Nullable model) {
                model.titleStr = JobsInternationalization(@"L2");
                model.IconIMG = @"Fav".img;
                model.bgCor = RGBA_COLOR(0, 0x99, 0xcc, 1);
            }))
            .add(jobsMakeMGSwipeButtonModel(^(__kindof MGSwipeButtonModel * _Nullable model) {
                model.titleStr = JobsInternationalization(@"L3");
                model.IconIMG = @"Menu".img;
                model.bgCor = RGBA_COLOR(0.59, 0.29, 0.08, 1);
            }));
        });
    }return _leftBtnMutArr;
}

-(NSMutableArray<MGSwipeButtonModel *> *)rightBtnMutArr{
    if (!_rightBtnMutArr) {
        _rightBtnMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
            arr.add(jobsMakeMGSwipeButtonModel(^(__kindof MGSwipeButtonModel * _Nullable model) {
                model.titleStr = @"R1";
                model.IconIMG = @"Class".img;
                model.bgCor = JobsPurpleColor;
            }))
            .add(jobsMakeMGSwipeButtonModel(^(__kindof MGSwipeButtonModel * _Nullable model) {
                model.titleStr = @"R2";
                model.IconIMG = @"Drop".img;
                model.bgCor = JobsDarkTextColor;
            }))
            .add(jobsMakeMGSwipeButtonModel(^(__kindof MGSwipeButtonModel * _Nullable model) {
                model.titleStr = @"R3";
                model.IconIMG = @"Header".img;
                model.bgCor = JobsCyanColor;
            }));
        });
    }return _rightBtnMutArr;
}

@end
