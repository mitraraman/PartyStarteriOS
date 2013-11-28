//
//  PSPartyTableViewCell.h
//  PartyStarteriOS
//
//  Created by Sri Raghavan on 11/28/13.
//  Copyright (c) 2013 raman.mitra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSPartyTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *donationTargetLabel;
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;

@end