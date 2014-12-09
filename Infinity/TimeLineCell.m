//
//  TimeLineCell.m
//  Infinity
//
//  Created by 大澤卓也 on 2014/06/14.
//  Copyright (c) 2014年 ___FULLUSERNAME__. All rights reserved.
//

#import "TimeLineCell.h"

@implementation TimeLineCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _tweetTextLabel =[[UILabel alloc]initWithFrame:CGRectZero];
        _tweetTextLabel.font=[UIFont systemFontOfSize:14];
        _tweetTextLabel.textColor =[UIColor blackColor];
        _tweetTextLabel.numberOfLines =0;
        [self.contentView addSubview:_tweetTextLabel];
        
        _nameLabel =[[UILabel alloc]initWithFrame:CGRectZero];
        _nameLabel.font =[UIFont systemFontOfSize:12];
        _nameLabel.textColor =[UIColor blackColor];
        [self.contentView addSubview:_nameLabel];
        
        _profileImageView =[[UIImageView alloc]initWithFrame:CGRectZero];
        {[self.contentView addSubview:_profileImageView];
        }
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGRect r1 = [[UIScreen mainScreen] bounds];
    self.profileImageView.frame =CGRectMake(5 * (r1.size.width/320), 5 * (r1.size.height/568), 48 * (r1.size.width/320), 45 * (r1.size.height/568));
    self.tweetTextLabel.frame =CGRectMake(58 * (r1.size.width/320), 5 * (r1.size.height/568), 257 * (r1.size.width/320), self.tweetTextLabelHeight);
    self.nameLabel.frame=CGRectMake(58 * (r1.size.width/320),self.tweetTextLabelHeight+15 * (r1.size.height/568) , 257 * (r1.size.width/320), 15 * (r1.size.height/568));
}

@end
