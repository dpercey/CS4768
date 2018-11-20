//
//  FirstViewController.m
//  FinalProject
//
//  Created by Dylan on 2018-11-20.
//  Copyright © 2018 Dylan. All rights reserved.
//

#import "FirstViewController.h"
#import "Restaurant.h"

@interface FirstViewController ()


@end

@implementation FirstViewController
@synthesize restaurants;
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    Restaurant *r1 = [[Restaurant alloc]init];
    [r1 setName:@"McDonalds"];
    [r1 setLocation:@"54 Kenmount Rd"];
    [r1 setPhoneNumber:@"(709)726-9720"];
    //[r1 setLogo:[UIImagePNGRepresentation([UIImage imageNamed:@""]) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength]];
    
    Restaurant *r2 = [[Restaurant alloc]init];
    [r2 setName:@"Domino's"];
    [r2 setLocation:@"274 Freshwater Rd"];
    [r2 setPhoneNumber:@"(709)737-9444"];
    //[r1 setLogo:[UIImagePNGRepresentation([UIImage imageNamed:@""]) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength]];
    
    Restaurant *r3 = [[Restaurant alloc]init];
    [r3 setName:@"Tim Hortons"];
    [r3 setLocation:@"17 Westerland Rd"];
    [r3 setPhoneNumber:@"(709)864-4899"];
    //[r1 setLogo:[UIImagePNGRepresentation([UIImage imageNamed:@""]) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength]];
    
    Restaurant *r4 = [[Restaurant alloc]init];
    [r4 setName:@"Starbucks"];
    [r4 setLocation:@"Avalon Mall, 48 Kenmount Rd"];
    [r4 setPhoneNumber:@"(709)739-3929"];
    //[r1 setLogo:[UIImagePNGRepresentation([UIImage imageNamed:@""]) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength]];
    
    restaurants = [[NSMutableArray alloc]initWithObjects: r1,r2,r3,r4,nil];
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
    tableView.rowHeight=60;
    
    NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //Null handling
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    if (indexPath.row % 2 == 0){
        cell.backgroundColor = [UIColor lightGrayColor];
    } else {
        cell.backgroundColor = [UIColor colorWithRed:0.0f green:1.0f blue:0.0f alpha:1.0f];
    }
    //Storing of all "Toy" data into cell.
    
    UILabel *restaurantName = (UILabel *)[cell viewWithTag:1];
    restaurantName.text = [restaurants[indexPath.row]getName];
    UILabel *restaurantLocation = (UILabel *)[cell viewWithTag:2];
    restaurantLocation.text = [restaurants[indexPath.row]getLocation];
    UILabel *restaurantPhoneNumber = (UILabel *)[cell viewWithTag:3];
    restaurantPhoneNumber.text = [restaurants[indexPath.row]getPhoneNumber];
    return cell;
}

//Adds Restaurant to the NSMutableArray of Restaurants
-(void) addRestaurant:(NSObject *)restaurant{
    [restaurants addObject:restaurant];
}

@end
