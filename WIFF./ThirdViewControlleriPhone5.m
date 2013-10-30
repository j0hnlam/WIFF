//
//  ThirdViewControlleriPhone5.m
//  WIFF.
//
//  Created by John Lam on 2013-10-16.
//  Copyright (c) 2013 John Lam. All rights reserved.
//

#import "ThirdViewControlleriPhone5.h"

@interface ThirdViewControlleriPhone5 ()

@end

@implementation ThirdViewControlleriPhone5
@synthesize webViewScheduleiPhone5;

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
    NSString *fullURL = @"http://wiff.hamelk.com/schedule";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    webViewScheduleiPhone5.delegate = (id)self;
    [webViewScheduleiPhone5 loadRequest:requestObj];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    [webViewScheduleiPhone5.scrollView addSubview:refreshControl];
}

-(void)handleRefresh:(UIRefreshControl *)refresh {
    // Reload my data
    NSString *fullURL = @"http://wiff.hamelk.com/schedule";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webViewScheduleiPhone5 loadRequest:requestObj];
    [refresh endRefreshing];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
