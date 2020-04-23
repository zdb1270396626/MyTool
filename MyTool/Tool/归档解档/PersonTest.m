//
//  PersonTest.m
//  MyTool
//
//  Created by Jarvan-zhang on 2019/9/2.
//  Copyright © 2019年 Jarvan-zhang. All rights reserved.
//

#import "PersonTest.h"
#import <objc/message.h>

@implementation PersonTest

//归档
- (void)encodeWithCoder:(NSCoder *)coder {
    //少量---1
//    [coder encodeObject:self.name forKey:@"name"];
//    [coder encodeInteger:self.age forKey:@"age"];
    
    //多个----2
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([PersonTest class], &count);
    for (int i = 0; i < count; i ++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        //归档
        [coder encodeObject:[self valueForKey:key] forKey:key];
    }
    free(ivars);
}
//解档
- (instancetype)initWithCoder:(NSCoder *)coder {
//    if (self = [super init]) {
//        _name = [coder decodeObjectForKey:@"name"];
//        _age = [coder decodeIntegerForKey:@"age"];
//    }
//    return self;
    
        if (self = [super init]) {
            unsigned int count = 0;
            Ivar *ivars = class_copyIvarList([PersonTest class], &count);
            for (int i = 0; i < count; i ++) {
                Ivar ivar = ivars[i];
                const char *name = ivar_getName(ivar);
                NSString *key = [NSString stringWithUTF8String:name];
                //解档
               id value = [coder decodeObjectForKey:key];
                //设置到成员变量身上
                [self setValue:value forKey:key];
            }
            free(ivars);
        }
        return self;
}

@end
