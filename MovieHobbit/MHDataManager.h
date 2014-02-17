//
//  MHDataManager.h
//  MovieHobbit
//
//  Created by willsborKang on 14/2/17.
//  Copyright (c) 2014年 thinkermobile. All rights reserved.
//

#import "TMDataManager.h"
#import "MovieItem.h"

@interface MHDataManager : TMDataManager

+ (instancetype)sharedInstance;

- (void) updateMovieItem:(NSArray *)aDatas;

@end
