//
//  NetWorkManager.m
//  MyTool
//
//  Created by Jarvan-zhang on 2018/8/15.
//  Copyright © 2018年 Jarvan-zhang. All rights reserved.
//

#import "NetWorkManager.h"
#import "BaseNetworking.h"


static NetWorkManager *netWorkManager;

@implementation NetWorkManager


+ (id)sharedNetWorkManager {
    @synchronized(self)
    {
        if (!netWorkManager)
            netWorkManager = [[NetWorkManager alloc] init];
        
        return netWorkManager;
    }
}

- (void)getTestDataSuccess:(successBlock)success
                     failure:(failureBlock)failure {
    
    [BaseNetworking GET:@"https://devapi.jnxbkp.com:9999/v1/index/recommand/1/10/91433886de4ab597ab27095bfc182340" parameters:nil success:success failure:failure];
    
}

/*
 接口地址：http://v.juhe.cn/toutiao/index
 返回格式：json
 请求方式：get/post
 请求示例：http://v.juhe.cn/toutiao/index?type=top&key=APPKEY
 接口备注：返回头条，社会，国内，娱乐，体育，军事，科技，财经，时尚等新闻信息
 key    是    string    应用APPKEY   98897b74471a46f32c8aa588b89a27fb
 type    否    string    类型,,top(头条，默认),shehui(社会),guonei(国内),guoji(国际),yule(娱乐),tiyu(体育)junshi(军事),keji(科技),caijing(财经),shishang(时尚)
 **/
- (void)getJuHeNewsDataType:(NSString *)type success:(successBlock)success
                    failure:(failureBlock)failure {
    NSString *key = @"98897b74471a46f32c8aa588b89a27fb";
    
    [BaseNetworking GET:[NSString stringWithFormat:@"http://v.juhe.cn/toutiao/index?type=%@&key=%@",type,key] parameters:nil success:success failure:failure];
    
}


- (void)getSupmarketListLng:(NSString *)lng Lat:(NSString *)lat province:(NSString *)prorvince city:(NSString *)city  district:(NSString *)district town:(NSString *)town success:(successBlock)success
                    failure:(failureBlock)failure {
    
    
    if (!prorvince) {
        prorvince = @"";
    }
    
    if (!city) {
        city = @"";
    }
    if (!district) {
        district = @"";
    }
    
    if (!town) {
        town = @"";
    }
    NSDictionary *dict = @{
                           @"lo":@"116.9",
                           @"la":@"36.67",
                           //                           @"lo":lng,
                           //                           @"la":lat,
                           @"province":prorvince,
                           @"city":city,
                           @"district":district,
                           @"town":town,
                           };
    [BaseNetworking GET:[NSString stringWithFormat:@"https://fresh.shctp.com.cn/api/Supermarket/index"] parameters:dict success:success failure:failure];
}


- (void)testSupmarketSuccess:(successBlock)success
                     failure:(failureBlock)failure {

    NSArray *cartArr = @[@"162",@"163"];
    NSArray *storeArr = @[@"13"];
    NSArray *goodArr = @[@"127",@"127"];
    
    NSDictionary *dict = @{
                           @"time":@"1570858064",
                           @"unique_id":@"4B535D2A-5DF6-40FC-9B8D-95825EBAF45B",
                           @"user_id":@"25",
                           @"token":@"c70a029884f0b197b869c0beb0120e20",
                           @"sign":@"72a4c15fe82cf1b5f1138093471e0341",
                           @"cart_id":cartArr,
                           @"store_id":storeArr,
                           @"goods_id":goodArr,
                           
                           };
    [BaseNetworking POST:@"https://fresh.jngbc.com.cn/api?m=Api&c=Supermarket&a=cartToOrder" parameters:dict success:success failure:failure];
}
@end
