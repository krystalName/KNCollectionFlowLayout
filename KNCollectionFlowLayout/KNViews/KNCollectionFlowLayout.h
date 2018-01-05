//
//  KNCollectionFlowLayout.h
//  KNCollectionFlowLayout
//
//  Created by 刘凡 on 2018/1/5.
//  Copyright © 2018年 leesang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KNCollectionFlowLayout : UICollectionViewLayout

///当前滑动的位置
@property (nonatomic, assign) CGFloat currentCount;

///设置ContnetSize
-(void)setcontentSize:(NSInteger)count;

@end
