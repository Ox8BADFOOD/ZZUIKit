//
//  ZZSelect.h
//  ZZUIKit
//
//  Created by Max on 2021/3/9.
//

#import <FlexLib/FlexLib.h>

NS_ASSUME_NONNULL_BEGIN

/// 包裹ZZCheckBox
@interface ZZSelect : FlexCustomBaseView
/// 选中的标签数组
@property(nonatomic,strong) NSMutableArray *selectArr;
@property(nonatomic,copy) void (^selectBlock)(NSMutableArray *arr);
@end

NS_ASSUME_NONNULL_END
