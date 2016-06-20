//
//  CommonNetworkClient.m
//  RssReader
//
//  Created by Batvos on 20/06/2016.
//  Copyright © 2016 Batvos. All rights reserved.
//

#import "CommonNetworkClient.h"

@interface CommonNetworkClient ()

@property (nonatomic, strong) NSURLSession *session;

@end

@implementation CommonNetworkClient

- (NSURLSession *)session {
    if (!_session) {
        _session = [NSURLSession sharedSession];
    }
    return _session;
}

- (void)sendRequest:(NSURLRequest *)request completionBlock:(NetworkCompletionBlock)completionBlock {
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (completionBlock) {
            completionBlock(data, error);
        }
    }];
    [dataTask resume];
}

@end
