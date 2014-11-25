//
//  TimeLineTableViewController.h
//  Infinity
//
//  Created by 大澤卓也 on 2014/06/14.
//  Copyright (c) 2014年 ___FULLUSERNAME__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import "TimeLineCell.h"
#import "DetailViewController.h"

@interface TimeLineTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>


@property (nonatomic,copy) NSString *identifier;

@end
