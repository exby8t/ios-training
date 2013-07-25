//
//  BNRImageStore.h
//  Homepwner
//
//  Created by Jonathan Arp on 7/23/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRImageStore : NSObject

+(BNRImageStore *) sharedStore;
-(void) setImage:(UIImage *) i forKey: (NSString *) s;
-(UIImage * ) imageForKey:(NSString * ) s;
-(void)deleteImageForKey:(NSString *)s;
@end
