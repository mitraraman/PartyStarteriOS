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

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.title = self.party.name;
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
