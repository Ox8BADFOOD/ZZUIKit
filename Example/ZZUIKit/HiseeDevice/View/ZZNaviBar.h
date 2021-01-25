//
//  ZZNaviBar.h
//  ZZUIKit_Example
//
//  Created by Max on 2021/1/21.
//  Copyright © 2021 bymiracles@163.com. All rights reserved.
//

#import <FlexLib/FlexLib.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZNaviBar : FlexCustomBaseView
{
    
    UIView *_view2;
    UIView *_view3;
    UIView *_view4;
}
@property(nonatomic,strong) UIView *view1;
-(void)setItems:(NSArray<NSDictionary *>*)items;
@property(nonatomic,copy) void(^barNavsBlock)(int index);
@end

NS_ASSUME_NONNULL_END
