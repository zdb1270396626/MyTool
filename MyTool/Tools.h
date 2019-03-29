//
//  Tools.h
//  MyTool
//
//  Created by Jarvan-zhang on 2018/8/16.
//  Copyright © 2018年 Jarvan-zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tools : NSObject

//打印网络请求的返回结果，转换成中文
+ (void)LogNetData:(id)responseObject;

//时间戳转字符串
+(NSString *)getFromDate:(long long)timeStamp;

//data转字符串
+ (NSString *)time_dateToString:(NSDate *)date;

// 正则匹配手机号
+ (BOOL)checkTelNumber:(NSString*) telNumber;

//正则匹配用户密码6-18位数字和字母组合
+ (BOOL)checkPassword:(NSString*) password;

//正则匹配用户身份证号
+ (BOOL)checkUserIdCard: (NSString*) idCard;

//正则邮箱
+ (BOOL)isValidateEmail:(NSString *)email;

@end
