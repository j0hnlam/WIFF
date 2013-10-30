//
//  FirstViewControlleriPhone5.m
//  WIFF.
//
//  Created by John Lam on 2013-10-16.
//  Copyright (c) 2013 John Lam. All rights reserved.
//

#import "FirstViewControlleriPhone5.h"

@interface FirstViewControlleriPhone5 ()

@end

@implementation FirstViewControlleriPhone5
@synthesize webViewFilmiPhone5;

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
    NSString *fullURL = @"http://wiff.hamelk.com";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    webViewFilmiPhone5.delegate = (id)self;
    [webViewFilmiPhone5 loadRequest:requestObj];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    [webViewFilmiPhone5.scrollView addSubview:refreshControl];
    
}

-(void)handleRefresh:(UIRefreshControl *)refresh {
    // Reload my data
    NSString *fullURL = @"http://wiff.hamelk.com";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webViewFilmiPhone5 loadRequest:requestObj];
    [refresh endRefreshing];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
