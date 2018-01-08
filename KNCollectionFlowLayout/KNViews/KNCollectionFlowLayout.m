//
//  KNCollectionFlowLayout.m
//  KNCollectionFlowLayout
//
//  Created by 刘凡 on 2018/1/5.
//  Copyright © 2018年 leesang. All rights reserved.
//

#import "KNCollectionFlowLayout.h"
#import "KNCollectionViewCell.h"


@interface KNCollectionFlowLayout()

@property(nonatomic, assign) NSInteger count;

@end


@implementation KNCollectionFlowLayout


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.itemSize = CGSizeMake(SCREEN_WIDTH, <#CGFloat height#>)
    }
    return self;
}


@end
