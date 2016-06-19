//
//  RSSFeedUserStoryRSSFeedUserStoryViewInput.h
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RSSFeedUserStoryViewInput <NSObject>

/**
 @author batvos

 Метод настраивает начальный стейт view
 @param Array of RSSNewsEntity.
 */
- (void)setupInitialState:(NSArray *)rssFeedNews;

/**
 * Method update news feed.
 * @param newsList Array of RSSNewsEntity.
 */
- (void)updateNewsFeed:(NSArray *)newsList;

@end
