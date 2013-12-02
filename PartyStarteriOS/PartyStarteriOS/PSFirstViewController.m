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
//    self.tableView.backgroundColor = [UIColor blackColor];
//    self.tableView.separatorColor = [UIColor clearColor];
//    PFQuery* query = [PSParty query];
//    [query whereKey:@"date" greaterThanOrEqualTo:[NSDate date]];
//    [query findObjectsInBackgroundWithBlock:^(NSArray* objects, NSError* error) {
//        self.parties = [objects copy];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//        });
//    }];

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
    self.party.date = [self.dateTimePicker date];
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
