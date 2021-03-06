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
  self.tableView.backgroundColor = [UIColor blackColor];
  self.tableView.separatorColor = [UIColor clearColor];
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

- (UIImage *)randomBackgroundImage {
    NSArray *backgroundImages = [[NSArray alloc] initWithObjects:@"bottles.jpg",@"cocktails.jpg",@"lawn-party.jpg", @"legs.jpg", @"more-beer.jpg", @"more-hands.jpg", @"pour.jpg",@"solo-cups.jpg",nil];
    int randomNumber = arc4random() % [backgroundImages count];
    UIImage *randomImage = [UIImage imageNamed:[backgroundImages objectAtIndex:randomNumber]];
    return randomImage;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UIImage* backgroundImage = [self randomBackgroundImage];
  UIImageView* backgroundImageView = [[UIImageView alloc] initWithImage:backgroundImage];
  backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    
  PSParty* party = [self.parties objectAtIndex:indexPath.row];
  PSPartyTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"PSPartyTableViewCell"];
  cell.nameLabel.text = party.name;
  cell.locationLabel.text = party.location;
  cell.donationTargetLabel.text = [NSString stringWithFormat:@"$%@", party.totalCost];
  cell.backgroundView = backgroundImageView;
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