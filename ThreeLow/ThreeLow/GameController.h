//
//  GameController.h
//  ThreeLow
//
//  Created by Carl Udren on 1/13/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

@interface GameController : NSObject

@property (nonatomic) NSArray *dice;
@property (nonatomic) NSInteger permHeldCount;

- (BOOL) canToggle: (NSInteger)index;

- (NSInteger) holdDie: (NSInteger) dieNumber;

- (void) resetDice;

- (NSInteger) calculateScore;

- (void) printGameStatus;

- (void) rollDice;


@end
