//
//  Entry.h
//  DayX
//
//  Created by Roark on 8/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Entry : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * bodyText;
@property (nonatomic, retain) NSDate * saveDate;
@property (nonatomic, retain) NSDate * createdDate;

@end
