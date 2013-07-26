//
//  BNRFeedStore.m
//  Nerdfeed
//
//  Created by Jonathan Arp on 7/26/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import "BNRFeedStore.h"
#import "BNRRSSFeed.h"
#import "BNRConnection.h"

@implementation BNRFeedStore

-(void)fetchRSSFeedWithCompletion:(void (^)(BNRRSSFeed *, NSError *))block{
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/us/rss/topsongs/limit=10/genre=50/xml"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    BNRRSSFeed *feed = [[BNRRSSFeed alloc] init];
    BNRConnection *connection = [[BNRConnection alloc] initWithRequest:req];
    [connection setCompletionBlock:block];
    [connection setJsonRootObject:feed];
    [connection start];
}

+(BNRFeedStore *) sharedStore{
    static BNRFeedStore *feedStore = nil;
    
    if( feedStore){
        feedStore = [[BNRFeedStore alloc] init];
    }
    
    return feedStore;
}
@end
