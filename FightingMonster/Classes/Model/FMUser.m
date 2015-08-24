//
//  FMUser.m
//  FightingMonster
//
//  Created by Andrei Raifura on 8/20/15.
//  Copyright (c) 2015 YOPESO. All rights reserved.
//

#import "FMUser.h"

@implementation FMUser

- (instancetype)initWithUserName:(NSString *)username {
    self = [super init];
    if (self) {
        _username = username;
    }
    
    return self;
}

@end
