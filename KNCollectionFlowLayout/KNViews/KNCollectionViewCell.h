//
//  KNCollectionViewCell.h
//  KNCollectionFlowLayout
//
//  Created by 刘凡 on 2018/1/5.
//  Copyright © 2018年 leesang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>

///屏幕的宽高
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

//Cell的高度
#define CELL_HEIGHT (SCREEN_WIDTH*0.24) //普通高度
///置顶高度
#define CELL_CURRHEIGHT ((SCREEN_WIDTH>SCREEN_HEIGHT?SCREEN_HEIGHT:SCREEN_WIDTH)*1.2) //置顶高度

#define IMAGEVIEW_ORIGIN_Y 0
#define IMAGEVIEW_MOVE_DISTANCE 215

#define DRAG_INTERVAL CELL_CURRHEIGHT

#define HEADER_HEIGHT 0
#define RECT_RANGE 1000.0f

@interface KNCollectionViewCell : UICollectionViewCell



@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) UIView *maskView;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *descLabel;
@property(nonatomic, strong) UILabel *bottomLabel;

-(void)revisePositionAtFirstCell;
-(void)setIndex:(NSUInteger)index;

@end
