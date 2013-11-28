//
//  PSParty.m
//  PartyStarteriOS
//
//  Created by Sri Raghavan on 11/28/13.
//  Copyright (c) 2013 raman.mitra. All rights reserved.
//

#import "PSParty.h"
#import <Parse/PFObject+Subclass.h>

@implementation PSParty

+ (NSString*)parseClassName
{
  return @"Party";
}

@dynamic name;
@dynamic description;
@dynamic location;
@dynamic totalCost;

@end
