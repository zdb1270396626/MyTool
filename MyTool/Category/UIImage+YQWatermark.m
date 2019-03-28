//
//  UIImage+YQWatermark.m
//  dianshang
//
//  Created by haha on 2018/3/31.
//  Copyright © 2018年 yunjobs. All rights reserved.
//

#import "UIImage+YQWatermark.h"
#import "NSString+StringSize.h"
@implementation UIImage (YQWatermark)

+ (instancetype)yq_waterMarkWithImageName:(NSString *)backgroundImage andMarkImageName:(NSString *)markName
{
    
    UIImage *bgImage = [UIImage imageNamed:backgroundImage];
    
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, 0.0);
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    
    UIImage *waterImage = [UIImage imageNamed:markName];
    CGFloat scale = 0.3;
    CGFloat margin = 5;
    CGFloat waterW = waterImage.size.width * scale;
    CGFloat waterH = waterImage.size.height * scale;
    CGFloat waterX = bgImage.size.width - waterW - margin;
    CGFloat waterY = bgImage.size.height - waterH - margin;
    
    [waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

// 给图片添加文字水印：
+ (UIImage *)yq_waterImageWithImage:(UIImage *)image text:(NSString *)text textPoint:(CGPoint)point
{
    UIColor *textColor = [UIColor redColor];
//    NSInteger fontSize  =image.size.height/image.size.width*APP_WIDTH/3;
    NSInteger fontSize = 24.0;
    CGRect viewFrame = CGRectMake(0, 0, image.size.width, image.size.height);
    CGRect textFrame = CGRectMake(10, 10, image.size.width-10, 50);
    if (!text)      {  return image;   }
//    if (!fontSize)  {  fontSize = 17;   }
    if (!textColor) {  textColor = [UIColor blackColor];   }
    if (!image)     {  return nil;  }
//    if (viewFrame.size.height==0 || viewFrame.size.width==0 || textFrame.size.width==0 || textFrame.size.height==0 ){return nil;}
    
    NSString *mark = text;
    CGFloat height = [mark sizeWithPreferWidth:textFrame.size.width font:[UIFont systemFontOfSize:fontSize]].height; // 此分类方法要导入头文件
    if ((height + textFrame.origin.y) > viewFrame.size.height) { // 文字高度超出父视图的宽度
        height = viewFrame.size.height - textFrame.origin.y;
    }
    
    //    CGFloat w = image.size.width;
    //    CGFloat h = image.size.height;
    UIGraphicsBeginImageContext(viewFrame.size);
    [image drawInRect:CGRectMake(0, 0, viewFrame.size.width, viewFrame.size.height)];
    NSDictionary *attr = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize], NSForegroundColorAttributeName : textColor };
    //位置显示
    [mark drawInRect:CGRectMake(textFrame.origin.x, textFrame.origin.y, textFrame.size.width, height) withAttributes:attr];
    
    UIImage *aimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //返回图片
    return aimg;
}



+ (UIImage *)textStr:(NSString *)text imageW:(CGFloat)imageW
{
    //text = [text stringByAppendingString:text];
    
    CGFloat texth = APP_WIDTH/10*1.5;
    
    //文字的属性
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = NSTextAlignmentLeft;
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:texth-10],NSParagraphStyleAttributeName:style,NSForegroundColorAttributeName:[UIColor redColor]};
    /*计算宽度时要确定高度*/
    CGRect rect = [text boundingRectWithSize:CGSizeMake(imageW-30, texth) options:NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:dic context:nil];
    
    rect = CGRectMake(0, 0, 700, 2435);
    
    //1.开启上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    //2.添加水印文字
    [text drawInRect:rect withAttributes:dic];
    
    //3.从上下文中获取新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //NSLog(@"%f,%f",newImage.size.width,newImage.size.height);
    //4.关闭图形上下文
    UIGraphicsEndImageContext();
    //返回图片
    return newImage;
}

+ (UIImage *)textStr1:(NSString *)text
{
    CGFloat texth = APP_WIDTH/10*1;
    
    //文字的属性
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = NSTextAlignmentLeft;
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:texth-10],NSParagraphStyleAttributeName:style,NSForegroundColorAttributeName:[UIColor whiteColor],NSBackgroundColorAttributeName:RGBA(0, 0, 0, 0.7)};
    /*计算宽度时要确定高度*/
    CGRect rect = [text boundingRectWithSize:CGSizeMake(0, texth) options:NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:dic context:nil];
    
    //1.开启上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    //2.添加水印文字
    [text drawInRect:rect withAttributes:dic];
    //3.从上下文中获取新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //NSLog(@"%f,%f",newImage.size.width,newImage.size.height);
    //4.关闭图形上下文
    UIGraphicsEndImageContext();
    //返回图片
    return newImage;
}

@end
