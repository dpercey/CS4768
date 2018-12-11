//
//  Restaurant.h
//  FinalProject
//
//  Created by Dylan on 2018-11-20.
//  Copyright © 2018 Dylan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Restaurant : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) CLLocationCoordinate2D location;
@property (nonatomic) NSString *phoneNumber;
@property (nonatomic) NSString *address;
@property (nonatomic) NSString *placeID;
//@property (nonatomic) NSString *logo;

-(void) setName:(NSString*)name;
-(void) setLocation:(CLLocationCoordinate2D)location;
-(void) setPhoneNumber:(NSString*)phoneNumber;
-(void) setAddress:(NSString *)address;
-(void) setPlaceID:(NSString *)placeID;
//-(void) setLogo:(NSString*)logo;

-(NSString*)getName;
-(CLLocationCoordinate2D)getLocation;
-(NSString*)getAddress;
-(NSString*)getPhoneNumber;
//-(NSString*)getLogo;
-(NSString *)getPlaceId;


@end

NS_ASSUME_NONNULL_END
