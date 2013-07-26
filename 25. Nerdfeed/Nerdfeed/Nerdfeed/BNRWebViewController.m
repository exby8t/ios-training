//
//  BNRWebViewController.m
//  Nerdfeed
//
//  Created by Joe Conway on 2/25/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import "BNRWebViewController.h"


@implementation BNRWebViewController


-(void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem{
    if( barButtonItem == [[self navigationItem] leftBarButtonItem]){
        [[self navigationItem] setLeftBarButtonItem:nil];
    }
}
-(void) splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc{
    [barButtonItem setTitle:@"List"];
    [[self navigationItem] setLeftBarButtonItem:barButtonItem];
}

- (void)loadView
{
    UIWebView *wv = [[UIWebView alloc] init];
    [self setView:wv];
}

- (void)setLink:(NSString *)link
{
    _link = link;
    if(_link) {
        NSURL *url = [NSURL URLWithString:[self link]];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [(UIWebView *)[self view] loadRequest:req];
    }
}

@end
