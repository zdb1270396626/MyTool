//
//  MainViewController.m
//  MyTool
//
//  Created by Jarvan-zhang on 2018/8/14.
//  Copyright © 2018年 Jarvan-zhang. All rights reserved.
//

#import "MainViewController.h"
#import "NetWorkManager.h"

@interface MainViewController ()

@property (nonatomic,strong)UIButton    *button;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"Main";
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(100, 100, 100, 100);
    _button.backgroundColor = [UIColor redColor];
    [_button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
}
- (void)click:(UIButton *)button {
    
    [[NetWorkManager sharedNetWorkManager] getTestDataSuccess:^(id resultDic) {
     
//        NSLog(@"------%@",resultDic);
        self->_button.backgroundColor = [UIColor blueColor];
    } failure:^(NSError *error) {
        NSLog(@"------error%@",error);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
