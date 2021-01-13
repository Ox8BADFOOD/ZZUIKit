//
//  NSString+ZZRegex.h
//  InternetHospital
//
//  Created by Max on 2020/12/14.
//  Copyright © 2020 GaoLian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ZZRegex)


/// 是不是阿拉伯数字或小数点
-(BOOL)ZZCheckAllNumber;

/// 是否是中文
- (BOOL)ZZCheckAllChinese;

/// 是否全英文
- (BOOL)ZZCheckAllEnglish;

/// 是否包含英文
- (BOOL)ZZCheckContainEnglish;


/// 是否英文大写
- (BOOL)ZZCheckCapitalLetter;

/// 是否英文小写
- (BOOL)ZZCheckSmallLetter;

/// 有效的密码 长度为6到20位,包含字母、数字、不能为中文
- (BOOL)ZZCheckValidPassword;

/// 是不是全为空格
- (BOOL)ZZCheckAllSpace;
/// 包含一个以上空格
- (BOOL)ZZCheckContainSpace;
/// 是不是url
-(BOOL)ZZCheckUrl;

/// 有效的人名 姓名校验规则(最多5个汉字)
- (BOOL)ZZCheckPersonName;

/// 昵称 长度2-10
- (BOOL)ZZCheckNickName;
/// 是不是电话号码
- (BOOL)ZZCheckPhoneNumber;


///  单位名称校验规则(20个汉字)
- (BOOL)ZZCheckCompanyName;
/// 验证码
- (BOOL)ZZCheckVerifyCode:(int)length;

/// 身份证
-(BOOL)ZZCheckIDCardNumber:(NSString *)value;

/// 邮政编码
- (BOOL)ZZCheckZipcode;


@end

NS_ASSUME_NONNULL_END
