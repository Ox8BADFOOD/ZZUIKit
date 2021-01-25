//
//  ZZPointBar.h
//  ZZUIKit_Example
//
//  Created by Max on 2021/1/21.
//  Copyright © 2021 bymiracles@163.com. All rights reserved.
//

#import <FlexLib/FlexLib.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZPointBar : FlexCustomBaseView
/// 指针图片
@property(nonatomic,strong) UIImageView *point;
//区间容器
@property(nonatomic,strong) UIView *sectionContainer;
@property(nonatomic,strong) NSArray <NSDictionary *>*items;
@end

NS_ASSUME_NONNULL_END
