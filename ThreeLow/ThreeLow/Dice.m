//
//  Dice.m
//  ThreeLow
//
//  Created by Carl Udren on 1/13/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "Dice.h"
#import <stdlib.h>

@implementation Dice

+ (instancetype) die{
    Dice *die = [[Dice alloc] init];
    die.isHeld = NO;
    die.isPermHeld = NO;
    return die;
}


- (void) roll {
    NSInteger face = arc4random_uniform(5);
    switch (face) {
        case 0:
            self.value = @"⚀";
            break;
            
        case 1:
            self.value = @"⚁";
            break;
            
        case 2:
            self.value = @"⚂";
            break;
            
        case 3:
            self.value = @"⚃";
            break;
            
        case 4:
            self.value = @"⚄";
            break;
            
        case 5:
            self.value = @"⚅";
            break;
            
        default:
            break;
    }
}


@end
