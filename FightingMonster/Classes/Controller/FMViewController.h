//
//  FMViewController.h
//  FightingMonster
//
//  Created by Andrei Raifura on 8/20/15.
//  Copyright (c) 2015 YOPESO. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FMLoginHandler;
@class FMLoginStorage;

@interface FMViewController : UIViewController
- (instancetype)initWithLoginHandler:(FMLoginHandler *)handler
                        loginStorage:(FMLoginStorage *)storage;
@end
