//
//  FMLoginStorage.h
//  FightingMonster
//
//  Created by Andrei Raifura on 8/20/15.
//  Copyright © 2015 YOPESO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMLoginStorage : NSObject
- (NSString *)lastLogedUsername;
- (void)setLastLoggedUsername:(NSString *)username;

@end
