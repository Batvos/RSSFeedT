//
//  RSSFeedUserStoryRSSFeedUserStoryRouterTests.m
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RSSFeedUserStoryRouter.h"

@interface RSSFeedUserStoryRouterTests : XCTestCase

@property (nonatomic, strong) RSSFeedUserStoryRouter *router;

@end

@implementation RSSFeedUserStoryRouterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.router = [[RSSFeedUserStoryRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end
