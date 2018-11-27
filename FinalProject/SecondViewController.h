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
#import <GoogleMaps/GoogleMaps.h>
@import GoogleMaps;
@import GooglePlaces;

@interface SecondViewController : UIViewController <GMSMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, retain) IBOutlet GMSMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

