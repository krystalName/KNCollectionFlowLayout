//
//  KNCollectionViewCell.m
//  KNCollectionFlowLayout
//
//  Created by 刘凡 on 2018/1/5.
//  Copyright © 2018年 leesang. All rights reserved.
//

#import "KNCollectionViewCell.h"
#import <Masonry.h>

@implementation KNCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        //根据当前CELL所在屏幕的不同位置，初始化IMAGEVIEW的相对位置，为了配合滚动时的IMAGEVIEW偏移动画
        //(screen_y-attributes.frame.origin.y)/568*80
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, IMAGEVIEW_ORIGIN_Y-self.frame.origin.y/SCREEN_HEIGHT*IMAGEVIEW_MOVE_DISTANCE, SCREEN_WIDTH, CELL_CURRHEIGHT)];
        [self.contentView addSubview:self.imageView];
        
        self.maskView = [[UIView alloc] init];
        self.maskView.backgroundColor = [UIColor blackColor];
        self.maskView.alpha = 0.6;
        [self.contentView addSubview:self.maskView];
        [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.imageView);
        }];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textColor = [UIColor redColor];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.titleLabel];
        self.contentMode = UIViewContentModeCenter;
        self.titleLabel.layer.transform = CATransform3DMakeScale(0.8, 0.8, 1);
        self.titleLabel.center = self.contentView.center;
        [self.titleLabel setBackgroundColor:[UIColor clearColor]];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-25);
        }];
        
        self.descLabel = [[UILabel alloc] init];
        self.descLabel.textColor = [UIColor blueColor];
        self.descLabel.font = [UIFont systemFontOfSize:14];
        self.descLabel.alpha = 0;
        self.descLabel.textAlignment = NSTextAlignmentCenter;
        self.descLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.descLabel];
        
        [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.titleLabel);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        }];
        
        self.bottomLabel = [[UILabel alloc] init];
        self.bottomLabel.textColor = [UIColor blueColor];
        self.bottomLabel.font = [UIFont systemFontOfSize:14];
        self.bottomLabel.alpha = 0;
        self.bottomLabel.textAlignment = NSTextAlignmentCenter;
        self.bottomLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.bottomLabel];
        
        [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.titleLabel);
            make.top.equalTo(self.descLabel.mas_bottom).offset(15);
        }];
        
    }
    return self;
}



#pragma mark - Outside Methods

-(void)revisePositionAtFirstCell {
    if(self.tag == 1){
        self.titleLabel.layer.transform = CATransform3DMakeScale(1, 1, 1);
        self.descLabel.alpha = 1;
        self.bottomLabel.alpha = 1;
        
        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-88);
        }];
    }
}

-(void)setIndex:(NSUInteger)index {
    if (index == 0) {
        
        self.maskView.alpha = 0;
        self.backgroundColor = [UIColor lightGrayColor];
        
    }else if(index == 1){
        
        self.maskView.alpha = 0.2;
        self.backgroundColor = [UIColor blackColor];
        
    }else{
        
        self.maskView.alpha = 0.6;
        self.backgroundColor = [UIColor blackColor];
        
    }
}


@end
