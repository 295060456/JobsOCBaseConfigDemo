//
//  UICollectionViewCellProtocol.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/30.
//

#import <Foundation/Foundation.h>
#import "UIView+Extras.h"
#import "BaseCellProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UICollectionViewCellProtocol <BaseCellProtocol>

@optional
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath;
/// 获取这个UICollectionViewCell所承载的UICollectionView
-(UICollectionView *)jobsGetCurrentCollectionView;
/// 获取当前的UICollectionViewCell对应的indexPath
-(NSIndexPath *)jobsGetCurrentIndexPath;
/// 获取当前的UICollectionViewCell对应的section个数
-(NSInteger)jobsGetCurrentNumberOfSections;
/// 获取当前的UICollectionViewCell对应的section的的item个数
-(NSInteger)jobsGetCurrentNumberOfItemsInSection;
/// 获取 UITextView
-(UITextView *)getTextView;
/// 获取 UILabel
-(UILabel *)getLabel;
/// 获取 UIButton
-(UIButton *)getBgBtn;
/// 对UICollectionView上的每一组的第一个和最后一个UICollectionViewCell进行圆切角
/// 要求切第一个UICollectionViewCell的左上+右上，最后一个UICollectionViewCell的左下和右下
/// 作用域 ：UICollectionViewCell子类的 - (void)drawRect:(CGRect)rect
/// - Parameters:
///   - cellBgCor: UICollectionViewCell 的背景色
///   - cellOutLineCor: UICollectionViewCell 外线的颜色
///   - bottomLineCor: UICollectionViewCell 下线的颜色
///   - borderWidth: 切线宽
///   - cornerRadiusSize: 切线圆角度数
///   - dx: 内有介绍
///   - dy: 内有介绍
-(void)cutFirstAndLastCollectionViewCellWithBackgroundCor:(UIColor *_Nullable)cellBgCor
                                           cellOutLineCor:(UIColor *_Nullable)cellOutLineCor
                                            bottomLineCor:(UIColor *_Nullable)bottomLineCor
                                              borderWidth:(CGFloat)borderWidth
                                         cornerRadiusSize:(CGSize)cornerRadiusSize
                                                       dx:(CGFloat)dx
                                                       dy:(CGFloat)dy;
/// 除了最后一行以外，所有的cell的最下面的线为bottomLineCor
/// - Parameters:
///   - indexPath: indexPath
///   - bounds: bounds
///   - numberOfItemsInSection: 当前的UICollectionViewCell对应的section的的item个数
///   - borderWidth: 线宽
///   - bottomLineCor: cell 底部线条颜色
-(void)makeBottomLineWithIndexPath:(NSIndexPath *)indexPath
                            bounds:(CGRect)bounds
            numberOfItemsInSection:(NSInteger)numberOfItemsInSection
                       borderWidth:(CGFloat)borderWidth
                     bottomLineCor:(UIColor *_Nullable)bottomLineCor;
/// 除了第一行以外，所有的cell的最上面的线为bottomLineCor
/// - Parameters:
///   - indexPath: indexPath
///   - bounds: bounds
///   - numberOfItemsInSection: 当前的UICollectionViewCell对应的section的的item个数
///   - borderWidth: 线宽
///   - bottomLineCor: cell 底部线条颜色
-(void)makeTopLineWithIndexPath:(NSIndexPath *)indexPath
                         bounds:(CGRect)bounds
         numberOfItemsInSection:(NSInteger)numberOfItemsInSection
                    borderWidth:(CGFloat)borderWidth
                  bottomLineCor:(UIColor *_Nullable)bottomLineCor;
/// 利用UIBezierPath，对 UICollectionViewCell 描边 + 切角
/// 作用域 ：UICollectionViewCell子类的 - (void)drawRect:(CGRect)rect
/// - Parameters:
///   - borderSideType: 描边方位
///   - cellBackgroundCor: UICollectionViewCell 的背景色
///   - borderColor: 描边颜色
///   - borderWidth: 描边线宽
///   - cornerRadiusSize: 切角弧度
///   - roundingCorners: 切角方位
-(void)outlineByBezierPath:(UIBorderSideType)borderSideType
         cellBackgroundCor:(UIColor *_Nullable)cellBackgroundCor
               borderColor:(UIColor *_Nullable)borderColor
               borderWidth:(CGFloat)borderWidth
          cornerRadiusSize:(CGSize)cornerRadiusSize
           roundingCorners:(UIRectCorner)roundingCorners;
/// 利用CALayer，对 UICollectionViewCell 只描边、不切角
/// 作用域 ：UICollectionViewCell子类的 - (void)drawRect:(CGRect)rect
/// - Parameters:
///   - borderSideType: 描边方位
///   - borderColor: 描边颜色
///   - borderWidth: 描边线宽
-(void)outlineByLayer:(UIBorderSideType)borderSideType
          borderColor:(UIColor *_Nullable)borderColor
          borderWidth:(CGFloat)borderWidth;

@end

NS_ASSUME_NONNULL_END
