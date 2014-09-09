//
//  AppDelegate.h
//  Date Calculator
//
//  Created by James Snee on 3/09/2014.
//  Copyright (c) 2014 James Snee. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSDatePicker *startDate;
@property (strong) IBOutlet NSDatePicker *endDate;
@property (strong) IBOutlet NSTextField *resultsField;

- (IBAction)clearResults:(NSButton *)sender;

- (IBAction)didChangeStartDate:(NSDatePicker *)sender;
- (IBAction)didChangeEndDate:(NSDatePicker *)sender;

- (IBAction)calculateDifference:(NSButton *)sender;

@end
