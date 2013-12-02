//
//  PSFirstViewController.m
//  PartyStarteriOS
//
//  Created by Mitra Raman on 11/25/13.
//  Copyright (c) 2013 raman.mitra. All rights reserved.
//

#import "PSFirstViewController.h"
#import <Parse/Parse.h>
#import "PSParty.h"
#import "PSPartyViewController.h"

@interface PSFirstViewController ()

@end

@implementation PSFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createParty:(id)sender
{
    
}

- (IBAction)chooseDate:(id)sender
{
    [self.datePickerPopup setHidden:NO];
}

- (IBAction)dateSelected:(id)sender
{
    NSString *dateString = [NSDateFormatter localizedStringFromDate:[self.dateTimePicker date]
                                                          dateStyle:NSDateFormatterShortStyle
                                                          timeStyle:NSDateFormatterFullStyle];
    [self.dateLabel setText:dateString];
    [self.dateLabel setHidden:NO];
    [self.editDate setHidden:NO];
    [self.chooseDate setHidden:YES];
    [self.datePickerPopup setHidden:YES];
}

- (IBAction)closePopup:(id)sender
{
    [self.datePickerPopup setHidden:YES];
}


- (IBAction)editDate:(id)sender
{
    [self.datePickerPopup setHidden:NO];
}

@end
