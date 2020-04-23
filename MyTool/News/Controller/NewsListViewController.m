//
//  NewsListViewController.m
//  MyTool
//
//  Created by Jarvan-zhang on 2019/5/13.
//  Copyright © 2019年 Jarvan-zhang. All rights reserved.
//

#import "NewsListViewController.h"
#import "NewsModel.h"
#import "NewsListTableViewCell.h"
#import "NewDetailViewController.h"

@interface NewsListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataMuArr;

@end

@implementation NewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新闻";
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataMuArr = [NSMutableArray array];
    
    [self loadData];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-DB_TopHeight) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 160;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}
- (void)loadData {
    [[NetWorkManager sharedNetWorkManager] getJuHeNewsDataType:@"top" success:^(id resultDic) {
        NSLog(@"success:%@",resultDic);
        if ([resultDic[@"error_code"] integerValue] == 0) {
            NSArray *arr = resultDic[@"result"][@"data"];
            for (int i = 0; i < arr.count ; i ++) {
                NSDictionary *dic = arr[i];
                NewsModel *newsModel = [NewsModel entityWithDict:dic];
                [self.dataMuArr addObject:newsModel];
            }
            
            [self.tableView reloadData];
        } else {
            NSLog(@"error%@",resultDic[@"reason"]);
        }
    } failure:^(NSError *error) {
        NSLog(@"error:%@",error);
    }];
   
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataMuArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsListTableViewCell *cell = nil;
    static NSString *cellID = @"identifier";
    cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[NewsListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NewsModel *model = self.dataMuArr[indexPath.row];
    cell.newsModel = model;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsModel *model = self.dataMuArr[indexPath.row];
    NewDetailViewController *vc = [[NewDetailViewController alloc] init];
    vc.urlStr = model.url;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
