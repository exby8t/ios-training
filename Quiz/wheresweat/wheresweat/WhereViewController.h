//
//  WhereViewController.h
//  wheresweat
//
//  Created by Jonathan Arp on 7/22/13.
//  Copyright (c) 2013 ND. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface WhereViewController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
}
@end
