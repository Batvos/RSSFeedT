//
//  RSSFeedServiceImpl.m
//  RssReader
//
//  Created by Batvos on 20/06/2016.
//  Copyright © 2016 Batvos. All rights reserved.
//

#import "RSSFeedServiceImpl.h"
#import "CommonNetworkClient.h"
#import "RSSFeedServerResponseMapper.h"
#import "NetworkConstantsAndURLs.h"

@implementation RSSFeedServiceImpl

- (id)obtainRSSFeddFromCache {
    return nil;
}

- (void)updateRSSFeedUsingSuccessBlock:(SuccessBlock)success failure:(FailureBlock)failure {
    CommonNetworkClient *netClient = [[CommonNetworkClient alloc] init];
    NSURL *url = [NSURL URLWithString:LentaURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [netClient sendRequest:request completionBlock:^(NSData *data, NSError *error) {
        RSSFeedServerResponseMapper *mapper = [[RSSFeedServerResponseMapper alloc] init];
        __block NSArray *newsList = [mapper mapServerResponse:data error:nil];
        
        NSURL *url = [NSURL URLWithString:GazetaURL];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        [netClient sendRequest:request completionBlock:^(NSData *data, NSError *error) {
            RSSFeedServerResponseMapper *mapper = [[RSSFeedServerResponseMapper alloc] init];
            newsList = [newsList arrayByAddingObjectsFromArray:[mapper mapServerResponse:data error:nil]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                success(newsList);
            });
        }];
    }];
}


@end
