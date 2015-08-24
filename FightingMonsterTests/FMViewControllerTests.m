//
//  FMViewControllerTests.m
//  FightingMonster
//
//  Created by Andrei Raifura on 8/20/15.
//  Copyright (c) 2015 YOPESO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "OCMock.h"
#import "FMViewController.h"
#import "FMFakeLoginHandler.h"
#import "FMLoginStorage.h"
#import "FMFakeLoginView.h"

static NSString *const FMTestUsername = @"masika_povidla"; //:D

@interface FMViewControllerTests : XCTestCase
@property (strong, nonatomic) FMViewController *viewController;

@property (strong, nonatomic) FMFakeLoginHandler *fakeHandler;
@property (strong, nonatomic) FMLoginStorage *fakeStorage;

@end

@implementation FMViewControllerTests

- (void)setUp {
    [super setUp];
    
    _fakeHandler = [[FMFakeLoginHandler alloc] init];
    _fakeStorage = OCMClassMock([FMLoginStorage class]);
    
    _viewController = [[FMViewController alloc] initWithLoginHandler:_fakeHandler
                                                        loginStorage:_fakeStorage];
}

- (void)tearDown {
    _fakeHandler = nil;
    _fakeStorage = nil;
    
    [super tearDown];
}

- (void)testViewIsALoginView {
    //When
    UIView *view = self.viewController.view;
    
    //Then
    XCTAssert([view isKindOfClass:[FMLoginView class]]);
}

- (void)testWhenViewDidLoadSetsViewModel {
    //When
    FMFakeLoginView *view = [self injectViewAndCallViewDidLoad];
    
    //Then
    XCTAssertNotNil(view.model);
}

- (void)testWhenViewDidLoadSetsLastUserName {
    //Given
    OCMStub([_fakeStorage lastLogedUsername]).andReturn(FMTestUsername);

    //When
    FMFakeLoginView *view = [self injectViewAndCallViewDidLoad];
    
    //Then
    XCTAssertEqualObjects(view.model.username, FMTestUsername);
}

- (void)testTapOnLoginShowsUserFeedback {
    //Given
    FMFakeLoginView *view = [self injectViewAndCallViewDidLoad];
    [self setUsername:FMTestUsername password:@"LongPassword" toView:view];
    
    //When
    [view.delegate didPressLoginInLoginView:view];
    
    //Then
    XCTAssert(view.isShowingFeedbackView);
}

- (void)testTapOnLoginCallsLoginHandler {
    //Given
    NSString *password = @"LongPassword";
    FMFakeLoginView *view = [self injectViewAndCallViewDidLoad];
    [self setUsername:FMTestUsername password:@"LongPassword" toView:view];
    
    //When
    [view.delegate didPressLoginInLoginView:view];
    
    //Then
    XCTAssertEqualObjects(_fakeHandler.username, FMTestUsername);
    XCTAssertEqualObjects(_fakeHandler.password, password);
}

- (void)testSavesUsernameWhenLoginEndsWithCorectLogin {
    //Given
    FMFakeLoginView *view = [self injectViewAndCallViewDidLoad];
    [self setUsername:FMLoginCorrectUsername password:FMLoginCorrectPassword toView:view];
    [view.delegate didPressLoginInLoginView:view];
    
    //When
    [_fakeHandler simulateLoginEnd];
    
    //Then
    OCMVerify([_fakeStorage setLastLoggedUsername:FMLoginCorrectUsername]);
}

- (void)testDismissFeedbackViewWhenLoginEndsWithCorectLogin {
    //Given
    FMFakeLoginView *view = [self injectViewAndCallViewDidLoad];
    [self setUsername:FMLoginCorrectUsername password:FMLoginCorrectPassword toView:view];
    [view.delegate didPressLoginInLoginView:view];
    
    //When
    [_fakeHandler simulateLoginEnd];
    
    //Then
    XCTAssertFalse(view.isShowingFeedbackView);
}

- (void)testDismissFeedbackViewWhenLoginEndsWithWrongPassword {
    //Given
    FMFakeLoginView *view = [self injectViewAndCallViewDidLoad];
    [self setUsername:FMLoginCorrectUsername password:@"WrongPass" toView:view];
    [view.delegate didPressLoginInLoginView:view];
    
    //When
    [_fakeHandler simulateLoginEnd];
    
    //Then
    XCTAssertFalse(view.isShowingFeedbackView);
}

- (void)testShowsLoginSucceedWhenLoginEndsSuccessfuly {
    //Given
    FMFakeLoginView *view = [self injectViewAndCallViewDidLoad];
    [self setUsername:FMLoginCorrectUsername password:FMLoginCorrectPassword toView:view];
    [view.delegate didPressLoginInLoginView:view];
    
    //When
    [_fakeHandler simulateLoginEnd];
    
    //Then
    XCTAssert(view.didShowLoginSucceedMessage);
}


- (void)testShowsUnreachableMessageWhenLoginEndsWithUnreachableError {
    //Given
    FMFakeLoginView *view = [self injectViewAndCallViewDidLoad];
    [self setUsername:FMLoginUnreachableUsername password:FMLoginCorrectPassword toView:view];
    [view.delegate didPressLoginInLoginView:view];
    
    //When
    [_fakeHandler simulateLoginEnd];
    
    //Then
    XCTAssert(view.didShowUnreachableService);
}


- (void)testShowsWrongUsernameWhenLoginEndsWithWrongUsernameOrPassword {
    //Given
    FMFakeLoginView *view = [self injectViewAndCallViewDidLoad];
    [self setUsername:FMTestUsername password:@"WrongPass" toView:view];
    [view.delegate didPressLoginInLoginView:view];
    
    //When
    [_fakeHandler simulateLoginEnd];
    
    //Then
    XCTAssert(view.didShowWrongUsernameOrPassword);
}

- (void)testShowsShortPasswordError {
    //Given
    FMFakeLoginView *view = [self injectViewAndCallViewDidLoad];
    [self setUsername:FMTestUsername password:@"" toView:view];
    [view.delegate didPressLoginInLoginView:view];
    
    //When
    [_fakeHandler simulateLoginEnd];
    
    //Then
    XCTAssert(view.didShowPasswordError);
}


#pragma mark - Private Methods

- (FMFakeLoginView *)injectViewAndCallViewDidLoad {
    FMFakeLoginView *view = [[FMFakeLoginView alloc] init];
    self.viewController.view = view;
    [self.viewController viewDidLoad];
    
    return view;
}

- (void)setUsername:(NSString *)username
           password:(NSString *)password
             toView:(FMFakeLoginView *)view {
    FMLoginViewModel *model = [[FMLoginViewModel alloc] init];
    model.username = username;
    model.password = password;
    view.model = model;
}

@end
