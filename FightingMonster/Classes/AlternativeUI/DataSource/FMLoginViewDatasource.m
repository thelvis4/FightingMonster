//
//  FMLoginViewDatasource.m
//  FightingMonster
//
//  Created by Andrei Raifura on 8/20/15.
//  Copyright (c) 2015 YOPESO. All rights reserved.
//

#import "FMLoginViewDatasource.h"
#import "FMLoginView.h"
#import "FMLoginCell.h"

static NSString *const FMLoginTableViewCellIdentifier = @"FMLoginCell";
static NSString *const FMLoginCellNibName = @"FMLoginCell";

static NSInteger const FMUsernameCellIndex = 0;
static NSInteger const FMPasswordCellIndex = 1;

@interface FMLoginViewDatasource ()
@property (weak, nonatomic) UITableView *tableView;

@end

@implementation FMLoginViewDatasource

- (instancetype)initWithTableView:(UITableView *)tableView {
    self = [super init];
    if (self) {
        _tableView = tableView;
    }
    
    return self;
}


- (void)assignCredentialsToModel {
    self.model.username = [self cellAtIndex:0].text;
    self.model.password = [self cellAtIndex:1].text;
}


- (void)setUp {
    UINib *cellNib = [UINib nibWithNibName:FMLoginCellNibName bundle:nil];
    [self.tableView registerNib:cellNib
         forCellReuseIdentifier:FMLoginTableViewCellIdentifier];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FMLoginCell *cell = [tableView dequeueReusableCellWithIdentifier:FMLoginTableViewCellIdentifier];
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}


- (FMLoginCell *)cellAtIndex:(NSInteger)index {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    
    return (FMLoginCell *)[self.tableView cellForRowAtIndexPath:indexPath];
}


- (void)configureCell:(FMLoginCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case FMUsernameCellIndex:
            cell.placeholder = @"Username";
            cell.text = self.model.username;
            break;
        case FMPasswordCellIndex:
            cell.placeholder = @"Password";
            [cell makeSecure];
            break;
        default:
            break;
    }
}

@end
