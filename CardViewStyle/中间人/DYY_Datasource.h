//
//  DYY_Datasource.h
//  CardViewStyle
//
//  Created by yrft on 2018/4/23.
//  Copyright © 2018年 dyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^DYYCellSelectedBlock)(NSIndexPath *obj);

@interface DYY_Datasource : NSObject <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy) NSArray *cellIdentifiers;                // cell样式选择
@property (nonatomic, copy) NSArray *serverData;                     // cell数据
@property (nonatomic, copy) DYYCellSelectedBlock cellSelectedBlock;   // cell点击事件


/**
 <#Description#>

 @param serverData 数据
 @param identifiers 类型
 @return datasource
 */
- (id)initWithServerData:(NSArray *)serverData
      andCellIdentifiers:(NSArray *)identifiers;


@end
