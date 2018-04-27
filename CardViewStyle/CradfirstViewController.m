//
//  CradfirstViewController.m
//  CardViewStyle
//
//  Created by yrft on 2018/4/23.
//  Copyright © 2018年 dyy. All rights reserved.
//

#import "CradfirstViewController.h"
#import "DYY_CollectionView.h"
#import "DYY_FlowLayoutConstants.h"

@interface CradfirstViewController ()

@end

@implementation CradfirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;

    DYY_CollectionView *dyy_coll = [[DYY_CollectionView alloc]initCollectionViewWithFrame:CGRectMake(0, 66, [UIScreen mainScreen].bounds.size.width, (SCREEN_WIDTH - LEFT_OFFSET*2)/0.618f+20)];
    
    dyy_coll.dyy_selectedItems = ^(NSIndexPath *indexpath) {
        
    };
    [self.view addSubview:dyy_coll];
    dyy_coll.dataARR = [NSMutableArray arrayWithObjects:@"1.jpg",@"2.jpg",@"3.jpeg",@"4.jpg",@"5.jpg",@"6.jpeg",nil];

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
