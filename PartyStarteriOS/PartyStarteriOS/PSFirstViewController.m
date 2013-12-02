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
    NSString *eventName = self.eventName.text;
    NSString *location = self.location.text;
    NSString *date = self.dateLabel.text;
    NSString *totalCost = self.totalCost.text;
    NSString *minDonation = self.minDonation.text;
    NSString *description = self.description.text;
    if ([eventName isEqualToString:@""] || [location isEqualToString:@""] ||
        [date isEqualToString:@""] || [totalCost isEqualToString:@""] ||
        [minDonation isEqualToString:@""] || [description isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Uh Oh..." message:@"Please enter input in all fields." delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
        [alert show];
    } else {
        PFObject *newParty = [PFObject objectWithClassName:@"PSParty"];
        newParty[@"date"] = self.dateTimePicker.date;
        newParty[@"description"] = description;
        NSLog(@"%@", description);
        newParty[@"fundedCost"] = 0;
        newParty[@"location"] = location;
        NSLog(@"%@", location);
        newParty[@"minDonation"] = [NSDecimalNumber decimalNumberWithString:minDonation];
        newParty[@"name"] = eventName;
        NSLog(@"%@", eventName);
        newParty[@"totalCost"] = [NSDecimalNumber decimalNumberWithString:totalCost];
        NSLog(@"%@", totalCost);
        [newParty saveInBackground];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
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
