//
//  ZZSecurity.h
//  Pods
//
//  Created by Max on 2020/12/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZSecurity : NSString
@property(nonatomic,assign) BOOL isSecurity;
@property(nonatomic,copy) NSString *securityString;

-(NSString *)security;
-(NSString *)securityWithRange:(NSRange *)range;
-(NSString *)securityToggle;
@end

NS_ASSUME_NONNULL_END
