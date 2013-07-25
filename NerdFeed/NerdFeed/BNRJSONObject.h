//
//  BNRJSONObject.h
//  NerdFeed
//
//  Created by Jonathan Arp on 7/25/13.
//  Copyright (c) 2013 ND. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BNRJSONObject <NSObject>

-(void) readFromJSONObject: (NSDictionary *) jsonObject;

@end
