//
//  DYY_Datasource.m
//  CardViewStyle
//
//  Created by yrft on 2018/4/23.
//  Copyright © 2018年 dyy. All rights reserved.
//

#import "DYY_Datasource.h"

@implementation DYY_Datasource

- (id)initWithServerData:(NSArray *)serverData andCellIdentifiers:(NSArray *)identifiers
{
    self = [super init];
    if (self) {
        self.serverData = serverData; //数据
        self.cellIdentifiers = identifiers;//cell标识
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.serverData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifer = self.cellIdentifiers[0];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    cell.textLabel.text = self.serverData[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.cellSelectedBlock(indexPath);
}
@end
