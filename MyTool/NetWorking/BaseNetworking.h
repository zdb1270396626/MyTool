//
//  BaseNetworking.h
//  MyTool
//
//  Created by Jarvan-zhang on 2018/8/15.
//  Copyright © 2018年 Jarvan-zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^successBlock)(id resultDic);
typedef void(^failureBlock)(NSError *error);
typedef void(^progressBlock)(CGFloat f);

@interface BaseNetworking : NSObject


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
    failure:(failureBlock)failure;



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
     failure:(failureBlock)failure;


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
       failure:(failureBlock)failure;



@end
