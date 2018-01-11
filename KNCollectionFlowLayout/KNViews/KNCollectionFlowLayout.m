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
        self.itemSize = CGSizeMake(SCREEN_WIDTH, CELL_HEIGHT);
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.minimumInteritemSpacing = 0;
        self.minimumLineSpacing = 0;
        ///设置当前页数等于1
        self.currentCount = 1;
    }
    return self;
}

#pragma mark - 设置方法
-(void)setcontentSize:(NSInteger)count{
    self.count = count;
}

///判定为布局需要被无效化并重新计算的时候,布局对象会被询问以提供新的布局。
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

///插入动画
-(UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    
    return attributes;
}

-(CGSize)collectionViewContentSize{
    
    
    return CGSizeMake(SCREEN_WIDTH, HEADER_HEIGHT + DRAG_INTERVAL * self.count + (SCREEN_HEIGHT - DRAG_INTERVAL ));
}

-(void)prepareLayout{
    [super prepareLayout];
}

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    float screen_y = self.collectionView.contentOffset.y;
    float current_floor = floorf((screen_y-HEADER_HEIGHT)/DRAG_INTERVAL)+1;
    float current_mod = fmodf((screen_y-HEADER_HEIGHT), DRAG_INTERVAL);
    float percent = current_mod/DRAG_INTERVAL;
    
    //计算当前应该显示在屏幕上的CELL在默认状态下应该处于的RECT范围，范围左右范围进行扩展，避免出现BUG
    //之前的方法采用所有ITEM进行布局计算，当ITEM太多后，会严重影响性能体验，所有采用这种方法
    CGRect correctRect;
    if(current_floor == 0 || current_floor == 1){ //因为导航栏和当前CELL的高度特殊，所有做特殊处理
        correctRect = CGRectMake(0, 0, SCREEN_WIDTH, RECT_RANGE);
    }else{
        correctRect = CGRectMake(0, HEADER_HEIGHT+HEADER_HEIGHT+CELL_HEIGHT*(current_floor-2), SCREEN_WIDTH, RECT_RANGE);
    }
    NSArray * original = [super layoutAttributesForElementsInRect:correctRect];
    NSArray* array = [[NSArray alloc] initWithArray:original copyItems:YES];
    
    CGFloat riseOfCurrentItem = CELL_CURRHEIGHT-DRAG_INTERVAL; //当前ITEM Y坐标提高的量
    CGFloat incrementalHeightOfCurrentItem = CELL_CURRHEIGHT-CELL_HEIGHT; //当前ITEM增加的高度
    CGFloat offsetOfNextItem = incrementalHeightOfCurrentItem - riseOfCurrentItem; //当前ITEM以下的ITEM需要向下移动的位移
    
    if(screen_y >= HEADER_HEIGHT){
        for(UICollectionViewLayoutAttributes *attributes in array){
            NSInteger row = attributes.indexPath.row;
            if(row < current_floor){
                attributes.zIndex = 7;
                attributes.frame = CGRectMake(0, (HEADER_HEIGHT-DRAG_INTERVAL)+DRAG_INTERVAL*row, SCREEN_WIDTH, CELL_CURRHEIGHT);
//                [self setEffectViewAlpha:1 forIndexPath:attributes.indexPath];
            }else if(row == current_floor){
                attributes.zIndex = 8;
                attributes.frame = CGRectMake(0, (HEADER_HEIGHT-DRAG_INTERVAL)+DRAG_INTERVAL*row, SCREEN_WIDTH, CELL_CURRHEIGHT);
//                [self setEffectViewAlpha:1 forIndexPath:attributes.indexPath];
            }else if(row == current_floor+1){
                attributes.zIndex = 9;
                attributes.frame = CGRectMake(0, attributes.frame.origin.y+(current_floor-1)*offsetOfNextItem-riseOfCurrentItem*percent, SCREEN_WIDTH, CELL_HEIGHT+(CELL_CURRHEIGHT-CELL_HEIGHT)*percent);
//                [self setEffectViewAlpha:percent forIndexPath:attributes.indexPath];
            }else{
                if (row == current_floor+2) {
                    attributes.zIndex = 6;
                } else if (row == current_floor+3) {
                    attributes.zIndex = 5;
                } else if (row == current_floor+4) {
                    attributes.zIndex = 4;
                } else if (row == current_floor+5) {
                    attributes.zIndex = 3;
                } else if (row == current_floor+6) {
                    attributes.zIndex = 2;
                } else if (row == current_floor+7) {
                    attributes.zIndex = 1;
                } else {
                    attributes.zIndex = 0;
                }
                
                attributes.frame = CGRectMake(0, attributes.frame.origin.y+(current_floor-1)*offsetOfNextItem+offsetOfNextItem*percent, SCREEN_WIDTH, CELL_HEIGHT);
//                [self setEffectViewAlpha:0 forIndexPath:attributes.indexPath];
            }
            
//            [self setImageViewOfItem:(screen_y-attributes.frame.origin.y)/SCREEN_HEIGHT*IMAGEVIEW_MOVE_DISTANCE withIndexPath:attributes.indexPath];
            
        }
        
    }else{
        
        for(UICollectionViewLayoutAttributes *attributes in array){
            
            if(attributes.indexPath.row > 1){
//                [self setEffectViewAlpha:0 forIndexPath:attributes.indexPath];
            }
//            [self setImageViewOfItem:(screen_y-attributes.frame.origin.y)/screen_height*IMAGEVIEW_MOVE_DISTANCE withIndexPath:attributes.indexPath];
            
        }
    }
    
    return array;
}


@end
