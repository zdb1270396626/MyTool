//
//  DBAFHTTPSessionManager.h
//  MyTool
//
//  Created by Jarvan-zhang on 2018/8/20.
//  Copyright © 2018年 Jarvan-zhang. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface DBAFHTTPSessionManager : AFHTTPSessionManager

+ (DBAFHTTPSessionManager *)sharedHTTPSession;
@end
