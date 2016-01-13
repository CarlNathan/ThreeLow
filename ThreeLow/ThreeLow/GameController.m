//
//  GameController.m
//  ThreeLow
//
//  Created by Carl Udren on 1/13/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "GameController.h"


@implementation GameController

- (instancetype) init{
    self = [super init];
    if (self) {
        Dice *die1 = [Dice die];
        Dice *die2 = [Dice die];
        Dice *die3 = [Dice die];
        Dice *die4 = [Dice die];
        Dice *die5 = [Dice die];

        _dice = [NSArray arrayWithObjects:die1, die2, die3, die4, die5, nil];
        
        _permHeldCount = 0;
}
    return self;

}


- (BOOL) canToggle: (NSInteger)index{
    Dice *die = [self.dice objectAtIndex:index];
    if (die.isPermHeld) {
        return NO;
    } else {
        return YES;
    }
}

- (NSInteger) holdDie:(NSInteger)dieNumber {
    Dice *die = [self.dice objectAtIndex:dieNumber];
    if (die.isHeld) {
        die.isHeld = NO;
        return -1;
    } else {
        die.isHeld = YES;
        return 1;
    }
}


- (void) resetDice {
    for (Dice *die in self.dice) {
        die.isHeld = NO;
    };
}


- (NSInteger) calculateScore {
    NSInteger score = 0;
    NSDictionary *scoreKey = @{@"⚀": @1,
                               @"⚁": @2,
                               @"⚂": @0,
                               @"⚃": @4,
                               @"⚄": @5,
                               @"⚅": @6};
    
    for (Dice *die in self.dice) {
        if (die.isPermHeld) {
            score = score + [[scoreKey objectForKey: die.value] integerValue];
        }
    }
    return score;
}


- (void) printGameStatus{
    NSMutableString *diceString = [[NSMutableString alloc] init];
    for (Dice *die in self.dice) {
        [diceString appendString: die.value];
    }
    
    NSMutableString *heldDiceString = [[NSMutableString alloc] init];
    for (Dice *die in self.dice) {
        if (die.isHeld) {
            [heldDiceString appendString: die.value];
        } else {
            [heldDiceString appendString:@"□"];
        }
    }
    NSMutableString *permHeldDiceString = [[NSMutableString alloc] init];
    for (Dice *die in self.dice) {
        if (die.isPermHeld) {
            [permHeldDiceString appendString: die.value];
        } else {
            [permHeldDiceString appendString:@"□"];
        }
    }
    NSLog(@"\n Dice: \n %@ \n 12345\n Held Dice \n %@ \n 12345 \n Moves this turn: \n %@ \n 12345 \n Score: %ld", diceString, permHeldDiceString, heldDiceString, [self calculateScore]);
}

- (void) rollDice{
    for (Dice *die in self.dice) {
        if (!die.isHeld) {
            [die roll];
        } else if (!die.isPermHeld) {
            die.isPermHeld = YES;
            self.permHeldCount++;
        }
    }
}

@end
