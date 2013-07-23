//
//  HypnosisViewController.m
//  HypntoTime
//
//  Created by Jonathan Arp on 7/23/13.
//  Copyright (c) 2013 ND. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@implementation HypnosisViewController


-(void) viewDidLoad{
    NSLog(@"hypno loaded");
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self){
        UITabBarItem *tbi = [self tabBarItem];
        
        [tbi setTitle:@"Hypnosis"];
        UIImage *img = [UIImage imageNamed:@"Hypno.png"];
        [tbi setImage:img];
    }
    
    return self;
}

-(void) loadView{
    
    CGRect frame = [[UIScreen mainScreen] bounds];
    HypnosisView *v = [[HypnosisView alloc] initWithFrame:frame];
    
    [self setView:v];
}

@end
