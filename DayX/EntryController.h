//
//  EntryController.h
//  DayX
//
//  Created by Roark on 7/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"
@interface EntryController : NSObject

@property (strong, nonatomic, readonly) NSArray *entries;

+ (EntryController *)sharedInstance;


- (void)save;


- (Entry *)createEntryWithTitle:(NSString *)title;

- (void)removeEntry:(Entry *)entry;

@end
