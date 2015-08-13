//
//  EntryController.m
//  DayX
//
//  Created by Roark on 7/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "EntryController.h"
#import "Stack.h"

@interface EntryController ()

@property (nonatomic, strong) NSArray *entries;

@end

static NSString *entriesKey = @"entriesKey";

@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
        sharedInstance.entries = [NSArray new];
        

    });
    return sharedInstance;
}


- (Entry *)createEntryWithTitle:(NSString *)title {
    Entry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    entry.title = title;
    
    return entry;
}


- (NSArray *)entries {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Entry"];
    // set predicate(s)
    // set sort descriptor(s)
    NSError *error;
    
    NSArray *allEntries = [[Stack sharedInstance].managedObjectContext executeFetchRequest:request error:&error];
    
    if (error) {
        NSLog(@"Error fetching objects : %@", error.localizedDescription);
    }
    return allEntries;
}


- (void)save {

    [[Stack sharedInstance].managedObjectContext save:nil];


}


- (void)removeEntry:(Entry *)entry {
    
    [entry.managedObjectContext deleteObject:entry];
}



@end

































