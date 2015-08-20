//
//  FMLoginCell.m
//  FightingMonster
//
//  Created by Andrei Raifura on 8/20/15.
//  Copyright (c) 2015 YOPESO. All rights reserved.
//

#import "FMLoginCell.h"

@interface FMLoginCell ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation FMLoginCell

- (void)makeSecure {
    [self.textField setSecureTextEntry:YES];
}


#pragma mark - Custom Accessors

- (void)setText:(NSString *)text {
    [self.textField setText:text];
}


- (NSString *)text {
    return  self.textField.text;
}


- (void)setPlaceholder:(NSString *)placeholder {
    self.textField.placeholder = placeholder;
}


- (NSString *)placeholder {
    return self.textField.placeholder;
}

@end
