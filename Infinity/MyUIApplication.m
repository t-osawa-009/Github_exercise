//
//  MyUIApplication.m
//  Infinity
//
//  Created by 大澤卓也 on 2014/06/21.
//  Copyright (c) 2014年 ___FULLUSERNAME__. All rights reserved.
//

#import "MyUIApplication.h"

@implementation MyUIApplication



- (BOOL)openURL:(NSURL *)url
{
    if (!url) {
        return NO;
    }
    self.myOpenURL=url;
    AppDelegate *appDelegate=[[UIApplication sharedApplication]delegate];
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    WebViewController *WebViewController=
    [storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    WebViewController.openURL=self.myOpenURL;
    WebViewController.title=@"web View";
    [appDelegate.navigationController pushViewController:WebViewController animated:YES];
    self.myOpenURL=nil;
    return YES;
}
@end