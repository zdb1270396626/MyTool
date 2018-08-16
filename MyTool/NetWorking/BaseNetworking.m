//
//  BaseNetworking.m
//  MyTool
//
//  Created by Jarvan-zhang on 2018/8/15.
//  Copyright © 2018年 Jarvan-zhang. All rights reserved.
//

#import "BaseNetworking.h"
#import "AppDelegate.h"



@implementation BaseNetworking


/**
 GET - 基类请求
 
 @param urlString url
 @param parameters 参数
 @param success 成功
 @param failure 失败
 */
+ (void)GET:(NSString *)urlString
 parameters:(id)parameters
    success:(successBlock)success
    failure:(failureBlock)failure
{
    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//
////    NSLog(@"接口地址:%@",[NSString stringWithFormat:@"%@%@",[BaseUrl sharedBaseUrl].url,urlString]);
//
//    manager = [AFHTTPSessionManager manager];
//    manager.requestSerializer.timeoutInterval = 30;
//
//    manager.requestSerializer=[AFJSONRequestSerializer serializer];
//    [manager.requestSerializer setValue:@"application/json"forHTTPHeaderField:@"Accept"];
//    AFSecurityPolicy *security = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//    [security setValidatesDomainName:NO];
//    security.allowInvalidCertificates = YES;
//    manager.securityPolicy = security;
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    AFHTTPSessionManager *manager = [app sharedHTTPSession];

    [manager GET:urlString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"\n\n接口地址:\n%@", [NSString stringWithFormat:@"%@%@",[BaseUrl sharedBaseUrl].url,urlString]);
        NSLog(@"\n\n参数:\n%@", [parameters mj_JSONString]);
//        NSLog(@"\n\nGET基类请求返回:\n%@", responseObject);
        
        if ([responseObject[@"resultCode"] integerValue] == 1004) {
//            [SVProgressHUD showErrorWithStatus:@"您的登录信息已过期，请重新登录"];
            [UIApplication sharedApplication].keyWindow.rootViewController = [[NSClassFromString(@"phoneLoginViewController") alloc] init];
        }
        if ([responseObject[@"resultCode"] integerValue] == 2001
            ||
            [responseObject[@"code"] integerValue] == 2001)
        {
//            [SVProgressHUD showErrorWithStatus:responseObject[@"resultMsg"]];
        }
        
        if (success) {
            //控制台转码，输出中文
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
            // NSData转为NSString
            NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            NSLog(@"jsonStr = %@", jsonStr);
            
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"\n\n接口地址:\n%@", [NSString stringWithFormat:@"%@%@",[BaseUrl sharedBaseUrl].url,urlString]);
        NSLog(@"\n\n参数:\n%@", [parameters mj_JSONString]);
        NSLog(@"\n\n网络错误返回:\n%@", error.userInfo);
        if (failure) {
            failure(error);
        }
    }];
}




/**
 POST - 基类请求请求
 
 @param urlString url
 @param parameters 参数
 @param success 成功
 @param failure 失败
 */
+ (void)POST:(NSString *)urlString
  parameters:(id)parameters
     success:(successBlock)success
     failure:(failureBlock)failure {
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    AFHTTPSessionManager *manager = [app sharedHTTPSession];
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    [manager.requestSerializer setValue:@"application/json"forHTTPHeaderField:@"Accept"];
//
//    [manager.responseSerializer.acceptableContentTypes setByAddingObjectsFromSet:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil]];
    NSString *url = [NSString stringWithFormat:@"%@",urlString];
    
    NSLog(@"\n\n请求参数parameter\n:%@\n\n", [parameters mj_JSONString]);
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"\n\n接口地址:\n%@", [NSString stringWithFormat:@"%@%@",[BaseUrl sharedBaseUrl].url,urlString]);
        NSLog(@"\n\n参数:\n%@", [parameters mj_JSONString]);
        NSLog(@"\n\n\nPOST基类网络返回:\n%@\n",responseObject);
        if (success) {
            
            NSString *errMsg = responseObject[@"err_msg"];
            errMsg = [errMsg stringByRemovingPercentEncoding];
            if (errMsg.length > 1) NSLog(@"\n=====================================================\n 网络返回信息err_msg:%@\n", errMsg);
            success(responseObject);
        } else {
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"\n\n接口地址:\n%@", [NSString stringWithFormat:@"%@%@",[BaseUrl sharedBaseUrl].url,urlString]);
        NSLog(@"\n\n参数:\n%@", [parameters mj_JSONString]);
        NSLog(@"\n\n接口：%@\n\n", urlString);
        NSLog(@"\nPOST基类网络返回失败:\n%@", error.userInfo);
        if (failure) {
            failure(error);
        }
        
    }];
}


/**
 上传的post请求
 
 @param urlString 上传的url
 @param parameters 参数
 @param data 数据流
 @param typeName 类型名字 (与后台约定)
 @param fileName 文件名字
 @param fileType 文件类型 ((图片image/jpeg, 音频amr/mp3/wmr))
 @param success 成功
 @param failure 失败
 */
+ (void)Upload:(NSString *)urlString
     parameter:(id)parameters
          data:(NSData *)data
     typeyName:(NSString *)typeName
      fileName:(NSString *)fileName
      fileType:(NSString *)fileType
       success:(successBlock)success
       failure:(failureBlock)failure {
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    AFHTTPSessionManager *manager = [app sharedHTTPSession];
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    
//    NSString *uploadUrl = [NSString stringWithFormat:@"%@%@", kUPLOADBaseURL, urlString];
//    NSLog(@"uploadURL:%@", uploadUrl);
//    [manager POST:urlString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        
//        if (data) {
//            [formData appendPartWithFileData:data name:typeName fileName:fileName mimeType:fileType];
//        }
//    } progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"\n==================================================");
//        NSLog(@"ResponseObject:%@\n", responseObject);
//        NSLog(@"======================================================");
//        !success?:success(task, responseObject);
//        if ([responseObject[@"resultCode"] integerValue] == 1004) {
//            [SVProgressHUD showErrorWithStatus:@"您的登录信息已过期，请重新登录"];
//            [UIApplication sharedApplication].keyWindow.rootViewController = [[NSClassFromString(@"phoneLoginViewController") alloc] init];
//        }
//        if ([responseObject[@"resultCode"] integerValue] == 2001
//            ||
//            [responseObject[@"code"] integerValue] == 2001)
//        {
//            [SVProgressHUD showErrorWithStatus:responseObject[@"resultMsg"]];
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"Upload error:%@", error.userInfo);
////        !failure?:failure(task, error);
//    }];
    
}




@end
