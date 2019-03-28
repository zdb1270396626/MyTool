//
//  UIImage+YQWatermark.h
//  dianshang
//
//  Created by haha on 2018/3/31.
//  Copyright © 2018年 yunjobs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YQWatermark)

+ (instancetype)yq_waterMarkWithImageName:(NSString *)backgroundImage andMarkImageName:(NSString *)markName;
 
// 给图片添加文字水印：
//+ (UIImage *)yq_waterImageWithImage:(UIImage *)image text:(NSString *)text textPoint:(CGPoint)point attributedString:(NSDictionary * )attributed;
+ (UIImage *)yq_waterImageWithImage:(UIImage *)image text:(NSString *)text textPoint:(CGPoint)point;

//+ (UIImage *)textStr:(NSString *)text attributed:(NSDictionary *)attributed;
//+ (UIImage *)textStr:(NSString *)text;

@end
