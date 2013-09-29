//
//  FTViewController.m
//  iBeacon
//
//  Created by Lucius Kwok on 9/28/13.
//  Copyright (c) 2013 Felt Tip Inc. All rights reserved.
//

#import "FTViewController.h"


@implementation FTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.locationManager = [CLLocationManager new];
    self.locationManager.delegate = self;
	
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"E2C56DB5-DFFB-48D2-B060-D0F5A71096E0"];
    self.region = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:uuid.UUIDString];
    [self.locationManager startRangingBeaconsInRegion:self.region];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    for (CLBeacon *beacon in beacons) {
		
		if ([beacon.major integerValue] == 9) {
			UILabel *infoLabel = nil;
			FTBeaconHistoryView *historyView = nil;
			switch ([beacon.minor integerValue]) {
				case 1:
					infoLabel = self.beaconAInfoLabel;
					historyView = self.beaconAHistory;
					break;
				case 3:
					infoLabel = self.beaconBInfoLabel;
					historyView = self.beaconBHistory;
					break;
				case 5:
					infoLabel = self.beaconCInfoLabel;
					historyView = self.beaconCHistory;
					break;
				case 7:
					infoLabel = self.beaconDInfoLabel;
					historyView = self.beaconDHistory;
					break;
				default:
					break;
			}
			
			// Update graph
			[historyView addDataPointWithBeacon:beacon];
			
			// Update label
			if (beacon.proximity != CLProximityUnknown) {
				NSString *proxString = @"";
				if (beacon.proximity == CLProximityFar)
					proxString = @"Far";
				else if (beacon.proximity == CLProximityNear)
					proxString = @"Near";
				else if (beacon.proximity == CLProximityImmediate)
					proxString = @"Immediate";
				
				NSString *statusText = [NSString stringWithFormat:@"%@, RSSI=%ld", proxString, (long)beacon.rssi];
				infoLabel.text = statusText;
				NSLog(@"Beacon %@.%@: %@", beacon.major, beacon.minor, statusText);
			}
		}
	}
}


@end
