//
//  FirstViewController.m
//  FinalProject
//
//  Created by Dylan on 2018-11-20.
//  Copyright © 2018 Dylan. All rights reserved.
//

#import "FirstViewController.h"
#import "Restaurant.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize restaurants;
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    restaurants = [[NSMutableArray alloc]initWithObjects: nil];
    self.tabBarController.selectedViewController
    = [self.tabBarController.viewControllers objectAtIndex:1];
    
}

- (void)viewWillAppear:(BOOL)animated{
  
    [self loadRestaurants];
}


- (void) loadRestaurants{
    SecondViewController *controller = self.tabBarController.viewControllers[1];

    if(controller.route != nil){
        controller.route.map = nil;
    }
    
    CLLocationCoordinate2D currentLocation;
    currentLocation.latitude = controller.locationManager.location.coordinate.latitude;
    currentLocation.longitude = controller.locationManager.location.coordinate.longitude;
    
    NSLog(@"%f",currentLocation.latitude);
    NSLog(@"%f",currentLocation.longitude);
    
    NSString *url = @"https://maps.googleapis.com/maps/api/place/textsearch/json?location=";
    
    url =[url stringByAppendingString:[NSString stringWithFormat:@"%f", currentLocation.latitude]];
    url =[url stringByAppendingString:[NSString stringWithFormat:@",%f", currentLocation.longitude]];
    url =[url stringByAppendingString:@"&type=restaurant&rankby=distance&key="];
    url =[url stringByAppendingString:@"AIzaSyDvEWcGH-ltqTWsW3bv-bqkdCJAivJW-q0"];
    
    NSLog(url);
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    
    NSError *error = nil;
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error ];
    
    
    if([oResponseData length] != 0){
        
        NSDictionary *s = [NSJSONSerialization JSONObjectWithData:oResponseData options:0 error:&error];
        NSArray *results = s[@"results"];
        
        
        [self.restaurants removeAllObjects];

        for(NSDictionary *r in results){
            Restaurant *thing = [[Restaurant alloc]init];
            [thing setName:r[@"name"]];
            [thing setAddress:r[@"formatted_address"]];
            [thing setPlaceID:r[@"place_id"]];
            CLLocationCoordinate2D rlocation;
            rlocation.latitude = [[r valueForKeyPath:@"geometry.location.lat"]doubleValue];
            rlocation.longitude = [[r valueForKeyPath:@"geometry.location.lng"]doubleValue];
            NSString *str=[[NSString alloc] initWithFormat:@" latitude:%f longitude:%f",rlocation.latitude,rlocation.longitude];
            NSLog(@"%@",str);
            [thing setLocation:rlocation];
            [self addRestaurant:thing];

            GMSMarker *marker = [GMSMarker markerWithPosition:rlocation];
            marker.title = thing.getName;
            marker.icon=[UIImage imageNamed:@"iconmap.png"];
            marker.map = controller.mapView;
            marker.snippet = thing.getName;
            
            
        }
        [self.tableView reloadData];
    }
    

}

-(void) didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

//Default function for Sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//Default function for RowNum
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [restaurants count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    tableView.rowHeight=80;
    
    NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //Null handling
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    if (indexPath.row % 2 == 0){
        cell.backgroundColor = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    } else {
        cell.backgroundColor = [UIColor colorWithRed:0.0f green:1.0f blue:0.0f alpha:1.0f];
    }
    //Storing of all "Toy" data into cell.
    
    UILabel *restaurantName = (UILabel *)[cell viewWithTag:1];
    restaurantName.text = [restaurants[indexPath.row]getName];
    UILabel *restaurantLocation = (UILabel *)[cell viewWithTag:2];
    restaurantLocation.text = [restaurants[indexPath.row]getAddress];
    UILabel *restaurantPhoneNumber = (UILabel *)[cell viewWithTag:3];
    restaurantPhoneNumber.text = [restaurants[indexPath.row]getPhoneNumber];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SecondViewController* svc = self.tabBarController.viewControllers[1];
    [svc updateMap:self.restaurants[indexPath.row]];
    self.tabBarController.selectedViewController
    = [self.tabBarController.viewControllers objectAtIndex:1];
}


//Adds Restaurant to the NSMutableArray of Restaurants
-(void) addRestaurant:(NSObject *)restaurant{
    [restaurants addObject:restaurant];
}



@end
