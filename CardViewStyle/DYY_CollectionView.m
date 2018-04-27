//
//  DYY_CollectionView.m
//  CardViewStyle
//
//  Created by yrft on 2018/4/25.
//  Copyright © 2018年 dyy. All rights reserved.
//

#import "DYY_CollectionView.h"
#import "DYY_FlowLayout.h"

@interface DYY_CollectionView()<UICollectionViewDelegate,UICollectionViewDataSource>{
    CGFloat _dragStartX;
    CGFloat _dragEndX;
    NSInteger _currentIndex;

}
@property (nonatomic,strong)UIImageView *bgImageView;
@property (nonatomic,strong)UICollectionView *collectView;

@end

@implementation DYY_CollectionView

- (instancetype)initCollectionViewWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self creatCollectionViewWithFrame:frame];
    }
    return self;
}
- (void)setDataARR:(NSMutableArray *)dataARR
{
    _dataARR = dataARR;
    self.collectView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:self.dataARR[0]]];
    [self.collectView reloadData];
}
- (void)creatCollectionViewWithFrame:(CGRect)frame
{
    self.bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    self.bgImageView.userInteractionEnabled = YES;
    //毛玻璃效果
    UIBlurEffect* effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView* effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = self.collectView.bounds;
    effectView.alpha = 0.5;
    [self.bgImageView addSubview:effectView];

    
    DYY_FlowLayout *flowlayout = [[DYY_FlowLayout alloc]init];
    self.collectView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:flowlayout];
    self.collectView.delegate = self;
    self.collectView.dataSource = self;
    self.collectView.backgroundView = self.bgImageView;
    self.collectView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.collectView];
    
    
    //注册cell
    [self.collectView registerClass:[UICollectionViewCell class]
                forCellWithReuseIdentifier:@"collecitonView_cell"];

}
- (NSInteger )collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataARR.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collecitonView_cell"
                                                                               forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:_dataARR[indexPath.row]]];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 5.0f;
    
    
    NSLog(@"Cell:%f--%f",cell.frame.size.width,cell.frame.size.height);
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.dyy_selectedItems(indexPath);
}
#pragma mark - UIScrollView, 滚动时修正cell居中
//手指拖动开始
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    _dragStartX = scrollView.contentOffset.x;
}

//手指拖动停止
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    _dragEndX = scrollView.contentOffset.x;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self fixCellToCenter];
    });
}

//配置cell居中
-(void)fixCellToCenter
{
    //最小滚动距离 可以根据大小到底且不切换
    float dragMiniDistance = self.collectView.bounds.size.width/3;
    if (_dragStartX -  _dragEndX >= dragMiniDistance) {
        _currentIndex -= 1;//向右
    }else if(_dragEndX -  _dragStartX >= dragMiniDistance){
        _currentIndex += 1;//向左
    }
    NSInteger maxIndex = [self.collectView numberOfItemsInSection:0] - 1;
    _currentIndex = _currentIndex <= 0 ? 0 : _currentIndex;
    _currentIndex = _currentIndex >= maxIndex ? maxIndex : _currentIndex;
    
    //改变背景
    self.collectView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:self.dataARR[_currentIndex]]];
    
    [self.collectView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:_currentIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
}

@end
