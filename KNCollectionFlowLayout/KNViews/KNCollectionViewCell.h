//
//  KNCollectionViewCell.h
//  KNCollectionFlowLayout
//
//  Created by 刘凡 on 2018/1/5.
//  Copyright © 2018年 leesang. All rights reserved.
//

#import <UIKit/UIKit.h>

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

@end
