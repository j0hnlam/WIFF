//
//  FifthViewControlleriPhone5.m
//  WIFF.
//
//  Created by John Lam on 2013-10-16.
//  Copyright (c) 2013 John Lam. All rights reserved.
//

#import "FifthViewControlleriPhone5.h"

@interface FifthViewControlleriPhone5 ()

@end

@implementation FifthViewControlleriPhone5
@synthesize webViewFAQiPhone5;

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
    NSString *fullURL = @"http://wiff.hamelk.com/FAQ";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    webViewFAQiPhone5.delegate = (id)self;
    [webViewFAQiPhone5 loadRequest:requestObj];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    [webViewFAQiPhone5.scrollView addSubview:refreshControl];
    
	// Do any additional setup after loading the view.
}

-(void)handleRefresh:(UIRefreshControl *)refresh {
    // Reload my data
    NSString *fullURL = @"http://wiff.hamelk.com/FAQ";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webViewFAQiPhone5 loadRequest:requestObj];
    [refresh endRefreshing];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
