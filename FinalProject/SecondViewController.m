//
//  SecondViewController.m
//  FinalProject
//
//  Created by Dylan on 2018-11-20.
//  Copyright © 2018 Dylan. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@end

@implementation SecondViewController

@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    CLLocationManager* locationManager;
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    
    CLLocationCoordinate2D currentLocation;
    
    currentLocation.latitude=locationManager.location.coordinate.latitude;
    currentLocation.longitude=locationManager.location.coordinate.longitude;
    
    
    MKCoordinateRegion reg = MKCoordinateRegionMakeWithDistance(currentLocation, 400, 400);
    self.mapView.region = reg;
    self.mapView.delegate = self;
    
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
