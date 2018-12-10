//
//  FirstViewController.h
//  FinalProject
//
//  Created by Dylan on 2018-11-20.
//  Copyright © 2018 Dylan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface FirstViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (copy,nonatomic) NSMutableArray *restaurants;

-(void) addRestaurant:(NSObject*)restaurant;
-(void) loadRestaurants;

@end

