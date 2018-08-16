//
//  DBSaveManage.m
//  MyTool
//
//  Created by Jarvan-zhang on 2018/8/14.
//  Copyright © 2018年 Jarvan-zhang. All rights reserved.
//

#import "DBSaveManage.h"

@implementation DBSaveManage
+ (void)setObject:(id)value forKey:(NSString *)defaultName
{
    if (value == nil || defaultName == nil) {
        NSLog(@"存储值不能为空");
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (id)objectForKey:(NSString *)defaultName
{
    if (defaultName == nil) {
        NSLog(@"获取key为空");
        return nil;
    }
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

+ (void)removeObjectForKey:(NSString *)defaultName
{
    if (defaultName == nil) {
        NSLog(@"获取key为空");
    }else{
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:defaultName];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}
@end
