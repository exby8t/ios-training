//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by Jonathan Arp on 7/25/13.
//  Copyright (c) 2013 ND. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@implementation BNRDrawViewController

-(void) loadView{
    [self setView:[[BNRDrawView alloc] initWithFrame:CGRectZero]];
}
@end
