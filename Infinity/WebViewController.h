//
//  WebViewController.h
//  Infinity
//
//  Created by 大澤卓也 on 2014/06/21.
//  Copyright (c) 2014年 ___FULLUSERNAME__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>
@property (nonatomic,strong)NSURL *openURL;
@end
