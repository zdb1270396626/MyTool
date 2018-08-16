//
//  Tools.h
//  MyTool
//
//  Created by Jarvan-zhang on 2018/8/16.
//  Copyright © 2018年 Jarvan-zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tools : NSObject

//打印网络请求的返回结果，转换成中文
+ (void)LogNetData:(id)responseObject;

@end
