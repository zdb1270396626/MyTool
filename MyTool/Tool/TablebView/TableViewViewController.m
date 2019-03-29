//
//  TableViewViewController.m
//  MyTool
//
//  Created by hjf1234 on 2019/3/28.
//  Copyright © 2019 Jarvan-zhang. All rights reserved.
//

#import "TableViewViewController.h"
#import "ToolTableViewCell.h"

@interface TableViewViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation TableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-DB_TopHeight-DB_TabBarHeight) style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    if (IOS_VERSION_11_OR_ABOVE) {
        tableView.estimatedRowHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
    }
    [self.view addSubview:tableView];
    self.tableView = tableView;
}
- (void)headerRereshing
{
   
}

- (void)footerRereshing
{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ToolTableViewCell *cell = nil;
    static NSString *cellID = @"cell.Identifier";
    cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[ToolTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.str = @"";
    WeakSelf;
    cell.buttonClick = ^(NSIndexPath *path) {
        [weakSelf doSomeThing:path];
    };
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)doSomeThing:(NSIndexPath *)path {
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
