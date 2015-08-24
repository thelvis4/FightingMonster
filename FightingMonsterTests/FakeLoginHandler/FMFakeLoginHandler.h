//
//  FMFakeLoginHandler.h
//  FightingMonster
//
//  Created by Andrei Raifura on 8/20/15.
//  Copyright (c) 2015 YOPESO. All rights reserved.
//

#import "FMLoginHandler.h"

static NSString *FMLoginCorrectUsername = @"Coder";
static NSString *FMLoginCorrectPassword = @"CodeWay";

static NSString *FMLoginUnreachableUsername = @"You can't reach me";

@interface FMFakeLoginHandler : FMLoginHandler

@property (copy, nonatomic, readonly) NSString *username;
@property (copy, nonatomic, readonly) NSString *password;

- (void)simulateLoginEnd;

@end
