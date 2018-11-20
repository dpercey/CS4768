//
//  Restaurant.h
//  FinalProject
//
//  Created by Dylan on 2018-11-20.
//  Copyright © 2018 Dylan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Restaurant : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *location;
@property (nonatomic) NSString *phoneNumber;
//@property (nonatomic) NSString *logo;

-(void) setName:(NSString*)name;
-(void) setLocation:(NSString*)location;
-(void) setPhoneNumber:(NSString*)phoneNumber;
//-(void) setLogo:(NSString*)logo;

-(NSString*)getName;
-(NSString*)getLocation;
-(NSString*)getPhoneNumber;
//-(NSString*)getLogo;


@end

NS_ASSUME_NONNULL_END
