//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Jonathan Arp on 7/23/13.
//  Copyright (c) 2013 ND. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore(){
    NSMutableArray *_allItems;
}
@end

@implementation BNRItemStore
@synthesize allItems = _allItems;

-(id) init{
    self = [super init];
    
    if(self){
        _allItems = [[NSMutableArray alloc]init];
        
    }
    
return self;
}

-(id)createItem{
    BNRItem *p = [BNRItem randomItem];
    [_allItems addObject:p];
    
    return p;
}

+(BNRItemStore * ) sharedStore{
    static BNRItemStore *sharedStore = nil;
    
    if(!sharedStore){
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

+(id) allocWithZone:(NSZone *)zone{
    return [ self sharedStore];
}
@end
