//
//  MHGlobalVar.h
//  MovieHobbit
//
//  Created by willsborKang on 14/2/17.
//  Copyright (c) 2014年 thinkermobile. All rights reserved.
//

#import "TMGlobalModel.h"

@interface MHGlobalVar : TMGlobalModel

+ (instancetype) sharedInstance;

- (void) apiMovieHobbitComplete:(void (^)(NSError *error))aCompleteBlock;

@end
