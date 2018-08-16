//
//  NetWorkManager.h
//  MyTool
//
//  Created by Jarvan-zhang on 2018/8/15.
//  Copyright © 2018年 Jarvan-zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseNetworking.h"

@interface NetWorkManager : NSObject

//创建个单例
+ (id)sharedNetWorkManager;

/****
扩展接口方法
*****/
- (void)getTestDataSuccess:(successBlock)success
                       failure:(failureBlock)failure;
@end
