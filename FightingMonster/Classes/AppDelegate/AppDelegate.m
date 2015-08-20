//
//  AppDelegate.m
//  FightingMonster
//
//  Created by Andrei Raifura on 8/20/15.
//  Copyright (c) 2015 YOPESO. All rights reserved.
//

#import "AppDelegate.h"
#import "FMViewController.h"
#import "FMLoginHandler.h"
#import "FMLoginStorage.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [self rootViewController];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (UIViewController *)rootViewController {
    return [[UINavigationController alloc] initWithRootViewController:[self loginViewController]];
}


- (UIViewController *)loginViewController {
    FMLoginHandler *handler = [[FMLoginHandler alloc] init];
    FMLoginStorage *storage = [[FMLoginStorage alloc] init];
    
    return [[FMViewController alloc] initWithLoginHandler:handler loginStorage:storage];
}

@end
