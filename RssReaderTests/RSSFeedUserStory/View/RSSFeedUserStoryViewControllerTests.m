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

#import "RSSFeedUserStoryViewOutput.h"

@interface RSSFeedUserStoryViewControllerTests : XCTestCase

@property (nonatomic, strong) RSSFeedUserStoryViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation RSSFeedUserStoryViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.controller = [[RSSFeedUserStoryViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(RSSFeedUserStoryViewOutput));

    self.controller.output = self.mockOutput;
}

- (void)tearDown {
    self.controller = nil;

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

@end
