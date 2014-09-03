//
//  AppDelegate.m
//  Date Calculator
//
//  Created by James Snee on 3/09/2014.
//  Copyright (c) 2014 James Snee. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

NSDate *startDate;
NSDate *endDate;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"EEE, MMM d, yyyy"];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    
    NSDate *today = [NSDate date];
    NSString *dateString = [formatter stringFromDate:today];
    NSLog(@"Today's date is %@", dateString);
    //set datepickers dates to today
    self.startDate.dateValue = [NSDate date];
    self.endDate.dateValue = [NSDate date];
    
    //start date initial
    startDate = self.startDate.dateValue;
    NSString *startDateString = [formatter stringFromDate:self.startDate.dateValue];
    NSLog(@"Start date is now %@", startDateString);
    //end date initial
    endDate = self.endDate.dateValue;
    NSString *endDateString = [formatter stringFromDate:self.endDate.dateValue];
    NSLog(@"End date is now %@", endDateString);
    
    

}
// handles closing from the red button on the window
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
    return YES;
}


- (IBAction)didChangeStartDate:(NSDatePicker *)sender {
    
    //whenever this is changed it will set the date startDate
    startDate = self.startDate.dateValue;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"EEE, MMM d, yyyy"];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    NSString *startDateString = [formatter stringFromDate:self.startDate.dateValue];
    NSLog(@"Start date is now %@", startDateString);
    
}

- (IBAction)didChangeEndDate:(NSDatePicker *)sender {
    
    //whenever this is changed it will set the date endDate
    endDate = self.endDate.dateValue;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"EEE, MMM d, yyyy"];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    NSString *endDateString = [formatter stringFromDate:self.endDate.dateValue];
    NSLog(@"End date is now %@", endDateString);
    
}

- (IBAction)calculateDifference:(NSButton *)sender {
    
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned int day = NSDayCalendarUnit;
    NSDateComponents *components = [calendar components:day fromDate:startDate toDate:endDate options:0];
    unsigned int numOfDays = [components day];
    NSString *resultString = [NSString stringWithFormat:@"Number of days difference is %i", numOfDays];
    NSLog(resultString);
    //set the textfield with information
    [_resultsField setStringValue:resultString];
    
    
}
@end
