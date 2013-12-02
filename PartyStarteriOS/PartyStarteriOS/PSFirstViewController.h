//
//  PSFirstViewController.h
//  PartyStarteriOS
//
//  Created by Mitra Raman on 11/25/13.
//  Copyright (c) 2013 raman.mitra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSFirstViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *eventName;
@property (strong, nonatomic) IBOutlet UITextField *location;
@property (strong, nonatomic) IBOutlet UIDatePicker *dateTimePicker;
@property (strong, nonatomic) IBOutlet UITextField *totalCost;
@property (strong, nonatomic) IBOutlet UITextField *minDonation;
@property (strong, nonatomic) IBOutlet UITextView *description;
@property (strong, nonatomic) IBOutlet UIView *datePickerPopup;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UIButton *chooseDate;
@property (strong, nonatomic) IBOutlet UIButton *selectDate;
@property (strong, nonatomic) IBOutlet UIButton *editDate;
@property (strong, nonatomic) IBOutlet UIButton *closePopup;

- (IBAction)createParty:(id)sender;
- (IBAction)chooseDate:(id)sender;
- (IBAction)dateSelected:(id)sender;
- (IBAction)closePopup:(id)sender;
- (IBAction)editDate:(id)sender;

@end
