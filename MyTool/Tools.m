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
@end
