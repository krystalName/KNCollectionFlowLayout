//
//  ViewController.m
//  KNCollectionFlowLayout
//
//  Created by 刘凡 on 2018/1/4.
//  Copyright © 2018年 leesang. All rights reserved.
//

#import "ViewController.h"
#import "KNCollectionViewCell.h"
#import "KNCollectionFlowLayout.h"


@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) NSMutableArray *dataSourcesArray;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) KNCollectionFlowLayout *layout;
@property (nonatomic, assign) NSInteger movieNumber;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ///添加试图
    [self.view addSubview:self.collectionView];
    
    
    [self confidDataSource];

}


-(void)confidDataSource{
    
    self.dataSourcesArray = [NSMutableArray arrayWithCapacity:10];
    
    for (NSInteger i = 0 ; i< 10; i++) {
        [self.dataSourcesArray addObject:@"占位用"];
    }
    
    [self.layout setcontentSize:self.dataSourcesArray.count];
    [self.collectionView reloadData];
}

#pragma mark -  处理代理

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}



// 每个section中得items个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSourcesArray.count +1 ;
}

// cell
- (KNCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = NSStringFromClass([KNCollectionViewCell class]);
    KNCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.tag = indexPath.row;
    [cell setIndex:(indexPath.row)];
    
    if(indexPath.row == 0){
        cell.imageView.image = nil;
    }else{
        if(indexPath.row == 1){
            [cell revisePositionAtFirstCell];
        }
        cell.titleLabel.text = @"好看的海报";
        cell.descLabel.text = @"爱情 | 亲情";
        cell.bottomLabel.text = @"好看的外表千篇一律";
        if (indexPath.row % 2 == 0) {
            cell.imageView.image = [UIImage imageNamed:@"117"];
        }else if(indexPath.row % 3 == 0){
            cell.imageView.image = [UIImage imageNamed:@"115"];
        }else{
            cell.imageView.image = [UIImage imageNamed:@"116"];
        }
    }
    return cell;
}


// 每个item的frame.size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0){
        return CGSizeMake(MIN(SCREEN_HEIGHT, SCREEN_WIDTH), HEADER_HEIGHT);
    }else if(indexPath.row == 1){
        return CGSizeMake(MIN(SCREEN_HEIGHT, SCREEN_WIDTH), CELL_CURRHEIGHT);
    }else{
        return CGSizeMake(MIN(SCREEN_HEIGHT, SCREEN_WIDTH), CELL_HEIGHT);
    }
}

// 点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat offset = ceil(DRAG_INTERVAL * (indexPath.row-1));
    if (ceil(collectionView.contentOffset.y) != offset) {
        // 滑动动最顶部
        self.layout.currentCount = indexPath.row;
        [collectionView setContentOffset:CGPointMake(0, offset) animated:YES];
    } else {
        // 点击事件
        NSLog(@"点击了第N%@个",@(indexPath.row));
    }
}


- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    self.layout.currentCount = 1;
}



#pragma mark - Init Views

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        // layout
        KNCollectionFlowLayout *layout = [[KNCollectionFlowLayout alloc] init];
        self.layout = layout;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
        NSString *string = NSStringFromClass([KNCollectionViewCell class]);
        [_collectionView registerClass:[KNCollectionViewCell class] forCellWithReuseIdentifier:string];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.bounces = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        if (@available(iOS 11.0, *)) {
            _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _collectionView;
}



@end
