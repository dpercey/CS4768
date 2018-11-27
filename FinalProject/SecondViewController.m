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
    
    ////////////////////////
    [GMSServices provideAPIKey:@"AIzaSyC1QIqrDn8keJpKyowsOpOysOHbOyBnJO8"];
    [GMSPlacesClient provideAPIKey:@"AIzaSyC1QIqrDn8keJpKyowsOpOysOHbOyBnJO8"];
    
    
    CLLocation *location = [[CLLocation alloc] init];
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    
    //Right now hard coded to sydney as show in the GoogleMaps Documentation
    // want to be able to use current long/lat.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                           longitude:151.20
                                                                zoom:6];
    
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.settings.compassButton = YES;
    mapView.settings.myLocationButton = YES;
    mapView.myLocationEnabled = YES;
    self.view = mapView;
    
     //Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
    marker.title = @"Sydney";
   marker.snippet = @"Australia";
    marker.map = mapView;
    
    ///////////////////////
    
    //CLLocationManager* locationManager;
    //locationManager = [[CLLocationManager alloc]init];
   // locationManager.delegate = self;
    //[locationManager startUpdatingLocation];
    
    
    
    //var locationManager = CLLocationManager()
   // var currentLocation: CLLocation?
   // var mapView: GMSMapView!
   // var placesClient: GMSPlacesClient!
   // var zoomLevel: Float = 15.0
    
    
    
    
    
   // CLLocationCoordinate2D currentLocation;
    
   // currentLocation.latitude=locationManager.location.coordinate.latitude;
   // currentLocation.longitude=locationManager.location.coordinate.longitude;
    
    
   // MKCoordinateRegion reg = MKCoordinateRegionMakeWithDistance(currentLocation, 400, 400);
   // self.mapView.region = reg;
    //self.mapView.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}



@end
