//
//  MainViewController.m
//  MyTool
//
//  Created by Jarvan-zhang on 2018/8/14.
//  Copyright © 2018年 Jarvan-zhang. All rights reserved.
//

#import "MainViewController.h"

#import "NewsListViewController.h"
#import "ImageTextViewController.h"
#import "ArchiveViewController.h"
#import "LCNetworking.h"

#import "XibTestView.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UIButton    *button;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"Main";
    
//    _button = [UIButton buttonWithType:UIButtonTypeCustom];
//    _button.frame = CGRectMake(20, 20, 100, 50);
//    [_button setTitle:@"开始请求" forState:UIControlStateNormal];
//    _button.backgroundColor = [UIColor lightGrayColor];
//    [_button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_button];
//
//
//    UIButton *alertButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [alertButton setTitle:@"Alert" forState:UIControlStateNormal];
//    alertButton.backgroundColor = [UIColor lightGrayColor];
//    [alertButton addTarget:self action:@selector(alertClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:alertButton];
//
//    [alertButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self->_button.mas_bottom).offset(20);
//        make.left.width.height.mas_equalTo(self->_button);
//    }];
    self.dataArr = [NSMutableArray arrayWithObjects:@"开始请求",@"Alert",@"新闻",@"归档解档", nil];

   
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-DB_TopHeight) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 50;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
//    XibTestView *xview = [[XibTestView alloc] init];
//    xview.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:xview];
    
    
//    NSArray *arr = [NSArray arrayWithObjects:[UIImage imageNamed:@"icon_product_null"],[UIImage imageNamed:@"long.JPG"],[UIImage imageNamed:@"icon_product_null"], nil];
//
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
//    imageView.animationImages = arr;
//    imageView.animationDuration = 1;
//    [imageView startAnimating];
//    [self.view addSubview:imageView];
//    for (int i = 0; i < arr.count; i ++) {
//        UILabel *label = [[UILabel alloc] init];
//        label.text = arr[i];
//        label.textColor = [UIColor redColor];
//        [label sizeToFit];
//        [self.view addSubview:label];
//    }
//    [self initData];
    
    
//    int i = 10;
//    void (^MyBlock)(void) = ^(void){
//        
//        NSLog(@"-=--=--=-=-block i = %d",i);
//    };
//    
//
//    MyBlock();
}
- (void)initData {

//    NSString *URL = [NSString stringWithFormat:@"http://v.juhe.cn/toutiao/index?type=%@&key=%@",@"top",@"98897b74471a46f32c8aa588b89a27fb"];
//    //请求参数
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
////    params[@"word"] = @"背包";
////    params[@"version"] = @"2";
////    params[@"from"] = @"0";
//
//    [LCNetworking getWithURL:URL Params:params success:^(id responseObject) {
//        NSLog(@"GET_success____%@", responseObject);
//    } failure:^(NSString *error) {
//        NSLog(@"GET_failure____%@", error);
//    }];
   
        [[NetWorkManager sharedNetWorkManager] getJuHeNewsDataType:@"top" success:^(id resultDic) {
            NSLog(@"success:%@",resultDic);
            if ([resultDic[@"error_code"] integerValue] == 0) {
                NSArray *arr = resultDic[@"result"][@"data"];
                for (int i = 0; i < arr.count ; i ++) {
//                    NSDictionary *dic = arr[i];
//                    NewsModel *newsModel = [NewsModel entityWithDict:dic];
//                    [self.dataMuArr addObject:newsModel];
                }

//                [self.tableView reloadData];
            } else {
                NSLog(@"error%@",resultDic[@"reason"]);
            }
        } failure:^(NSError *error) {
            NSLog(@"error:%@",error);
        }];
    
    
//    [[NetWorkManager sharedNetWorkManager] getSupmarketListLng:@"" Lat:@"" province:@"" city:@"" district:@"" town:@"" success:^(id resultDic) {
//        NSLog(@"successs---%@",resultDic);
//    } failure:^(NSError *error) {
//        NSLog(@"error%@",error);
//    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = nil;
    static NSString *cellID = @"identifier";
    cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.dataArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self click];
    } else if (indexPath.row == 1){
        [self alertClick];
    } else if (indexPath.row == 2) {
        NewsListViewController *vc = [[NewsListViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 3) {
        ArchiveViewController *vc = [[ArchiveViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

    
//row == 0
- (void)click {
    
    ImageTextViewController *vc = [[ImageTextViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
//    [[NetWorkManager sharedNetWorkManager] getTestDataSuccess:^(id resultDic) {
//
////        [self->_button setTitle:@"success" forState:UIControlStateNormal];
//        [Tools LogNetData:resultDic];
//    } failure:^(NSError *error) {
////        [self->_button setTitle:@"error" forState:UIControlStateNormal];
//        NSLog(@"------error%@",error);
//    }];
}
//row == 1
- (void)alertClick{
    /*
     先创建UIAlertController，preferredStyle：选择UIAlertControllerStyleActionSheet，这个就是相当于创建8.0版本之前的UIActionSheet；
     
     typedef NS_ENUM(NSInteger, UIAlertControllerStyle) {
     UIAlertControllerStyleActionSheet = 0,
     UIAlertControllerStyleAlert
     } NS_ENUM_AVAILABLE_IOS(8_0);
     
     */
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"标题" message:@"注释信息,没有就写nil" preferredStyle:UIAlertControllerStyleActionSheet];
    
    /*
     typedef NS_ENUM(NSInteger, UIAlertActionStyle) {
     UIAlertActionStyleDefault = 0,
     UIAlertActionStyleCancel,         取消按钮
     UIAlertActionStyleDestructive     破坏性按钮，比如：“删除”，字体颜色是红色的
     } NS_ENUM_AVAILABLE_IOS(8_0);
     
     */
    // 创建action，这里action1只是方便编写，以后再编程的过程中还是以命名规范为主
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"标题1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了按钮1，进入按钮1的事件");
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了取消");
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        //跳到创建alertview的方法，一般在点击删除这里按钮之后，都需要一个提示框，提醒用户是否真的删除
        [self creatAlertController_alert];
    }];
    
    //把action添加到actionSheet里
    [actionSheet addAction:action1];
    [actionSheet addAction:action2];
    [actionSheet addAction:action3];
    
    //相当于之前的[actionSheet show];
    [self presentViewController:actionSheet animated:YES completion:nil];
   
}

- (void)creatAlertController_alert {
    //跟上面的流程差不多，记得要把preferredStyle换成UIAlertControllerStyleAlert
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"标题" message:@"注释信息,没有就写nil" preferredStyle:UIAlertControllerStyleAlert];
    
    //可以给alertview中添加一个输入框
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"alert中的文本";
    }];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"标题1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了按钮1，进入按钮1的事件");
        //textFields是一个数组，获取所输入的字符串
        NSLog(@"%@",alert.textFields.lastObject.text);
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了取消");
    }];
    
    [alert addAction:action1];
    [alert addAction:action2];
    
    [self presentViewController:alert animated:YES completion:nil];
   
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
