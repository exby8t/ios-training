//
//  DetailViewController.h
//  Homepwner
//
//  Created by Jonathan Arp on 7/23/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BNRItem;


@interface DetailViewController : UIViewController
@property (nonatomic, strong) BNRItem *item;

@end
