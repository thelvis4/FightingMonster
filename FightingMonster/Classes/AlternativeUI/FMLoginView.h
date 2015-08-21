//
//  FMLoginView.h
//  FightingMonster
//
//  Created by Andrei Raifura on 8/20/15.
//  Copyright (c) 2015 YOPESO. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FMLoginViewModel;
@protocol FMLoginViewDelegate;

@interface FMLoginView : UIView
@property (weak, nonatomic) id<FMLoginViewDelegate> delegate;
@property (strong, nonatomic) FMLoginViewModel *model;


- (void)displayFeedbackView;
- (void)dismissFeedbackView;

- (void)showPasswordError;
- (void)showWrongUserNameOrPassword;
- (void)showUnreachableService;
- (void)showLoginSucceed;

@end

@protocol FMLoginViewDelegate <NSObject>
- (void)didPressLoginInLoginView:(FMLoginView *)view;

@end

@interface FMLoginViewModel : NSObject
@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *password;

@end
