//
//  TimeLineCell.h
//  Infinity
//
//  Created by 大澤卓也 on 2014/06/14.
//  Copyright (c) 2014年 ___FULLUSERNAME__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeLineCell : UITableViewCell
@property (nonatomic,strong)UILabel *tweetTextLabel;
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UIImageView *profileImageView;
@property (nonatomic) float tweetTextLabelHeight;

@end
