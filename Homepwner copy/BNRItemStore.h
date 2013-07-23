//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Jonathan Arp on 7/23/13.
//  Copyright (c) 2013 ND. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject{}

+ (BNRItemStore * ) sharedStore;

@property (nonatomic, strong, readonly) NSArray *allItems;

//-(BNRItem *) createItem;
-(id) createItem;
@end
