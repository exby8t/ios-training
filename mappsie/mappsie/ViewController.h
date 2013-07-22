//
//  ViewController.h
//  mappsie
//
//  Created by Jonathan Arp on 7/22/13.
//  Copyright (c) 2013 ND. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
{
    CLLocationManager *_locationManager;
}

@property (nonatomic, strong)IBOutlet MKMapView *worldView;
@property (nonatomic, strong)IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong)IBOutlet UITextField *locationTitleField;

@end
