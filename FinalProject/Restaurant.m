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

-(void) setLocation:(NSString *)location{
    _location = location;
}

-(void) setPhoneNumber:(NSString *)phoneNumber{
    _phoneNumber = phoneNumber;
}

//-(void) setLogo:(NSString *)logo{
//    _logo = logo;
//}

-(NSString*) getName{
    return _name;
}

-(NSString*) getLocation{
    return _location;
}

-(NSString*) getPhoneNumber{
    return _phoneNumber;
}

//-(NSString*) getLogo{
//    return _logo;
//}

@end
