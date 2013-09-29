//
//  FTViewController.h
//  iBeacon
//
//  Created by Lucius Kwok on 9/28/13.
//  Copyright (c) 2013 Felt Tip Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "FTBeaconHistoryView.h"


@interface FTViewController : UIViewController
<CLLocationManagerDelegate>


@property (strong, nonatomic) IBOutlet UILabel *beaconAInfoLabel;
@property (strong, nonatomic) IBOutlet UILabel *beaconBInfoLabel;
@property (strong, nonatomic) IBOutlet UILabel *beaconCInfoLabel;
@property (strong, nonatomic) IBOutlet UILabel *beaconDInfoLabel;

@property (strong, nonatomic) IBOutlet FTBeaconHistoryView *beaconAHistory;
@property (strong, nonatomic) IBOutlet FTBeaconHistoryView *beaconBHistory;
@property (strong, nonatomic) IBOutlet FTBeaconHistoryView *beaconCHistory;
@property (strong, nonatomic) IBOutlet FTBeaconHistoryView *beaconDHistory;

@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) CLBeaconRegion *region;

@end
