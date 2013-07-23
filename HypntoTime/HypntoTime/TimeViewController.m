//
//  TimeViewController.m
//  HypntoTime
//
//  Created by Jonathan Arp on 7/23/13.
//  Copyright (c) 2013 ND. All rights reserved.
//

#import "TimeViewController.h"

@interface TimeViewController ()

@property (nonatomic, strong) IBOutlet UILabel *timelabel;

-(IBAction)showCurrentTime:(id)sender;


@end

@implementation TimeViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self){
        UITabBarItem *tbi = [self tabBarItem];
        
        [tbi setTitle:@"What Time?"];
        UIImage *img = [UIImage imageNamed:@"Time"];
        [tbi setImage:img];
        
        [[self timelabel] setBackgroundColor:[UIColor redColor]];
    }
    
    return self;
}



-(IBAction)showCurrentTime:(id)sender{
    NSDate *now = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    [ [self timelabel] setText:[formatter stringFromDate:now]];
}

@end
