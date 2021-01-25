//
//  ZZItemInfo.h
//  Pods
//
//  Created by Max on 2021/1/18.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface ZZItemInfo : UIView
/// 内容与容器的间距
@property(nonatomic,assign) UIEdgeInsets edgeInsets;
/// title之间的间距
@property(nonatomic,assign) CGFloat rightSpaceV;
/// image和title之前的间距
@property(nonatomic,assign) CGFloat imgTitleSpaceH;
@property(nonatomic,strong) UIImageView *imgView;

@property(nonatomic,strong) UILabel *titleLab;
@property(nonatomic,strong) UILabel *titleDescripLab;
/// title和titleDescrip之前的间距
@property(nonatomic,assign) CGFloat titlesSpaceH;

@property(nonatomic,strong) UILabel *detailTitleLab;
@end

NS_ASSUME_NONNULL_END
