//
//  PSSecondViewController.m
//  PartyStarteriOS
//
//  Created by Mitra Raman on 11/25/13.
//  Copyright (c) 2013 raman.mitra. All rights reserved.
//

#import "PSPartyTableViewController.h"
#import <Parse/Parse.h>
#import "PSParty.h"
#import "PSPartyTableViewCell.h"

@interface PSPartyTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray* parties;

@end

@implementation PSPartyTableViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  PFQuery* query = [PSParty query];
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
  return cell;
}

@end