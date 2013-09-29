//
//  FTBeaconHistoryView.m
//  iBeacon
//
//  Created by Lucius Kwok on 9/28/13.
//  Copyright (c) 2013 Felt Tip Inc. All rights reserved.
//

#import "FTBeaconHistoryView.h"
#import "FTBeaconDataPoint.h"


@implementation FTBeaconHistoryView

- (void)awakeFromNib
{
	self.data = [NSMutableArray array];
}

- (void)drawRect:(CGRect)rect
{
	CGFloat width = self.bounds.size.width;
	CGFloat height = self.bounds.size.height;
	CGFloat steps = 128.0;
	CGFloat xStep = width / steps;
	
	// Draw line at bottom
	[[UIColor blackColor] set];
	UIBezierPath *bottomLine = [UIBezierPath bezierPathWithRect:CGRectMake(0, height - 0.5, width, 0.5)];
	[bottomLine fill];
	
	CGFloat x = width - self.data.count * xStep;
	UIBezierPath *dataPath = [UIBezierPath bezierPath];
	BOOL firstPoint = YES;
	CGFloat kRangeMinimum = -90;
	CGFloat kRangeMaximum = -30;
	CGFloat kRangeWidth = kRangeMaximum - kRangeMinimum;
	for (FTBeaconDataPoint *dataPoint in self.data) {
		CGFloat yUnscaled = (dataPoint.rssi - kRangeMinimum) / kRangeWidth;
		CGFloat y = height * (1.0 - yUnscaled);
		x += xStep;
		
		if (firstPoint) {
			[dataPath moveToPoint:CGPointMake(x, y)];
			firstPoint = NO;
		} else {
			[dataPath addLineToPoint:CGPointMake(x, y)];
		}
	}
	[dataPath setLineCapStyle:kCGLineCapRound];
	[dataPath setLineJoinStyle:kCGLineJoinRound];
	[dataPath setLineWidth:2.0];
	[dataPath stroke];
}

- (void)addDataPointWithBeacon:(CLBeacon *)beacon
{
	FTBeaconDataPoint *previousDataPoint = [self.data lastObject];
	if (beacon.proximity == CLProximityUnknown) {
		[self addDataPointWithProximity:CLProximityUnknown rssi:previousDataPoint.rssi];
	} else {
		[self addDataPointWithProximity:beacon.proximity rssi:beacon.rssi];
	}
}

- (void)addDataPointWithProximity:(CLProximity)proximity rssi:(NSInteger)rssi
{
	FTBeaconDataPoint *dataPoint = [[FTBeaconDataPoint alloc] init];
	dataPoint.proxmity = proximity;
	dataPoint.rssi = rssi;
	[self.data addObject:dataPoint];
	if (self.data.count > 128)
		[self.data removeObjectAtIndex:0];
	[self setNeedsDisplay];
}

@end
