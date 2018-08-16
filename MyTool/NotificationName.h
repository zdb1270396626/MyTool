//
//  NotificationName.h
//  MyTool
//
//  Created by Jarvan-zhang on 2018/8/16.
//  Copyright © 2018年 Jarvan-zhang. All rights reserved.
//

#ifndef NotificationName_h
#define NotificationName_h


#define PostNotificationNameUserInfo(_notificationName_, _userInfo_)  [[NSNotificationCenter defaultCenter] postNotificationName:_notificationName_ object:nil userInfo:_userInfo_];

#define ListenNotificationName_Func(_notificationName_, _Func_) [[NSNotificationCenter defaultCenter] addObserver:self selector:_Func_ name:_notificationName_ object:nil];

//添加通知的标识
#define notificationTitle @"notificationTitle"

#endif /* NotificationName_h */

/***
  无参数
  PostNotificationNameUserInfo(EvaluateComplete, nil);
  ListenNotificationName_Func(EvaluateComplete, @selector(notificationFunc:));
 
 有参数
 PostNotificationNameUserInfo(ReceviceGift, @{@"Gift":gift});
 ListenNotificationName_Func(ReceviceGift, @selector(receviceGift:));
 **/
