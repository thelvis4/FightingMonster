//
//  FMUserTests.m
//  FightingMonster
//
//  Created by Andrei Raifura on 8/20/15.
//  Copyright (c) 2015 YOPESO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "FMUser.h"

@interface FMUserTests : XCTestCase

@end

@implementation FMUserTests

- (void)testUserTakesUsername {
    NSString *username = @"Masika";
    FMUser *user = [[FMUser alloc] initWithUserName:username];
    
    XCTAssertEqualObjects(user.username, username);
}

@end
