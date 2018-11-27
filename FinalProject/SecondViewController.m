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
@import GooglePlacePicker;

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
    [self.locationManager stopUpdatingLocation];
    CLLocationCoordinate2D currentLocation;
    currentLocation.latitude = self.locationManager.location.coordinate.latitude;
    currentLocation.longitude = self.locationManager.location.coordinate.longitude;
    
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:currentLocation.latitude
                                                            longitude:currentLocation.longitude
                                                                 zoom:16];
    
    self.mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.mapView.settings.compassButton = NO;
    self.mapView.settings.myLocationButton = YES;
    self.mapView.myLocationEnabled = YES;
   UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectZero];
    searchBar.frame = CGRectMake(0, 10, 100, searchBar.frame.size.height);
   
    self.view = self.mapView;
     [self.view bringSubviewToFront:searchBar];
}

// The code snippet below shows how to create and display a GMSPlacePickerViewController.
- (IBAction)pickPlace:(UIButton *)sender {
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude);
    CLLocationCoordinate2D northEast = CLLocationCoordinate2DMake(center.latitude + 0.001,
                                                                  center.longitude + 0.001);
    CLLocationCoordinate2D southWest = CLLocationCoordinate2DMake(center.latitude - 0.001,
                                                                  center.longitude - 0.001);
    GMSCoordinateBounds *viewport = [[GMSCoordinateBounds alloc] initWithCoordinate:northEast
                                                                         coordinate:southWest];
    

    GMSPlacePickerConfig *config = [[GMSPlacePickerConfig alloc] initWithViewport:nil];
    GMSPlacePickerViewController *placePicker =
    [[GMSPlacePickerViewController alloc] initWithConfig:config];
    placePicker.delegate = self;
    
    [self presentViewController:placePicker animated:YES completion:nil];
}

// To receive the results from the place picker 'self' will need to conform to
// GMSPlacePickerViewControllerDelegate and implement this code.
- (void)placePicker:(GMSPlacePickerViewController *)viewController didPickPlace:(GMSPlace *)place {
    // Dismiss the place picker, as it cannot dismiss itself.
    [viewController dismissViewControllerAnimated:YES completion:nil];
    
    NSLog(@"Place name %@", place.name);
    NSLog(@"Place address %@", place.formattedAddress);
    NSLog(@"Place attributions %@", place.attributions.string);
}

- (void)placePickerDidCancel:(GMSPlacePickerViewController *)viewController {
    // Dismiss the place picker, as it cannot dismiss itself.
    [viewController dismissViewControllerAnimated:YES completion:nil];
    
    NSLog(@"No place selected");
}




@end
