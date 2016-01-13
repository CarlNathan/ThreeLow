//
//  main.m
//  ThreeLow
//
//  Created by Carl Udren on 1/13/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputController.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    {
        InputController *inputController = [[InputController alloc] init];
        GameController *controller = [[GameController alloc] init];
        NSLog(@"Welcome to ThreeLow! \n Lets get started");
        NSString *result = [inputController inputForPrompt:@"Enter your name to roll!"];
        [controller rollDice];
        
        //Main Game Repeating Loop
        while (YES) {
            
            //Selection stage
            NSInteger mayRoll = 0;
            while (YES) {
                [controller printGameStatus];
                result = [inputController inputForPrompt:@"Enter a die number to toggle its selection status. (You must select at least one to hold. Enter 'roll' to confirm your moves and take your next turn!"];
                NSInteger resultInt = [result integerValue];
                if (resultInt > 0 && resultInt < 6) {
                    if (![controller canToggle:resultInt -1]) {
                        NSLog(@"That die cannot be toggled");
                        continue;
                    } else {
                        mayRoll = mayRoll + [controller holdDie:resultInt -1 ];
                        continue;
                    }
                } else {
                    if ([[result lowercaseString] isEqualToString:@"roll"]) {
                        if (mayRoll > 0) {
                            [controller rollDice];
                            break;
                        } else
                            NSLog(@"You have not selected at least one die to hold");
                        continue;
                    }
                    NSLog(@"Invalid entry, try again");
                    continue;
                }
            }
            
            if (controller.permHeldCount > 3) {
                for (Dice *die in controller.dice) {
                    if (!die.isHeld) {
                        die.isHeld = YES;
                    }
                    [controller rollDice];
                    [controller printGameStatus];
                    NSLog(@"Game Over!  Nice job! \n Your score is: %ld", (long)[controller calculateScore]);
                }
                break;
            } else {
                continue;
            }
            
        }
        
    }
    return 0;
}
