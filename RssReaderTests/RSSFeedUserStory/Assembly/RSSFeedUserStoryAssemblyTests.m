//
//  RSSFeedUserStoryRSSFeedUserStoryAssemblyTests.m
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import <RamblerTyphoonUtils/AssemblyTesting.h>
#import <Typhoon/Typhoon.h>

#import "RSSFeedUserStoryAssembly.h"
#import "RSSFeedUserStoryAssembly_Testable.h"

#import "RSSFeedUserStoryViewController.h"
#import "RSSFeedUserStoryPresenter.h"
#import "RSSFeedUserStoryInteractor.h"
#import "RSSFeedUserStoryRouter.h"

@interface RSSFeedUserStoryAssemblyTests : RamblerTyphoonAssemblyTests

@property (nonatomic, strong) RSSFeedUserStoryAssembly *assembly;

@end

@implementation RSSFeedUserStoryAssemblyTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.assembly = [[RSSFeedUserStoryAssembly alloc] init];
    [self.assembly activate];
}

- (void)tearDown {
    self.assembly = nil;

    [super tearDown];
}

#pragma mark - Тестирование создания элементов модуля

- (void)testThatAssemblyCreatesViewController {
    // given
    Class targetClass = [RSSFeedUserStoryViewController class];
    NSArray *protocols = @[
                           @protocol(RSSFeedUserStoryViewInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];

    // when
    id result = [self.assembly viewRSSFeedUserStoryModule];

    // then
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesPresenter {
    // given
    Class targetClass = [RSSFeedUserStoryPresenter class];
    NSArray *protocols = @[
                           @protocol(RSSFeedUserStoryModuleInput),
                           @protocol(RSSFeedUserStoryViewOutput),
                           @protocol(RSSFeedUserStoryInteractorOutput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(interactor),
                              RamblerSelector(view),
                              RamblerSelector(router)
                              ];

    // when
    id result = [self.assembly presenterRSSFeedUserStoryModule];

    // then
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesInteractor {
    // given
    Class targetClass = [RSSFeedUserStoryInteractor class];
    NSArray *protocols = @[
                           @protocol(RSSFeedUserStoryInteractorInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];

    // when
    id result = [self.assembly interactorRSSFeedUserStoryModule];

    // then
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesRouter {
    // given
    Class targetClass = [RSSFeedUserStoryRouter class];
    NSArray *protocols = @[
                           @protocol(RSSFeedUserStoryRouterInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(transitionHandler)
                              ];

    // when
    id result = [self.assembly routerRSSFeedUserStoryModule];

    // then
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

@end
