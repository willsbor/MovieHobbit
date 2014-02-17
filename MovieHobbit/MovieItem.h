//
//  MovieItem.h
//  MovieHobbit
//
//  Created by willsborKang on 14/2/17.
//  Copyright (c) 2014年 thinkermobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MovieItem : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * year;
@property (nonatomic, retain) NSString * rating;
@property (nonatomic, retain) NSString * poster;
@property (nonatomic, retain) NSString * identify;
@property (nonatomic, retain) NSNumber * sort;

@end
