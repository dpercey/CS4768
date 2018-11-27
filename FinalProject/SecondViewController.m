//
//  SecondViewController.m
//  FinalProject
//
//  Created by Dylan on 2018-11-20.
//  Copyright © 2018 Dylan. All rights reserved.
//

#import "SecondViewController.h"
#import <GoogleMaps/GoogleMaps.h>
@import GoogleMaps;
@import GooglePlaces;

@interface SecondViewController ()
@end

@implementation SecondViewController

@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startUserLocationSearch];
  
    
}


- (void) startUserLocationSearch{
    [GMSServices provideAPIKey:@"AIzaSyC1QIqrDn8keJpKyowsOpOysOHbOyBnJO8"];
    [GMSPlacesClient provideAPIKey:@"AIzaSyC1QIqrDn8keJpKyowsOpOysOHbOyBnJO8"];
    
    
    self.locationManager = [[CLLocationManager alloc] init];
    
    self.locationManager.delegate =self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    
    if([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]){
        [self.locationManager requestWhenInUseAuthorization];
    }
    NSLog(@"searching now");
    [self.locationManager startUpdatingLocation];
    
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocationCoordinate2D currentLocation;
    currentLocation.latitude = self.locationManager.location.coordinate.latitude;
    currentLocation.longitude = self.locationManager.location.coordinate.longitude;
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:currentLocation.latitude
                                                            longitude:currentLocation.longitude
                                                                 zoom:6];
    
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.settings.compassButton = YES;
    mapView.settings.myLocationButton = YES;
    mapView.myLocationEnabled = YES;
    self.mapView = mapView;
}


@end
