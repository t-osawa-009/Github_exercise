//
//  WebViewController.m
//  Infinity
//
//  Created by 大澤卓也 on 2014/06/21.
//  Copyright (c) 2014年 ___FULLUSERNAME__. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()



@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation WebViewController

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
    self.webView.delegate=self;
    NSURLRequest *myRequest=[NSURLRequest requestWithURL:self.openURL];
    [self.webView loadRequest:myRequest];
    UIImage *img = [UIImage imageNamed:@"UIButtonType2.png"];
    //ボタンのインスタンスを作成します。
    UIButton *button = [[UIButton alloc] init];
    //ボタンに画像を設定します。
    [button setBackgroundImage:img forState:UIControlStateNormal];
    //表示するフレームを設定します。
    button.frame = CGRectMake(10, 10, 50, 30);
    //ビューへ貼り付けます。
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self.activityIndicator startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.activityIndicator stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.activityIndicator stopAnimating];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)nextButton:(UIButton *)sender {
}

- (IBAction)backButton:(UIButton *)sender {
}
@end
