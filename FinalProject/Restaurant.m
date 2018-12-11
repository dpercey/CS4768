//
//  Restaurant.m
//  FinalProject
//
//  Created by Dylan on 2018-11-20.
//  Copyright © 2018 Dylan. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant

@synthesize name = _name;
@synthesize location = _location;
@synthesize phoneNumber = _phoneNumber;
//@synthesize logo = _logo;


-(void) setName:(NSString *)name{
    _name = name;
}

-(void) setAddress:(NSString *)address{
    _address = address;
}

-(void) setLocation:(CLLocationCoordinate2D)location{
    _location = location;
}

-(void) setPhoneNumber:(NSString *)phoneNumber{
    _phoneNumber = phoneNumber;
}

-(void) setPlaceID:(NSString *)placeID{
    _placeID = placeID;
}

//-(void) setLogo:(NSString *)logo{
//    _logo = logo;
//}

-(NSString*) getName{
    return _name;
}

-(CLLocationCoordinate2D) getLocation{
    return _location;
}

-(NSString*) getPhoneNumber{
    return _phoneNumber;
}

//-(NSString*) getLogo{
//    return _logo;
//}

-(NSString*)getAddress{
    return _address;
}

-(NSString *)getPlaceId{
    return _placeID;
}

@end
