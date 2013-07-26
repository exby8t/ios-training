//
//  BNRFeedStore.h
//  Nerdfeed
//
//  Created by Jonathan Arp on 7/26/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRRSSFeed;

@interface BNRFeedStore : NSObject

+(BNRFeedStore *)sharedStore;
-(void)fetchRSSFeedWithCompletion:(void (^)(BNRRSSFeed *obj, NSError *err))block;

@end
