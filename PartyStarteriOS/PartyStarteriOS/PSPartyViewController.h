//
//  PSPartyViewController.h
//  PartyStarteriOS
//
//  Created by Sri Raghavan on 11/30/13.
//  Copyright (c) 2013 raman.mitra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSParty.h"

@interface PSPartyViewController : UIViewController

@property (nonatomic, strong) PSParty* party;

-(id)initWithParty:(PSParty *)party;

@end
