//
//  main.m
//  Infinity
//
//  Created by 大澤卓也 on 2014/06/14.
//  Copyright (c) 2014年 ___FULLUSERNAME__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "MyUIApplication.h"
int main(int argc, char * argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc,
                                 argv,
                                 NSStringFromClass([MyUIApplication class]),
                                 NSStringFromClass([AppDelegate class]));
    }
}
