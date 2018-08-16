//
//  DBSaveManage.h
//  MyTool
//
//  Created by Jarvan-zhang on 2018/8/14.
//  Copyright © 2018年 Jarvan-zhang. All rights reserved.
//
//添加需要保存的宏定义
#define userName      @"name"
#define userPwd       @"passwork"

#import <Foundation/Foundation.h>

@interface DBSaveManage : NSObject
//添加
+ (void)setObject:(id)value forKey:(NSString *)defaultName;
//取
+ (id)objectForKey:(NSString *)defaultName;
//移除
+ (void)removeObjectForKey:(NSString *)defaultName;

@end
