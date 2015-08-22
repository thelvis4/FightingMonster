//
//  FMLoginHandler.m
//  FightingMonster
//
//  Created by Andrei Raifura on 8/20/15.
//  Copyright (c) 2015 YOPESO. All rights reserved.
//

#import "FMLoginHandler.h"
#import "FMUser.h"

@implementation FMLoginHandler

- (void)logWithUserName:(NSString *)user
           withPassword:(NSString *)password
      succeedCompletion:(FMLoginSucceedCompletion)succeedCompletion
         failCompletion:(FMLoginFailCompletion)failCompletion {
    if (password.length == 0) {
        [self failDueToEmptyPasswordWithCompletion:failCompletion];
    }

    switch (arc4random() % 3) {
        case 0:
            [self loginSuccedWithUsername:user completionBlock:succeedCompletion];
            break;
        case 1:
            [self failDueToUnreachableServerWithCompletion:failCompletion];
            break;
        case 2:
            [self failDueToWrongUsernameOrPasswordWithCompletion:failCompletion];
            break;
        default:
            break;
    }
}


- (void)loginSuccedWithUsername:(NSString *)username completionBlock:(FMLoginSucceedCompletion)succeedCompletion {
    [self dispatchLater:^{
        FMUser *user = [[FMUser alloc] initWithUserName:username];
        succeedCompletion(user);
    }];
}


- (void)failDueToEmptyPasswordWithCompletion:(FMLoginFailCompletion)failCompletion {
    [self dispatchLater:^{
        failCompletion(FMLoginErrorEmptyPassword);
    }];
}


- (void)failDueToUnreachableServerWithCompletion:(FMLoginFailCompletion)failCompletion {
    [self dispatchLater:^{
        failCompletion(FMLoginErrorServerUnreachable);
    }];
}


- (void)failDueToWrongUsernameOrPasswordWithCompletion:(FMLoginFailCompletion)failCompletion {
    [self dispatchLater:^{
        failCompletion(FMLoginErrorIncorrectUserOrPassword);
    }];
}


- (void)dispatchLater:(dispatch_block_t)block {
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC));
    dispatch_after(time, dispatch_get_main_queue(), block);
}

@end

