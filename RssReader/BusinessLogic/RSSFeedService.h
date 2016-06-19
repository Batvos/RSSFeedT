//
//  RSSFeedService.h
//  RssReader
//
//  Created by Batvos on 19/06/2016.
//  Copyright © 2016 Batvos. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessBlock)(id data);
typedef void (^FailureBlock)(NSError *error);

/**
 * The service used to obtain from cache or update from server rss feed.
 */
@protocol RSSFeedService <NSObject>

/**
 * Method to obtain RSS feed from cache.
 * @return RSS feed object.
 */
- (id)obtainRSSFeddFromCache;

/**
 * Method to update RSS feed from server.
 * @param Success block called in case of success with RSSFeed object as argument.
 * @param Failure block called in case of error.
 */
- (void)updateRSSFeedUsingSuccessBlock:(SuccessBlock)success failure:(FailureBlock)failure;

@end
