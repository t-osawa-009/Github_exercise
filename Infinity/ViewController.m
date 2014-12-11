//
//  ViewController.m
//  Infinity
//
//  Created by 大澤卓也 on 2014/06/14.
//  Copyright (c) 2014年 ___FULLUSERNAME__. All rights reserved.
//

#import "ViewController.h"
#import "VENSnowOverlayView.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *accountDisplayLabel;

@property(nonatomic,strong)ACAccountStore *accountStore;
@property(nonatomic,copy)NSArray *twitterAccounts;
@property(nonatomic,copy)NSString *identifier;
@property(nonatomic,copy)VENSnowOverlayView *snowOver;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.accountStore =[[ACAccountStore alloc]init];
    ACAccountType *twitterType =
    [self.accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    [self.accountStore requestAccessToAccountsWithType:twitterType
                                               options:NULL
                                            completion:^(BOOL granted,NSError *error){
                                                if (granted) {
                                                    self.twitterAccounts=[self.accountStore accountsWithAccountType:twitterType];
                                                    if (self.twitterAccounts.count>0) {
                                                        ACAccount *account =self.twitterAccounts[0];
                                                        self.identifier=account.identifier;
                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                            self.accountDisplayLabel.text =account.username;
                                                        });
                                                    }else{
                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                            self.accountDisplayLabel.text =@"アカウントなし";
                                                        });
                                                    }
                                                }else{
                                                    NSLog(@"Account Error:%@",[error localizedDescription]);
                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                        self.accountDisplayLabel.text =@"アカウント認証エラー";
                                                    });
                                                }
                                                
                                            }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    dispatch_async(dispatch_get_main_queue(), ^{
        _snowOver = [[VENSnowOverlayView alloc] initWithFrame:self.view.frame];
        _snowOver.flakesCount = 100;
        [self.view addSubview:_snowOver];
        [_snowOver beginSnowAnimation];
    });

}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];

    [_snowOver removeFromSuperview];
    
}
- (IBAction)setAccountAction:(id)sender {
    UIActionSheet *sheet=[[UIActionSheet alloc]init];
    sheet.delegate =self;
    
    sheet.title =@"選択してください。";
    for (ACAccount *account in self.twitterAccounts ) {
        [sheet addButtonWithTitle:account.username];
    }
    [sheet addButtonWithTitle:@"キャンセル"];
    sheet.cancelButtonIndex =self.twitterAccounts.count;
    [sheet showInView:self.view];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.twitterAccounts.count>0) {
        if (buttonIndex !=self.twitterAccounts.count) {
            ACAccount *account =self.twitterAccounts[buttonIndex];
            self.identifier =account.identifier;
            self.accountDisplayLabel.text =account.username;
            NSLog(@"Account set! %@",account.username);
        }else{
            NSLog(@"cancel!");
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"timeLineSegue"]) {
        TimeLineTableViewController *timeLineVC =segue.destinationViewController;
        if ([timeLineVC isKindOfClass:[TimeLineTableViewController class]]) {
            timeLineVC.identifier =self.identifier;
        }
    }
}
@end