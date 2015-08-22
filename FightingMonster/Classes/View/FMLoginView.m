//
//  FMLoginView.m
//  FightingMonster
//
//  Created by Andrei Raifura on 8/20/15.
//  Copyright (c) 2015 YOPESO. All rights reserved.
//

#import "FMLoginView.h"

@interface FMLoginView ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIView *feedbackView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation FMLoginView

- (void)setModel:(FMLoginViewModel *)model {
    if (_model != model) {
        _model = model;
        
        self.usernameTextField.text = model.username;
    }
}


#pragma mark - Actions

- (IBAction)logIn:(UIButton *)sender {
    [self assignCredentialsToModel];
    [self.delegate didPressLoginInLoginView:self];
}


#pragma mark - FeedbackView

- (void)displayFeedbackView {
    [self.feedbackView setHidden:NO];
    [self.activityIndicator startAnimating];
}


- (void)dismissFeedbackView {
    [self.activityIndicator stopAnimating];
    [self.feedbackView setHidden:YES];
}


#pragma mark - Other Private Methods

- (void)assignCredentialsToModel {
    [self.model setUsername:self.usernameTextField.text];
    [self.model setPassword:self.passwordTextField.text];
}


- (void)showPasswordError {
    [self showAlertWithTitle:@"Password Error" message:@"Password is too short!"];
}


- (void)showWrongUserNameOrPassword {
    [self showAlertWithTitle:@"Login error" message:@"Incorrect username or password"];
}


- (void)showUnreachableService {
    [self showAlertWithTitle:@"Service error" message:@"Service Unreachable"];
}


- (void)showLoginSucceed {
    [self showAlertWithTitle:@"Congratulations" message:@"Login Succeed!"];
}


- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];
}

@end


@implementation FMLoginViewModel
- (instancetype)init {
    self = [super init];
    if (self) {
        _username = @"";
        _password = @"";
    }
    
    return self;
}

@end
