//
//  ImageTextViewController.m
//  MyTool
//
//  Created by Jarvan-zhang on 2019/8/28.
//  Copyright © 2019年 Jarvan-zhang. All rights reserved.
//

#import "ImageTextViewController.h"


@interface ImageTextViewController () {
    float time;
}

@property (nonatomic,strong)NSTimer *timer;

@end

@implementation ImageTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    ,@"https://image.shctp.cn//public/upload/store/4/goods_album/40c52682a1c00c574f4727a23f27dc1a.jpg",@"https://image.shctp.cn//public/upload/store/4/goods_album/2a10901d9ed59e961cb6d6615644ac35.jpg",@"https://image.shctp.cn//public/upload/store/4/goods_album/7e0cc7ea356563688070ad95a2709c6b.jpg"
    NSArray *imageArr = [NSArray arrayWithObjects:@"https://image.shctp.cn//public/upload/store/4/goods_album/f4c22b930fe815f67daf48fbac9e49da.jpg",@"https://image.shctp.cn//public/upload/store/4/goods_album/40c52682a1c00c574f4727a23f27dc1a.jpg",@"https://image.shctp.cn//public/upload/store/4/goods_album/2a10901d9ed59e961cb6d6615644ac35.jpg",@"https://image.shctp.cn//public/upload/store/4/goods_album/7e0cc7ea356563688070ad95a2709c6b.jpg", nil];
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, WIDTH)];
    scroll.contentSize = CGSizeMake(WIDTH*imageArr.count, WIDTH);
    scroll.pagingEnabled = YES;
    
    
    dispatch_group_t group = dispatch_group_create();
    int i = 0;
    // 有多张图片URL的数组
    NSArray *imageURLArr = imageArr;
    for (NSString *imageUrlStr in imageURLArr) {
        dispatch_group_enter(group);

        // 需要加载图片的控件(UIImageView, UIButton等)
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH*i, 0, WIDTH, WIDTH)];
        i++;
        [scroll addSubview:imageView];
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrlStr] placeholderImage:[UIImage imageNamed:@"icon_product_null"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            if (error) {
                // 加载失败
            } else {
                // 加载成功
                NSLog(@"success----%d",i);
            }
            dispatch_group_leave(group);
        }];

    }
    // 下载图片完成后, 回到主线
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        // 刷新UI
    });
    
    for (int i = 0; i < imageArr.count; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH*i, 0, WIDTH, WIDTH)];
        imageView.tag = 1000 + i;
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageArr[i]] placeholderImage:[UIImage imageNamed:@"icon_product_null"]];
      
        
        
        [scroll addSubview:imageView];
    }
    
//    [self.view addSubview:scroll];
    
 
    
    [[NetWorkManager sharedNetWorkManager] testSupmarketSuccess:^(id resultDic) {
        NSLog(@"-success---%@",resultDic);
    } failure:^(NSError *error) {
        NSLog(@"-error---%@",error);
    }];
    
    
}
//            for (int i=1; i<imgArr.count+1; i++) {
//                //当前图片视图
//                SPBanner *banner = imgArr[i-1];
//                UIImageView *currentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(winWidth * i, 0, winWidth, winWidth)];
//                NSString *imgUrl = @"";
//                if([banner.bannerImgUrl containsString:@"http"]){
//                    imgUrl = banner.bannerImgUrl;
//                }else{
//                    imgUrl = [NSString stringWithFormat:@"%@",banner.bannerImgUrl];
//                }
//                [currentImageView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"icon_no_product"]];
//                [self.bannerScrollView addSubview:currentImageView];
//                UIButton *clickBt = [[UIButton alloc] initWithFrame:CGRectMake(winWidth*i, 0, winWidth, winWidth)];
//                [_bannerScrollView addSubview:clickBt];
//                [clickBt addTarget:self action:@selector(lookBigPic) forControlEvents:(UIControlEventTouchUpInside)];
//            }


@end
