//
//  UIViewController+ZZEx.m
//  ZZUIKit
//
//  Created by Max on 2021/2/23.
//

#import "UIViewController+ZZEx.h"
#import "objc/runtime.h"
#import <ZZFoundation/ZZSwizzle.h>
#import <ZZFoundation/ZZWeakify.h>
@implementation UIViewController (ZZEx)

+(void)load{
    ZZ_best_Swizzle(self, @selector(viewDidLoad), @selector(zz_viewDidLoad));
    ZZ_best_Swizzle(self, @selector(viewWillAppear:), @selector(zz_viewWillAppear));
    ZZ_best_Swizzle(self, @selector(viewDidAppear:), @selector(zz_viewDidAppear));
    ZZ_best_Swizzle(self, @selector(viewDidDisappear:), @selector(zz_viewDidDisappear));
    ZZ_best_Swizzle(self, @selector(viewWillLayoutSubviews), @selector(zz_viewWillLayoutSubviews));
    ZZ_best_Swizzle(self, @selector(viewDidLayoutSubviews), @selector(zz_viewDidLayoutSubviews));
}

#pragma mark -- viewDidLoad
-(void)zz_viewDidLoad{
    [self zz_viewDidLoad];
    if (self.zz_viewDidLoadBlock) {
        @weakify(self);
        self.zz_viewDidLoadBlock(weak_self);
    }
}

-(void)setZz_viewDidLoadBlock:(void (^)(__kindof UIViewController * _Nonnull))zz_viewDidLoadBlock{
    objc_setAssociatedObject(self, @selector(zz_viewDidLoadBlock), zz_viewDidLoadBlock, OBJC_ASSOCIATION_COPY);
}

-(void (^)(__kindof UIViewController * _Nonnull))zz_viewDidLoadBlock{
    return objc_getAssociatedObject(self, @selector(zz_viewDidLoadBlock));
}

#pragma mark -- zz_viewWillAppearBlock
-(void)zz_viewWillAppear{
    [self zz_viewWillAppear];
    if (self.zz_viewWillAppearBlock) {
        @weakify(self);
        self.zz_viewWillAppearBlock(weak_self);
    }
}

-(void)setZz_viewWillAppearBlock:(void (^)(__kindof UIViewController * _Nonnull))zz_viewWillAppearBlock{
    objc_setAssociatedObject(self, @selector(zz_viewWillAppearBlock), zz_viewWillAppearBlock, OBJC_ASSOCIATION_COPY);
}

-(void (^)(__kindof UIViewController * _Nonnull))zz_viewWillAppearBlock{
    return objc_getAssociatedObject(self, @selector(zz_viewWillAppearBlock));
}

#pragma mark -- viewDidAppearBlock
-(void)setZz_viewDidAppearBlock:(void (^)(__kindof UIViewController * _Nonnull))zz_viewDidAppearBlock{
    objc_setAssociatedObject(self, @selector(zz_viewDidAppearBlock), zz_viewDidAppearBlock, OBJC_ASSOCIATION_COPY);
}

-(void (^)(__kindof UIViewController * _Nonnull))zz_viewDidAppearBlock{
    return objc_getAssociatedObject(self, @selector(zz_viewDidAppearBlock));
}

-(void)zz_viewDidAppear{
    [self zz_viewDidAppear];
    if (self.zz_viewDidAppearBlock) {
        @weakify(self);
        self.zz_viewDidAppearBlock(weak_self);
    }
}

#pragma mark -- viewDidAppearBlock
-(void)setZz_viewDidDisappearBlock:(void (^)(__kindof UIViewController * _Nonnull))zz_viewDidDisappearBlock{
    objc_setAssociatedObject(self, @selector(zz_viewDidDisappearBlock), zz_viewDidDisappearBlock, OBJC_ASSOCIATION_COPY);
}

-(void (^)(__kindof UIViewController * _Nonnull))zz_viewDidDisappearBlock{
    return objc_getAssociatedObject(self, @selector(zz_viewDidDisappearBlock));
}

-(void)zz_viewDidDisappear{
    [self zz_viewDidDisappear];
    if (self.zz_viewDidDisappearBlock) {
        @weakify(self);
        self.zz_viewDidDisappearBlock(weak_self);
    }
}

#pragma mark -- zz_viewWillLayoutSubviewsBlock
-(void)setZz_viewWillLayoutSubviewsBlock:(void (^)(__kindof UIViewController * _Nonnull))zz_viewWillLayoutSubviewsBlock{
    objc_setAssociatedObject(self, @selector(zz_viewWillLayoutSubviews), zz_viewWillLayoutSubviewsBlock, OBJC_ASSOCIATION_COPY);
}

-(void (^)(__kindof UIViewController * _Nonnull))zz_viewWillLayoutSubviewsBlock{
    return objc_getAssociatedObject(self, @selector(zz_viewWillLayoutSubviewsBlock));
}

-(void)zz_viewWillLayoutSubviews{
    [self zz_viewWillLayoutSubviews];
    if (self.zz_viewWillLayoutSubviewsBlock) {
        @weakify(self);
        self.zz_viewWillLayoutSubviewsBlock(weak_self);
    }
}

#pragma mark -- zz_viewDidLayoutSubviewsBlock
-(void)setZz_viewDidLayoutSubviewsBlock:(void (^)(__kindof UIViewController * _Nonnull))zz_viewDidLayoutSubviewsBlock{
    objc_setAssociatedObject(self, @selector(zz_viewDidLayoutSubviewsBlock), zz_viewDidLayoutSubviewsBlock, OBJC_ASSOCIATION_COPY);
}

-(void (^)(__kindof UIViewController * _Nonnull))zz_viewDidLayoutSubviewsBlock{
    return objc_getAssociatedObject(self, @selector(zz_viewDidLayoutSubviewsBlock));
}

-(void)zz_viewDidLayoutSubviews{
    [self zz_viewDidLayoutSubviews];
    if (self.zz_viewDidLayoutSubviewsBlock) {
        @weakify(self);
        self.zz_viewDidLayoutSubviewsBlock(weak_self);
    }
}
@end
