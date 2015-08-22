//
//  FMUser.h
//  FightingMonster
//
//  Created by Andrei Raifura on 8/20/15.
//  Copyright (c) 2015 YOPESO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMUser : NSObject
@property (copy, nonatomic, readonly) NSString *username;

- (instancetype)initWithUserName:(NSString *)username;

@end
