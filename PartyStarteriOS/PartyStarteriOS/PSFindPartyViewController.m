//
//  PSSecondViewController.m
//  PartyStarteriOS
//
//  Created by Mitra Raman on 11/25/13.
//  Copyright (c) 2013 raman.mitra. All rights reserved.
//

#import "PSFindPartyViewController.h"
#import <Parse/Parse.h>
#import "PSParty.h"
#import "PSPartyTableViewCell.h"
#import "PSPartyViewController.h"

NSString* kPartySelectSegueIdentifier = @"partySelectSegue";

@interface PSFindPartyViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray* parties;

@end

@implementation PSFindPartyViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  PFQuery* query = [PSParty query];
  [query whereKey:@"date" greaterThanOrEqualTo:[NSDate date]];
  [query findObjectsInBackgroundWithBlock:^(NSArray* objects, NSError* error) {
    self.parties = [objects copy];
    dispatch_async(dispatch_get_main_queue(), ^{
      [self.tableView reloadData];
    });
  }];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [self.parties count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  PSParty* party = [self.parties objectAtIndex:indexPath.row];
  PSPartyTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"PSPartyTableViewCell"];
  cell.nameLabel.text = party.name;
  cell.locationLabel.text = party.location;
  cell.donationTargetLabel.text = [NSString stringWithFormat:@"$%@", party.totalCost];

  return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([segue.identifier isEqual: kPartySelectSegueIdentifier]) {
    UITableViewCell* cell = sender;
    PSPartyViewController* controller = segue.destinationViewController;
    controller.party = [self.parties objectAtIndex:[self.tableView indexPathForCell:cell].row];
  }
}

@end