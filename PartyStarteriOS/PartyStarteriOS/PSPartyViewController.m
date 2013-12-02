//
//  PSPartyViewController.m
//  PartyStarteriOS
//
//  Created by Sri Raghavan on 11/30/13.
//  Copyright (c) 2013 raman.mitra. All rights reserved.
//

#import "PSPartyViewController.h"

@interface PSPartyViewController ()

@end

@implementation PSPartyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (id)initWithParty:(PSParty *)party
{
  self = [super init];
  if (self) {
    self.party = party;
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
  [dateFormat setDateFormat:@"EEEE MMMM d, YYYY"];
  NSString *dateString = [dateFormat stringFromDate:self.party.date];
  
  self.title = self.party.name;
  self.amountNeeded.text = [NSString stringWithFormat:@"%d", [self.party.totalCost intValue] - [self.party.fundedCost intValue]];
  self.partyLocation.text = self.party.location;
  self.partyHost.text = dateString;
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)pitchIn:(id)sender {
  NSString* pitchedIn = self.amountPitchIn.text;
  NSString* newAmountNeeded = [NSString stringWithFormat:@"%d", [self.amountNeeded.text intValue] - [pitchedIn intValue]];
  self.amountNeeded.text = newAmountNeeded;
}
@end
