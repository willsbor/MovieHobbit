//
//  MHGlobalVar.m
//  MovieHobbit
//
//  Created by willsborKang on 14/2/17.
//  Copyright (c) 2014年 thinkermobile. All rights reserved.
//

#import "MHGlobalVar.h"
#import <AFNetworking/AFNetworking.h>

#import "MHDataManager.h"

@interface MHGlobalVar ()
@property (nonatomic, strong) AFHTTPClient *httpClient;
@end

@implementation MHGlobalVar

+ (instancetype) sharedInstance
{
	static dispatch_once_t onceToken;
    static MHGlobalVar *sharedInstance;
	dispatch_once(&onceToken, ^{
		
		sharedInstance = [[MHGlobalVar alloc] init];
	});
	
	return sharedInstance;
}

- (AFHTTPClient *) httpClient
{
    if (_httpClient) {
        return _httpClient;
    }
    
    _httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://api.movies.io"]];
    
    return _httpClient;
}


- (void) apiMovieHobbitComplete:(void (^)(NSError *error))aCompleteBlock
{
    
    NSMutableURLRequest *request = [self.httpClient requestWithMethod:@"GET"
                                                                 path:@"/movies/search"
                                                           parameters:@{@"q": @"hobbit"}];
    
    
    AFHTTPRequestOperation *op = [self.httpClient HTTPRequestOperationWithRequest:request
                                                                          success:
                                  ^(AFHTTPRequestOperation *operation, id responseObject) {
                                      
                                      LOG_NETWORK(1, @"response HEADER %@", operation.response.allHeaderFields);
                                      
                                      LOG_NETWORK(1, @"responseObject class = %@", NSStringFromClass([responseObject class]));
                                      if (responseObject) {
                                          id dicOrArray = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
                                          LOG_NETWORK(1, @"api scheme[%@] Result[%@] = %@", @"/movies/search", NSStringFromClass([dicOrArray class]), dicOrArray);
                                          
                                          [[MHDataManager sharedInstance] updateMovieItem:dicOrArray[@"movies"]];
                                          
                                          aCompleteBlock(nil);
                                      }
                                      
                                  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                      LOG_NETWORK(1, @"api scheme[%@] error = %@", @"/movies/search", error );
                                      
//                                      NSError *err = [self serverErrcodeBy:scheme And:error Body:operation.responseData StatusCode:operation.response.statusCode];
                                      aCompleteBlock(error);
                                  }];
    
    LOG_NETWORK(1, @"op.url = %@", op.request.URL.absoluteString);
    
    [op start];
}

@end
