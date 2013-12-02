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
@property (strong, nonatomic) PSParty *party;
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
    self.party.name = self.eventName.text;
    self.party.location = self.location.text;
    NSString *date = self.dateLabel.text;
    self.party.date = self.dateTimePicker.date;
    self.party.description = self.description.text;
    
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * totalCost =[f numberFromString:self.totalCost.text];
    self.party.totalCost = totalCost;
    NSNumber *minDonation = [f numberFromString:self.minDonation.text];
    self.party.minDonation = minDonation;
    
    if ([self.eventName.text isEqualToString:@""] || [self.location.text isEqualToString:@""] ||
        !self.dateTimePicker.date|| !totalCost ||
        !minDonation || [self.description.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Uh Oh..." message:@"Please enter input in all fields." delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
        [alert show];
    } else {
//        PFObject *newParty = [PFObject objectWithClassName:@"PSParty"];
//        newParty[@"date"] = self.dateTimePicker.date;
//        newParty[@"description"] = self.description.text;
//        newParty[@"fundedCost"] = 0;
//        newParty[@"location"] = self.location.text;
//        newParty[@"minDonation"] = minDonation;
//        newParty[@"name"] = self.eventName.text;
//        newParty[@"totalCost"] = totalCost;
//        NSLog(@"%@", totalCost);
//        [newParty saveInBackground];
        
        PSPartyViewController *defaultVC = [[PSPartyViewController alloc] initWithParty:self.party];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:defaultVC];
        [self presentViewController:navController animated:YES completion:nil];
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
