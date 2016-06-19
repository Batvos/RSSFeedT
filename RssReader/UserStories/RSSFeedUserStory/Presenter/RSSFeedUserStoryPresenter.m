//
//  RSSFeedUserStoryRSSFeedUserStoryPresenter.m
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import "RSSFeedUserStoryPresenter.h"

#import "RSSFeedUserStoryViewInput.h"
#import "RSSFeedUserStoryInteractorInput.h"
#import "RSSFeedUserStoryRouterInput.h"

@implementation RSSFeedUserStoryPresenter

#pragma mark - Методы RSSFeedUserStoryModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы RSSFeedUserStoryViewOutput

- (void)didTriggerViewReadyEvent {
    NSArray *rssNewsList = [self.interactor obtainRSSFeed];
    [self.interactor updateRSSFeed];
    [self.view setupInitialState:rssNewsList];
}

#pragma mark - Методы RSSFeedUserStoryInteractorOutput

- (void)didUpdateRSSFeed:(NSArray *)newsList {
    [self.view updateNewsFeed:newsList];
}

@end
