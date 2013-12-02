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
  self.party = party;
  if (self) {
    self.party = party;
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.title = self.party.name;
  self.amountNeeded.text = [NSString stringWithFormat:@"%d", [self.party.totalCost intValue] - [self.party.fundedCost intValue]];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)pitchIn:(id)sender {
}
@end
