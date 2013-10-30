//
//  SecondViewControlleriPhone5.m
//  WIFF.
//
//  Created by John Lam on 2013-10-16.
//  Copyright (c) 2013 John Lam. All rights reserved.
//

#import "SecondViewControlleriPhone5.h"

@interface SecondViewControlleriPhone5 ()

@end

@implementation SecondViewControlleriPhone5
@synthesize webViewUpdatesiPhone5;

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
	// Do any additional setup after loading the view, typically from a nib.
    NSString *fullURL = @"http://wiff.hamelk.com/blog";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    webViewUpdatesiPhone5.delegate = (id)self;
    [webViewUpdatesiPhone5 loadRequest:requestObj];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    [webViewUpdatesiPhone5.scrollView addSubview:refreshControl];
}

-(void)handleRefresh:(UIRefreshControl *)refresh {
    // Reload my data
    NSString *fullURL = @"http://wiff.hamelk.com/blog";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webViewUpdatesiPhone5 loadRequest:requestObj];
    [refresh endRefreshing];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
