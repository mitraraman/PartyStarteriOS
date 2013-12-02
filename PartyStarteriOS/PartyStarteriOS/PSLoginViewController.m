//
//  PSLoginViewController.m
//  PartyStarteriOS
//
//  Created by Sri Raghavan on 11/30/13.
//  Copyright (c) 2013 raman.mitra. All rights reserved.
//

#import "PSLoginViewController.h"

@interface PSLoginViewController ()

@end

@implementation PSLoginViewController

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
  // Do any additional setup after loading the view.
  UIImage* backgroundImage = [UIImage imageNamed:@"large-solo.jpg"];
  UIImageView* backgroundImageView = [[UIImageView alloc] initWithImage:backgroundImage];
  backgroundImageView.contentMode = UIViewContentModeCenter;
  [self.view insertSubview:backgroundImageView atIndex:0];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonPressed:(id)sender
{
  if (YES) {
    // logged in successfully
    [self performSegueWithIdentifier:@"loginSegue" sender:sender];
  }
}

@end
