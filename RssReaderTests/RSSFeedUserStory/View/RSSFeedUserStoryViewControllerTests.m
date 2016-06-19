//
//  RSSFeedUserStoryRSSFeedUserStoryViewControllerTests.m
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RSSFeedUserStoryViewController.h"
#import "RSSFeedTableViewManger.h"
#import "RSSFeedUserStoryViewOutput.h"
#import "RSSNewsEntity.h"

@interface RSSFeedUserStoryViewControllerTests : XCTestCase

@property (nonatomic, strong) RSSFeedUserStoryViewController<RSSFeedTableViewMangerOutput> *controller;

@property (nonatomic, strong) id mockOutput;
@property (nonatomic, strong) id mockTableViewManger;
@property (nonatomic, strong) UITableView *mockUITableView;

@end

@implementation RSSFeedUserStoryViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.controller = [[RSSFeedUserStoryViewController<RSSFeedTableViewMangerOutput> alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(RSSFeedUserStoryViewOutput));
    self.mockTableViewManger = OCMClassMock([RSSFeedTableViewManger class]);
    self.mockUITableView = OCMClassMock([UITableView class]);
    
    self.controller.output = self.mockOutput;
    self.controller.delegateAndSource = self.mockTableViewManger;
    self.controller.tableView = self.mockUITableView;
}

- (void)tearDown {
    self.controller = nil;
    self.mockUITableView = nil;
    self.mockTableViewManger = nil;
    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование жизненного цикла

- (void)testThatControllerNotifiesPresenterOnDidLoad {
	// given

	// when
	[self.controller viewDidLoad];

	// then
	OCMVerify([self.mockOutput didTriggerViewReadyEvent]);
}

#pragma mark - Тестирование методов интерфейса

#pragma mark - Тестирование методов RSSFeedUserStoryViewInput

- (void)testSuccessSetupInitialState {
    // given
    NSArray *news = @[];
    
    id viewControllerPartialMock = OCMPartialMock(self.controller);
    
    // when
    [self.controller setupInitialState:news];
    
    // then
    OCMVerify([viewControllerPartialMock updateNewsFeed:news]);
    [viewControllerPartialMock stopMocking];
    viewControllerPartialMock = nil;
}

- (void)testSuccessUpdateNewsFeed {
    // given
    NSArray *news = @[];
    
    // when
    [self.controller updateNewsFeed:news];
    
    // then
    OCMVerify([self.mockTableViewManger updateTableViewWithNewsList:news]);
}

#pragma mark - Test RSSFeedTableViewMangerOutput methods

- (void)testSuccessDidUpdateTableView {
    // given
    
    // when
    [self.controller didUpdateTableView];
    
    // then
    OCMVerify([self.mockUITableView reloadData]);
}

- (void)testSuccesDidTapCellWithNews {
    // given
    RSSNewsEntity *news = [RSSNewsEntity new];
    
    // when
    [self.controller didTapCellWithNews:news];
    
    // then
    OCMVerify([self.mockOutput didTriggerTapCellWithNews:news]);
}

@end
