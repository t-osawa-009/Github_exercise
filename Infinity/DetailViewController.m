                            //
//  DetailViewController.m
//  Infinity
//
//  Created by 大澤卓也 on 2014/06/21.
//  Copyright (c) 2014年 ___FULLUSERNAME__. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *profilView;
@property (weak, nonatomic) IBOutlet UITextView *timeLineView;


@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Detail View";
    self.imageView.image=self.image;
    self.profilView.text = self.name;
    self.timeLineView.text = self.text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
- (IBAction)retwwetView:(id)sender {
    ACAccountStore *accountStore=[[ACAccountStore alloc]init];
    ACAccount *account=[accountStore accountWithIdentifier:_identifier];
    
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"https://api.twitter.com"
                                     @"/1.1/statuses/retweet/%@.json", self.idStr]];
    SLRequest *requset=[SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodPOST URL:url parameters:nil];
    
    requset.account = account;
    
    UIApplication *application = [UIApplication sharedApplication];
    application.networkActivityIndicatorVisible = YES;
    
    [requset performRequestWithHandler:^(NSData *responsDate,
                                         NSHTTPURLResponse *urlRespnse,
                                         NSError *error){
        if (responsDate) {
            self.httpErrorMessage=nil;
            if (urlRespnse.statusCode>=200 && urlRespnse.statusCode<300) {
                NSDictionary *postRespnseDate=
                [NSJSONSerialization JSONObjectWithData:responsDate
                                                options:NSJSONReadingMutableContainers
                                                  error:NULL];
                NSLog(@"SUCCESS! Created Retweet with ID: %@", postRespnseDate[@"id_str"]);
            } else { // HTTPエラー発生時
                self.httpErrorMessage =
                [NSString stringWithFormat:@"The response status code is %ld",
                 (long)urlRespnse.statusCode];
                NSLog(@"HTTP Error: %@", self.httpErrorMessage);
                // リツイート時のHTTPエラーメッセージを画面に表示する領域がない。今後の課題。
            }
        } else { // リクエスト送信エラー発生時
            NSLog(@"ERROR: An error occurred while posting: %@", [error localizedDescription]);
            // リクエスト時の送信エラーメッセージを画面に表示する領域がない。今後の課題。
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            UIApplication *application = [UIApplication sharedApplication];
            application.networkActivityIndicatorVisible = NO;
        });
    }];/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
}
@end
