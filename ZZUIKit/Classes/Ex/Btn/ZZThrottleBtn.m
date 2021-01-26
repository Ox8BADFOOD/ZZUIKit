//
//  ZZThrottleBtn.m
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/8.
//

#import "ZZThrottleBtn.h"
#import <ZZFoundation/ZZFoundation.h>

@interface ZZThrottleBtn()
@property(nonatomic,assign) NSInteger zz_lastTouchStamp;
@property(nonatomic,assign) NSTimeInterval effectDely;
@end

@implementation ZZThrottleBtn

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.zz_throttleDuration = 1;
        self.zz_lastTouchStamp = 0;
        self.zz_throttleState = UIControlStateHighlighted;
        self.effectDely = 0.001;
    }
    return self;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  if ([[NSDate date] ZZTimeStamp] - self.zz_lastTouchStamp >= self.zz_throttleDuration) {
      
      //事件分发
       [super touchesEnded:touches withEvent:event];
      //记录时间
       self.zz_lastTouchStamp = [[NSDate date] ZZTimeStamp];
      //修改状态
      switch (self.zz_throttleState) {
          case UIControlStateDisabled:{
              self.enabled = false;
              dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((self.zz_throttleDuration + self.effectDely) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                  self.enabled = true;
              });
          }
              break;
              
          case UIControlStateSelected:{
               self.selected = true;
               dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((self.zz_throttleDuration + self.effectDely) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                   self.selected = false;
               });
          }
              break;
          default:{
              self.highlighted = true;
              dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((self.zz_throttleDuration + self.effectDely) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                  self.highlighted = false;
              });
          }
              break;
      }
      
  }else{
      self.highlighted = true;
  }
}

@end
