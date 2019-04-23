//
//  TXTFile.m
//  MyTool
//
//  Created by Jarvan-zhang on 2019/4/23.
//  Copyright © 2019年 Jarvan-zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 phone各个手机的屏幕尺寸
    型号            屏幕尺寸    倍数        像素         status        nav          tab
    Iphone5s              320*568    @2x          640*1136        20        64           49
    Iphone6/7/8         375*667    @2x        750*1334        20         64           49
    Iphone 6/7/8 plus       414*736    @3x        1242*2208        20         64           49
    Iphone X/Xs        357*812    @3x        1125*2436        44         88           83
    Iphone XR        414*896    @2x        828*1792            44        88           83
    Iphone Xs Max    414*896    @3x        1242*2688          44        88           83

    12.9寸apple store 截图尺寸  2048 x 2732
*/

/* *
 1.
 用GCD实现这个流程的操作比前面介绍的NSThread  NSOperation的方法都要简单。代码框架结构如下：
 dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
 // 耗时的操作
 dispatch_async(dispatch_get_main_queue(), ^{
 // 更新界面
 });
 });
 
 
 2.
 dispatch_group_async可以实现监听一组任务是否完成，完成后得到通知执行其他的操作。这个方法很有用，比如你执行三个下载任务，当三个任务都下载完成后你才通知界面说完成的了。下面是一段例子代码：
 dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
 dispatch_group_t group = dispatch_group_create();
 dispatch_group_async(group, queue, ^{
 [NSThread sleepForTimeInterval:1];
 NSLog(@"group1");
 });
 dispatch_group_async(group, queue, ^{
 [NSThread sleepForTimeInterval:2];
 NSLog(@"group2");
 });
 dispatch_group_async(group, queue, ^{
 [NSThread sleepForTimeInterval:3];
 NSLog(@"group3");
 });
 dispatch_group_notify(group, dispatch_get_main_queue(), ^{
 NSLog(@"updateUi");
 });
 dispatch_release(group);
 
 3、dispatch_barrier_async的使用
 dispatch_barrier_async是在前面的任务执行结束后它才执行，而且它后面的任务等它执行完成之后才会执行
 例子代码如下：
 dispatch_queue_t queue = dispatch_queue_create("gcdtest.rongfzh.yc", DISPATCH_QUEUE_CONCURRENT);
 dispatch_async(queue, ^{
 [NSThread sleepForTimeInterval:2];
 NSLog(@"dispatch_async1");
 });
 dispatch_async(queue, ^{
 [NSThread sleepForTimeInterval:4];
 NSLog(@"dispatch_async2");
 });
 dispatch_barrier_async(queue, ^{
 NSLog(@"dispatch_barrier_async");
 [NSThread sleepForTimeInterval:4];
 });
 dispatch_async(queue, ^{
 [NSThread sleepForTimeInterval:1];
 NSLog(@"dispatch_async3");
 });

 */
