//
//  FTBeaconHistoryView.h
//  iBeacon
//
//  Created by Lucius Kwok on 9/28/13.
//  Copyright (c) 2013 Felt Tip Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface FTBeaconHistoryView : UIView

@property (strong, nonatomic) NSMutableArray *data; // array of FTBeaconData

- (void)addDataPointWithBeacon:(CLBeacon *)beacon;
- (void)addDataPointWithProximity:(CLProximity)proximity rssi:(NSInteger)rssi;

@end
