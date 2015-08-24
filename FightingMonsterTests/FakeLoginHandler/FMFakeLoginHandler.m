//
//  FMFakeLoginHandler.m
//  FightingMonster
//
//  Created by Andrei Raifura on 8/20/15.
//  Copyright (c) 2015 YOPESO. All rights reserved.
//

#import "FMFakeLoginHandler.h"
#import "FMUser.h"

@interface FMFakeLoginHandler ()
@property (copy, nonatomic) void(^loginEndCompletionBlock)();

@end

@implementation FMFakeLoginHandler

- (void)logWithUserName:(NSString *)username withPassword:(NSString *)password
      succeedCompletion:(FMLoginSucceedCompletion)succeedCompletion
         failCompletion:(FMLoginFailCompletion)failCompletion {
    _username = username;
    _password = password;
    
    self.loginEndCompletionBlock = ^(){
        if (password.length == 0) {
            failCompletion(FMLoginErrorEmptyPassword);
        }
        
        if ([username isEqualToString:FMLoginCorrectUsername] &&
            [password isEqualToString:FMLoginCorrectPassword]) {
            FMUser *user = [[FMUser alloc] initWithUserName:username];
            succeedCompletion(user);
        } else if ([username isEqualToString:FMLoginUnreachableUsername]) {
            failCompletion(FMLoginErrorServerUnreachable);
        } else {
            failCompletion(FMLoginErrorIncorrectUserOrPassword);
        }
    };
}


- (void)simulateLoginEnd {
    self.loginEndCompletionBlock();
}

@end
