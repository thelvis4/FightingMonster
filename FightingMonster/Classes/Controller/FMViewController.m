//
//  FMViewController.m
//  FightingMonster
//
//  Created by Andrei Raifura on 8/20/15.
//  Copyright (c) 2015 YOPESO. All rights reserved.
//

#import "FMViewController.h"
#import "FMLoginHandler.h"
#import "FMUser.h"
#import "FMLoginStorage.h"
#import "FMLoginView.h"

@interface FMViewController () <FMLoginViewDelegate>
@property (readonly) FMLoginView *loginView;

@property (strong, nonatomic) FMLoginHandler *loginHandler;
@property (strong, nonatomic) FMLoginStorage *loginStorage;

@end

@implementation FMViewController

+ (instancetype)instantiateWithLoginHandler:(FMLoginHandler *)handler
                               loginStorage:(FMLoginStorage *)storage {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    FMViewController *controller = [storyboard instantiateInitialViewController];
    controller.loginHandler = handler;
    controller.loginStorage = storage;
    
    return controller;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Login";
    
    self.loginView.delegate = self;
    
    FMLoginViewModel *model = [[FMLoginViewModel alloc] init];
    model.username = [self.loginStorage lastLogedUsername];
    model.password = @"";
    
    self.loginView.model = model;
}


- (FMLoginView *)loginView {
    return (FMLoginView *)self.view;
}


#pragma mark - FMLoginViewDelegate

- (void)didPressLoginInLoginView:(FMLoginView *)view {
    [self.loginView displayFeedbackView];
    [self doLogin];
}


#pragma mark - Private Methods

- (void)doLogin {
    FMLoginViewModel *model = self.loginView.model;
    
    [self.loginHandler logWithUserName:model.username
                          withPassword:model.password
                     succeedCompletion:^(FMUser *logedUser) {
                         [self didSuccesedWithUser:logedUser];
                     }
                        failCompletion:^(FMLoginError errorType) {
                            [self didFailLoginWithError:errorType];
                        }];
}


- (void)didFailLoginWithError:(FMLoginError)errorType {
    [self.loginView dismissFeedbackView];
    
    switch (errorType) {
        case FMLoginErrorServerUnreachable:
            [self.loginView showUnreachableService];
            break;
            
        case FMLoginErrorIncorrectUserOrPassword:
            [self.loginView showWrongUserNameOrPassword];
            break;
            
        case FMLoginErrorEmptyPassword:
            [self.loginView showPasswordError];
            break;
            
        default:
            break;
    }
}


- (void)didSuccesedWithUser:(FMUser *)user {
    [self.loginStorage setLastLoggedUsername:user.username];
    [self.loginView dismissFeedbackView];
    [self.loginView showLoginSucceed];
}

@end
