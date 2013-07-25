//
//  BNRRSSItem.m
//  NerdFeed
//
//  Created by Jonathan Arp on 7/25/13.
//  Copyright (c) 2013 ND. All rights reserved.
//

#import "BNRRSSItem.h"

@implementation BNRRSSItem

-(void) readFromJSONObject:(NSDictionary *)jsonObject{
    NSDictionary *name = [jsonObject objectForKey:@"im:name"];
    [self setTitle:[name objectForKey:@"label"]];
    NSArray *linkArray = [jsonObject objectForKey:@"link"];
    
    for(NSDictionary *d in linkArray){
        
        NSDictionary *attrs = [d objectForKey:@"attributes"];
        if([[attrs objectForKey:@"im:assetType"] isEqualToString:@"preview"]){
            NSDictionary *attrs = [d objectForKey:@"attributes"];
            [self setLink:[attrs objectForKey:@"href"]];
        }
        
    }
}
@end
