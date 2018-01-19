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
