//
//  BNRRSSFeed.h
//  NerdFeed
//
//  Created by Jonathan Arp on 7/25/13.
//  Copyright (c) 2013 ND. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRJSONObject.h"

@interface BNRRSSFeed : NSObject <BNRJSONObject>
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong, readonly) NSMutableArray *items;
@end
