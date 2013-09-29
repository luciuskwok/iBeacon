//
//  FTBeaconDataPoint.h
//  iBeacon
//
//  Created by Lucius Kwok on 9/28/13.
//  Copyright (c) 2013 Felt Tip Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@interface FTBeaconDataPoint : NSObject
@property (assign, nonatomic) CLProximity proxmity;
@property (assign, nonatomic) NSInteger rssi;
@end
