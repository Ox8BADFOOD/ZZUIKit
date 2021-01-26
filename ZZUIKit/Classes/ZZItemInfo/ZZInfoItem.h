//
//  ZZInfoItem.h
//  Aspects
//
//  Created by Max on 2021/1/26.
//

#import <FlexLib/FlexLib.h>
#import <ZZUIKit/ZZUIKitConst.h>
NS_ASSUME_NONNULL_BEGIN

@interface ZZInfoItem : FlexCustomBaseView
@property(nonatomic,strong) UILabel *title;
@property(nonatomic,strong) UILabel *subtitle;
@property(nonatomic,strong) UILabel *describe;
@property(nonatomic,strong) UIView *describeContainer;
@property(nonatomic,strong) NSArray<NSDictionary *> *subItems;
@end

NS_ASSUME_NONNULL_END
