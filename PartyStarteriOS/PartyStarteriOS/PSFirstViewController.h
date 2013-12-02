//
//  PSFirstViewController.h
//  PartyStarteriOS
//
//  Created by Mitra Raman on 11/25/13.
//  Copyright (c) 2013 raman.mitra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSFirstViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *eventName;
@property (strong, nonatomic) IBOutlet UITextField *location;
@property (strong, nonatomic) IBOutlet UIDatePicker *dateTimePicker;
@property (strong, nonatomic) IBOutlet UITextField *totalCost;
@property (strong, nonatomic) IBOutlet UITextField *minDonation;
@property (strong, nonatomic) IBOutlet UITextView *description;

- (IBAction)createParty:(id)sender;

@end
