//
//  DYY_CollectionView.h
//  CardViewStyle
//
//  Created by yrft on 2018/4/25.
//  Copyright © 2018年 dyy. All rights reserved.
//

#import <UIKit/UIKit.h>

//选择哪个item的block回调
typedef void(^DYY_SelectedItems)(NSIndexPath *indexpath);

@interface DYY_CollectionView : UIView

@property (nonatomic,strong) DYY_SelectedItems dyy_selectedItems;
@property (nonatomic,strong) NSMutableArray *dataARR;;

- (instancetype)initCollectionViewWithFrame:(CGRect)frame;

@end
