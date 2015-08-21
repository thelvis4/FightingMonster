//
//  FMLoginViewDatasource.h
//  FightingMonster
//
//  Created by Andrei Raifura on 8/20/15.
//  Copyright (c) 2015 YOPESO. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FMLoginViewModel;

@interface FMLoginViewDatasource : NSObject<UITableViewDataSource>
@property (strong, nonatomic) FMLoginViewModel *model;

- (instancetype)initWithTableView:(UITableView *)tableView;

- (void)setUp;
- (void)assignCredentialsToModel;

@end
