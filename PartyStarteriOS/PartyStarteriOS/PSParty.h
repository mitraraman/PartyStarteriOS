//
//  PSParty.h
//  PartyStarteriOS
//
//  Created by Sri Raghavan on 11/28/13.
//  Copyright (c) 2013 raman.mitra. All rights reserved.
//

#import <Parse/Parse.h>

@interface PSParty : PFObject <PFSubclassing>

+ (NSString*)parseClassName;

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* description;
@property (nonatomic, strong) NSString* location;
@property (nonatomic, strong) NSDate* date;
@property (nonatomic, strong) NSNumber* totalCost;
@property (nonatomic, strong) NSNumber* fundedCost;
@property (nonatomic, strong) NSNumber* minDonation;

@end
