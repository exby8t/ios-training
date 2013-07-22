//
//  WhereViewController.m
//  wheresweat
//
//  Created by Jonathan Arp on 7/22/13.
//  Copyright (c) 2013 ND. All rights reserved.
//

#import "WhereViewController.h"

@interface WhereViewController ()

@end

@implementation WhereViewController

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil   {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self){
        _locationManager = [[CLLocationManager alloc] init];
        [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        [_locationManager setDelegate: self];
        [_locationManager startUpdatingLocation];
    }
    
    return self;
}


-(void) locationManager:(CLLocationManager *) manager
     didUpdateLocations:(NSArray *)locations{
    
    CLLocation *newLocation = [locations lastObject];
    NSLog(@"New location: %@", newLocation);
}

-(void) locationManager:(CLLocationManager *) manager
       didFailWithError:(NSError *)error{
    
    NSLog(@"Could not colcation: %@", error);
}

-(void) dealloc{
    [_locationManager setDelegate:nil];
}
@end
