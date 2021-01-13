//
//  UIView+ZZGesture.m
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/7.
//

#import "UIView+ZZGesture.h"
#import "objc/runtime.h"
#import <ZZFoundation/ZZFoundation.h>
@interface UIView ()

@end


@implementation UIView (ZZGesture)


#pragma mark -- tap
//------- 添加属性 -------//
static void *zz_tapBlocKey = &zz_tapBlocKey;
- (ZZTapActionBlock)zz_tapBlock {
    return objc_getAssociatedObject(self, &zz_tapBlocKey);
}
- (void)setZz_tapBlock:(ZZTapActionBlock)zz_tapBlock {
    objc_setAssociatedObject(self, &zz_tapBlocKey, zz_tapBlock, OBJC_ASSOCIATION_COPY);
}

-(UIView *(^) (ZZTapActionBlock))zz_tapAction{
    return ^UIView *(ZZTapActionBlock block){
        for (UIGestureRecognizer *gesture in self.gestureRecognizers) {
            if ([gesture isKindOfClass:[UITapGestureRecognizer class]]) {
                [self removeGestureRecognizer:gesture];
            }
        }
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFire)];
        [self addGestureRecognizer:tap];
        self.zz_tapBlock = block;
        return self;
    };
};

// 按钮点击
- (void)tapFire{
    if (self.zz_tapBlock) {
        self.zz_tapBlock(self);
    }
}

#pragma mark -- longTap
//------- 添加属性 -------//
static void *zz_longTapBlocKey = &zz_longTapBlocKey;
- (ZZTapActionBlock)zz_longTapBlock {
   return objc_getAssociatedObject(self, &zz_longTapBlocKey);
}
- (void)setZz_longTapBlock:(ZZTapActionBlock)zz_longTapBlock {
   objc_setAssociatedObject(self, &zz_longTapBlocKey, zz_longTapBlock, OBJC_ASSOCIATION_COPY);
}

-(UIView *(^) (ZZTapActionBlock))zz_longTapAction{
   return ^UIView *(ZZTapActionBlock block){
       for (UIGestureRecognizer *gesture in self.gestureRecognizers) {
           if ([gesture isKindOfClass:[UILongPressGestureRecognizer class]]) {
               [self removeGestureRecognizer:gesture];
           }
       }
       UILongPressGestureRecognizer *tap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longTapFire:)];
       [self addGestureRecognizer:tap];
       self.zz_longTapBlock = block;
       return self;
   };
}

// 按钮点击
- (void)longTapFire:(UIGestureRecognizer *)gestrue{
   if (gestrue.state == UIGestureRecognizerStateBegan) {
       if (self.zz_longTapBlock) {
           self.zz_longTapBlock(self);
       }
   }
}
@end
