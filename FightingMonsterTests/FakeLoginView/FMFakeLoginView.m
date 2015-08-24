//
//  FMFakeLoginView.m
//  FightingMonster
//
//  Created by Andrei Raifura on 8/20/15.
//  Copyright (c) 2015 YOPESO. All rights reserved.
//

#import "FMFakeLoginView.h"

@implementation FMFakeLoginView

- (void)displayFeedbackView {
    self.isShowingFeedbackView = YES;
}

- (void)dismissFeedbackView {
    self.isShowingFeedbackView = NO;
}

- (void)showPasswordError {
    self.didShowPasswordError = YES;
}

- (void)showWrongUserNameOrPassword {
    self.didShowWrongUsernameOrPassword = YES;
}

- (void)showUnreachableService {
    self.didShowUnreachableService = YES;
}

- (void)showLoginSucceed {
    self.didShowLoginSucceedMessage = YES;
}

@end
