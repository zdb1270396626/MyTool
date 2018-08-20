//
//  DBAFHTTPSessionManager.m
//  MyTool
//
//  Created by Jarvan-zhang on 2018/8/20.
//  Copyright © 2018年 Jarvan-zhang. All rights reserved.
//

#import "DBAFHTTPSessionManager.h"

@implementation DBAFHTTPSessionManager

static DBAFHTTPSessionManager *manager ;

+ (DBAFHTTPSessionManager *)sharedHTTPSession {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [DBAFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval = 10;
        
        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        [manager.requestSerializer setValue:@"application/json"forHTTPHeaderField:@"Accept"];
        [manager.responseSerializer.acceptableContentTypes setByAddingObjectsFromSet:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil]];
        AFSecurityPolicy *security = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        [security setValidatesDomainName:NO];
        security.allowInvalidCertificates = YES;
        manager.securityPolicy = security;
        
    });
    return manager;
}
@end
