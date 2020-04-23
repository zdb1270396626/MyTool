//
//  ArchiveViewController.m
//  MyTool
//
//  Created by Jarvan-zhang on 2019/9/2.
//  Copyright © 2019年 Jarvan-zhang. All rights reserved.
//

#import "ArchiveViewController.h"
#import "PersonTest.h"


@interface ArchiveViewController ()

@end

@implementation ArchiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.title = @"归档解档";
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"路径--%@",NSTemporaryDirectory());
    
    UIButton *saveBut = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBut.frame = CGRectMake(20, 20, 100, 50);
    [saveBut setTitle:@"存" forState:UIControlStateNormal];
    saveBut.backgroundColor = [UIColor lightGrayColor];
    [saveBut addTarget:self action:@selector(save:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveBut];
    
    UIButton *getBut = [UIButton buttonWithType:UIButtonTypeCustom];
    getBut.frame = CGRectMake(20, 120, 100, 50);
    [getBut setTitle:@"取" forState:UIControlStateNormal];
    getBut.backgroundColor = [UIColor lightGrayColor];
    [getBut addTarget:self action:@selector(get:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:getBut];
}
//存
- (void)save:(UIButton *)button {
    //创建一个对象
    PersonTest *p = [[PersonTest alloc] init];
    p.name = @"test--";
    p.age = 1111;
    //沙盒
    NSString *temp = NSTemporaryDirectory();
    NSString *filePath = [temp stringByAppendingPathComponent:@"p.test"];
    //归档
    [NSKeyedArchiver archiveRootObject:p toFile:filePath];
}
//取
- (void)get:(UIButton *)button {
    //路径
    NSString *temp = NSTemporaryDirectory();
    NSString *filePath = [temp stringByAppendingPathComponent:@"p.test"];
    //解档
    PersonTest *p = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"解档的数据名字%@,年龄%d",p.name,p.age);
}
@end
