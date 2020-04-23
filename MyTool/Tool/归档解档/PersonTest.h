//
//  PersonTest.h
//  MyTool
//
//  Created by Jarvan-zhang on 2019/9/2.
//  Copyright © 2019年 Jarvan-zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonTest : NSObject

@property (nonatomic, strong)NSString *name;
@property (nonatomic, assign)int age;

//多个属性
@property (nonatomic, assign)int age1;
@property (nonatomic, assign)int age2;
@property (nonatomic, assign)int age3;
@property (nonatomic, assign)int age4;
@property (nonatomic, assign)int age5;

@end

NS_ASSUME_NONNULL_END
