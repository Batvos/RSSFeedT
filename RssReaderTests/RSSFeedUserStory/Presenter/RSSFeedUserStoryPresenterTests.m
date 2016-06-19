//
//  RSSFeedUserStoryRSSFeedUserStoryPresenterTests.m
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RSSFeedUserStoryPresenter.h"

#import "RSSFeedUserStoryViewInput.h"
#import "RSSFeedUserStoryInteractorInput.h"
#import "RSSFeedUserStoryRouterInput.h"

@interface RSSFeedUserStoryPresenterTests : XCTestCase

@property (nonatomic, strong) RSSFeedUserStoryPresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation RSSFeedUserStoryPresenterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.presenter = [[RSSFeedUserStoryPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(RSSFeedUserStoryInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(RSSFeedUserStoryRouterInput));
    self.mockView = OCMProtocolMock(@protocol(RSSFeedUserStoryViewInput));

    self.presenter.interactor = self.mockInteractor;
    self.presenter.router = self.mockRouter;
    self.presenter.view = self.mockView;
}

- (void)tearDown {
    self.presenter = nil;

    self.mockView = nil;
    self.mockRouter = nil;
    self.mockInteractor = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов RSSFeedUserStoryModuleInput

#pragma mark - Тестирование методов RSSFeedUserStoryViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given

    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState:OCMOCK_ANY]);
    OCMVerify([self.mockInteractor obtainRSSFeed]);
    OCMVerify([self.mockInteractor updateRSSFeed]);
}

#pragma mark - Тестирование методов RSSFeedUserStoryInteractorOutput

- (void)testSuccessDidUpdateRSSFeed {
    // given
    NSArray *newsList = @[];
    
    // when
    [self.presenter didUpdateRSSFeed:newsList];
    
    // then
    OCMVerify([self.mockView updateNewsFeed:newsList]);
}

@end
