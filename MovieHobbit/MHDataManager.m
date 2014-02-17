//
//  MHDataManager.m
//  MovieHobbit
//
//  Created by willsborKang on 14/2/17.
//  Copyright (c) 2014年 thinkermobile. All rights reserved.
//

#import "MHDataManager.h"
#import <TMGeneral/TMDataManager+Protected.h>

@implementation MHDataManager

static MHDataManager *sharedInstance;
+ (instancetype)sharedInstance
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		
		sharedInstance = [[MHDataManager alloc] initWithDatabaseFilename:nil];
	});
	
	return sharedInstance;
}

- (NSString *)managedObjectModelName
{
    return [super managedObjectModelName];
}

- (void) updateMovieItem:(NSArray *)aDatas
{
    [self executeBlock:^{
        
        NSInteger i = 0;
        for (NSDictionary *data in aDatas) {
            MovieItem *item = [self _deqOneItem:@"MovieItem" ByPred:([NSPredicate predicateWithFormat:@"identify == %@", data[@"id"]])];
            
            item.identify = data[@"id"];
            item.title = data[@"title"];
            item.rating = data[@"rating"];
            item.poster = data[@"poster"][@"urls"][@"original"];
            item.year = data[@"year"];
            item.sort = @(i++);
        }
        
    }];
}


@end
