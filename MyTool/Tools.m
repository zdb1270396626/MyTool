//
//  Tools.m
//  MyTool
//
//  Created by Jarvan-zhang on 2018/8/16.
//  Copyright © 2018年 Jarvan-zhang. All rights reserved.
//

#import "Tools.h"

@implementation Tools

//打印网络请求的返回结果，转换成中文
+ (void)LogNetData:(id)responseObject {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
    // NSData转为NSString
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"jsonStr = %@", jsonStr);
}

//时间戳转字符串
+(NSString *)getFromDate:(long long)timeStamp{
    
    //时间戳转时间的方法
    NSDate *timeData = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    NSDateFormatter *dateFormatter =[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *destDateString = [dateFormatter stringFromDate:timeData];
    return destDateString;
}

//data转字符串
+ (NSString *)time_dateToString:(NSDate *)date{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString* string=[dateFormat stringFromDate:date];
    return string;
}

//正则匹配手机号
+ (BOOL)checkTelNumber:(NSString*) telNumber{
    NSString*pattern =@"^1+[3578]+\\d{9}";
    NSPredicate*pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    return isMatch;
}

// 正则匹配用户密码6-18位数字和字母组合
+ (BOOL)checkPassword:(NSString*) password{
    NSString*pattern =@"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
    NSPredicate*pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
}

//正则匹配用户身份证号15或18位
+ (BOOL)checkUserIdCard: (NSString*) idCard{
    NSString*pattern =@"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    NSPredicate*pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    BOOL isMatch = [pred evaluateWithObject:idCard];
    return isMatch;
}

//正则邮箱
+ (BOOL)isValidateEmail:(NSString *)email{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailRegex];
    BOOL isMatch =  [emailTest evaluateWithObject:email];
    return isMatch;
}

@end
