//
//  FMLoginHandler.h
//  FightingMonster
//
//  Created by Andrei Raifura on 8/20/15.
//  Copyright (c) 2015 YOPESO. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FMUser;

typedef enum : NSUInteger {
    FMLoginErrorEmptyPassword,
    FMLoginErrorIncorrectUserOrPassword,
    FMLoginErrorServerUnreachable,
} FMLoginError;

typedef void(^FMLoginSucceedCompletion)(FMUser *logedUser);
typedef void(^FMLoginFailCompletion)(FMLoginError error);

@interface FMLoginHandler : NSObject
- (void)logWithUserName:(NSString *)user
           withPassword:(NSString *)password
      succeedCompletion:(FMLoginSucceedCompletion)succeedCompletion
         failCompletion:(FMLoginFailCompletion)failCompletion;

@end
