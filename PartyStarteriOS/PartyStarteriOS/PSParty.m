//
//  PSParty.m
//  PartyStarteriOS
//
//  Created by Sri Raghavan on 11/28/13.
//  Copyright (c) 2013 raman.mitra. All rights reserved.
//

#import <Parse/Parse.h>
#import <Parse/PFObject+Subclass.h>
#import "PSParty.h"

@implementation PSParty

+ (NSString*)parseClassName
{
  return @"Party";
}

@dynamic name;
@dynamic description;
@dynamic location;

-(NSNumber *)totalCost
{
  NSNumberFormatter* f = [[NSNumberFormatter alloc] init];
  return [f numberFromString:self[@"totalCost"]];
}

-(void)setTotalCost:(NSNumber *)totalCost
{
  NSString* s = [NSString stringWithFormat:@"%@", totalCost];
  [self setObject:s forKey:@"totalCost"];
}

-(void)setDate:(NSDate *)date
{
  NSLog(@"%@", date);
}

-(NSDate *)date
{
  NSString* dateStr = self[@"date"];
  NSLog(@"%@", dateStr);
  return [NSDate date];
}

@end
