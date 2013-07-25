//
//  BNRImageStore.m
//  Homepwner
//
//  Created by Jonathan Arp on 7/23/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import "BNRImageStore.h"

@interface BNRImageStore(){
    NSMutableDictionary *_dictionary;
} 

@end

@implementation BNRImageStore


-(void) setImage:(UIImage *)i forKey:(NSString *)s{
    [_dictionary setObject:i forKey:s];
}

-(UIImage *) imageForKey:(NSString *)s{
    return [_dictionary objectForKey:s];
}

-(void) deleteImageForKey:(NSString *)s{
    [_dictionary removeObjectForKey:s];
}


// boiler plate singleton
- (id)init
{
    self = [super init];
    if (self) {
        _dictionary = [[NSMutableDictionary  alloc] init];
    }
    
    return self;
}

+ (BNRImageStore *)sharedStore
{
    static BNRImageStore *sharedStore = nil;
    if (!sharedStore)
        sharedStore = [[super allocWithZone:nil] init];
    return sharedStore;
}


+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

@end
