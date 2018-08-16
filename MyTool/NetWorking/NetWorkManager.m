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
@end
