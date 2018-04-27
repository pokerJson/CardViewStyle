//
//  MainViewController.m
//  CardViewStyle
//
//  Created by yrft on 2018/4/23.
//  Copyright © 2018年 dyy. All rights reserved.
//

#import "MainViewController.h"
#import "DYY_Datasource.h"
#import "CradfirstViewController.h"

#define kNavBarHeight (([UIScreen mainScreen].bounds.size.height == 812.) ? 88. : 64.)//
#define KKScreen_Width [UIScreen mainScreen].bounds.size.width
#define KKScreen_Height [UIScreen mainScreen].bounds.size.height

@interface MainViewController ()

@property (strong, nonatomic) UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *serverData;       // 服务器返回的数据
@property (nonatomic, strong) NSMutableArray *cellIdentifiers;  // cell样式标示
@property (nonatomic, strong) DYY_Datasource *datasource;          // 中间人

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.serverData = [NSMutableArray arrayWithObjects:@"xxx",@"xxxxx",@"eeee",nil];
    self.cellIdentifiers = [[NSMutableArray alloc]init];
    [self.cellIdentifiers addObject:NSStringFromClass([UITableViewCell class])];//自定义的cell也行 多种cell一次对应添加
   
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavBarHeight, KKScreen_Width, KKScreen_Height-kNavBarHeight) style:UITableViewStylePlain];
    [self.view addSubview:self.tableview];
    if (@available(iOS 11.0, *)) {
        _tableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:self.cellIdentifiers[0]];
    
    //初始化中间人
    self.datasource = [[DYY_Datasource alloc]initWithServerData:self.serverData andCellIdentifiers:self.cellIdentifiers];
    __weak __typeof(self) weakSelf = self;
    self.datasource.cellSelectedBlock = ^(NSIndexPath *obj) {//cell的点击事件
        [weakSelf cellSelectedWithObj:obj];
        
    };

    self.tableview.delegate = self.datasource;
    self.tableview.dataSource = self.datasource;
    
}
- (void)cellSelectedWithObj:(NSIndexPath *)obj
{
    NSLog(@"obj=%d",obj.row);
    CradfirstViewController *card = [[CradfirstViewController alloc]init];
    [self.navigationController pushViewController:card animated:YES];
    
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
