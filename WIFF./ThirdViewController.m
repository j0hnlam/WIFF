//
//  ThirdViewController.m
//  WIFF.
//
//  Created by John Lam on 2013-10-15.
//  Copyright (c) 2013 John Lam. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController
@synthesize webViewSchedule;

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
    webViewSchedule.delegate = (id)self;
    [webViewSchedule loadRequest:requestObj];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    [webViewSchedule.scrollView addSubview:refreshControl];
    
}

-(void)handleRefresh:(UIRefreshControl *)refresh {
    // Reload my data
    NSString *fullURL = @"http://wiff.hamelk.com/schedule";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webViewSchedule loadRequest:requestObj];
    [refresh endRefreshing];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
