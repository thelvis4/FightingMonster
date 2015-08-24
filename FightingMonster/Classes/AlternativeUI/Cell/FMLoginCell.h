//
//  FMLoginCell.h
//  FightingMonster
//
//  Created by Andrei Raifura on 8/20/15.
//  Copyright (c) 2015 YOPESO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMLoginCell : UITableViewCell
@property (nonatomic) NSString *text;
@property (nonatomic) NSString *placeholder;

- (void)makeSecure;

@end
