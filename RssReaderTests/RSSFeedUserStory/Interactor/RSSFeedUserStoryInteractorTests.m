//
//  RSSFeedUserStoryRSSFeedUserStoryInteractorTests.m
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RSSFeedUserStoryInteractor.h"

#import "RSSFeedUserStoryInteractorOutput.h"

@interface RSSFeedUserStoryInteractorTests : XCTestCase

@property (nonatomic, strong) RSSFeedUserStoryInteractor *interactor;

@property (nonatomic, strong) id mockOutput;

@end

@implementation RSSFeedUserStoryInteractorTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.interactor = [[RSSFeedUserStoryInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(RSSFeedUserStoryInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов RSSFeedUserStoryInteractorInput

@end
