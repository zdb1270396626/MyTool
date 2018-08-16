//
//  NSStringSize.h
//  MyTool
//
//  Created by Jarvan-zhang on 2018/8/16.
//  Copyright © 2018年 Jarvan-zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSStringSize : NSObject

//只有字号
+ (CGSize)getNSStringSize:(NSString *)str Font:(float)font;

//指定字体和字号
+ (CGSize)getNSStringSize:(NSString *)str withFontName:(NSString *)name Font:(float)font;

//指定字号和最大范围
+ (CGSize)getNSStringHeight:(NSString *)str Font:(float)font maxSize:(CGSize)maxSize;



@end
