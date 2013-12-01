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

NSDateFormatter* dateFormatter = nil;

@implementation PSParty

+ (NSString*)parseClassName
{
  return @"PSParty";
}

@dynamic name;
@dynamic description;
@dynamic location;
@dynamic date;
@dynamic totalCost;
@dynamic fundedCost;
@dynamic minDonation;

/*
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
  if (dateFormatter == nil) {
    dateFormatter = [[NSDateFormatter alloc] init];
    NSLocale* enUSPOSIXLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [dateFormatter setLocale:enUSPOSIXLocale];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
  }

  NSDate* now = [NSDate date];
  NSString* dateStr = [dateFormatter stringFromDate:now];
  [self setObject:dateStr forKey:@"date"];
}

-(NSDate *)date
{
  if (dateFormatter == nil) {
    dateFormatter = [[NSDateFormatter alloc] init];
    NSLocale* enUSPOSIXLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [dateFormatter setLocale:enUSPOSIXLocale];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
  }

  NSString* dateStr = self[@"date"];
  if ([dateStr isKindOfClass:[NSNull class]]) {
    return nil;
  }
  return [dateFormatter dateFromString:dateStr];
}
*/

@end
