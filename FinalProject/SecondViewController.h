//
//  SecondViewController.h
//  FinalProject
//
//  Created by Dylan on 2018-11-20.
//  Copyright © 2018 Dylan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Restaurant.h"

@interface SecondViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end

