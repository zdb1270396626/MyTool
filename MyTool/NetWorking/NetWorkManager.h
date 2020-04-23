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

/*
 接口地址：http://v.juhe.cn/toutiao/index
 返回格式：json
 请求方式：get/post
 请求示例：http://v.juhe.cn/toutiao/index?type=top&key=APPKEY
 接口备注：返回头条，社会，国内，娱乐，体育，军事，科技，财经，时尚等新闻信息
 key    是    string    应用APPKEY
 type    否    string    类型,,top(头条，默认),shehui(社会),guonei(国内),guoji(国际),yule(娱乐),tiyu(体育)junshi(军事),keji(科技),caijing(财经),shishang(时尚)
 **/
- (void)getJuHeNewsDataType:(NSString *)type success:(successBlock)success
                    failure:(failureBlock)failure;


- (void)getSupmarketListLng:(NSString *)lng Lat:(NSString *)lat province:(NSString *)prorvince city:(NSString *)city  district:(NSString *)district town:(NSString *)town success:(successBlock)success
                    failure:(failureBlock)failure;

- (void)testSupmarketSuccess:(successBlock)success
                     failure:(failureBlock)failure;
@end
