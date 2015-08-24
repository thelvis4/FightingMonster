//
//  FMFakeLoginView.h
//  FightingMonster
//
//  Created by Andrei Raifura on 8/20/15.
//  Copyright (c) 2015 YOPESO. All rights reserved.
//

#import "FMLoginView.h"

@interface FMFakeLoginView : FMLoginView
@property (nonatomic) BOOL isShowingFeedbackView;
@property (nonatomic) BOOL didShowPasswordError;
@property (nonatomic) BOOL didShowWrongUsernameOrPassword;
@property (nonatomic) BOOL didShowUnreachableService;
@property (nonatomic) BOOL didShowLoginSucceedMessage;

@end
