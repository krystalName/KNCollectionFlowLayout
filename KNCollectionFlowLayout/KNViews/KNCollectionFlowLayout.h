//
//  KNCollectionFlowLayout.h
//  KNCollectionFlowLayout
//
//  Created by 刘凡 on 2018/1/5.
//  Copyright © 2018年 leesang. All rights reserved.
//

#import <UIKit/UIKit.h>

///屏幕的宽高
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)



// iPhone X宏定义
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)]?CGSizeEqualToSize(CGSizeMake(1125, 2436),[[UIScreen mainScreen]currentMode].size):NO)


@interface KNCollectionFlowLayout : UICollectionViewFlowLayout

///当前滑动的位置
@property (nonatomic, assign) CGFloat currentCount;

///设置ContnetSize
-(void)setcontentSize:(NSInteger)count;

@end
