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
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
