//
//  FMLoginStorage.m
//  FightingMonster
//
//  Created by Andrei Raifura on 8/20/15.
//  Copyright © 2015 YOPESO. All rights reserved.
//

#import "FMLoginStorage.h"

static NSString *const FMLastLogedUsername = @"FMLastLogedUsername";

@implementation FMLoginStorage

- (NSString *)lastLogedUsername {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    return [defaults objectForKey:FMLastLogedUsername];
}


- (void)setLastLoggedUsername:(NSString *)username {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:username forKey:FMLastLogedUsername];
    [defaults synchronize];
}

@end
