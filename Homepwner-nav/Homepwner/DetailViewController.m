//
//  DetailViewController.m
//  Homepwner
//
//  Created by Jonathan Arp on 7/23/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import "DetailViewController.h"
#import "BNRItem.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation DetailViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated] ;
    BNRItem *item = [self item];
    
    [[self nameField] setText:[item itemName]];
        [[self serialField] setText:[item serialNumber]];
        [[self valueField] setText:[NSString stringWithFormat:@"%d", [item valueInDollars]]];

}

@end
