//
//  UIControl+ZZEx.m
//  Pods
//
//  Created by Max on 2021/1/8.
//

#import "UIControl+ZZEx.h"
#import "objc/runtime.h"

@implementation UIControl (ZZEx)

/// 预期的target
- (id)zz_expectTarget{
    return self.allTargets.allObjects.firstObject;
};

/// 预期的selector,基于zz_expectTarget的第一个selector
- (SEL)zz_expectSelector{
    NSArray * selectorStrs = [self actionsForTarget:[self zz_expectTarget] forControlEvent:[self zz_expectEvent]];
    return NSSelectorFromString(selectorStrs.firstObject);
};

-(UIControlEvents )zz_expectEvent{
    UIControlEvents event;
    if ([self isMemberOfClass:[UIButton class]]) {
        event = UIControlEventTouchUpInside;
    }else if (
              [self isMemberOfClass:[UIDatePicker class]] ||
              [self isMemberOfClass:[UISegmentedControl class]] ||
              [self isMemberOfClass:[UISlider class]] ||
              [self isMemberOfClass:[UISwitch class]]
              ) {
        event = UIControlEventValueChanged;
    }else if([self isMemberOfClass:[UITextField class]]){
        event = UIControlEventEditingChanged;
    }else{
        event = UIControlEventTouchUpInside;
    }
    return event;
}


#pragma mark -- event
static void *ZZ_eventBlocKey = &ZZ_eventBlocKey;

-(void)setZz_eventBlock:(ZZControlEventsBlock)zz_eventBlock{
    objc_setAssociatedObject(self, &ZZ_eventBlocKey, zz_eventBlock, OBJC_ASSOCIATION_COPY);
    [self addTarget:self action:@selector(zz_fire) forControlEvents:[self zz_expectEvent]];
}

-(ZZControlEventsBlock)zz_eventBlock{
    return objc_getAssociatedObject(self, &ZZ_eventBlocKey);
}

- (UIControl *(^)(ZZControlEventsBlock block,UIControlEvents events))zz_eventFire{
    return ^UIControl *(ZZControlEventsBlock block,UIControlEvents events){
        self.zz_eventBlock = block;
        return self;
    };
};

-(void)zz_fire{
    if (self.zz_eventBlock) {
        self.zz_eventBlock(self);
    }
}

@end
