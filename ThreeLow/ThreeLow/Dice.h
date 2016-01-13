//
//  Dice.h
//  ThreeLow
//
//  Created by Carl Udren on 1/13/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

@property (nonatomic) NSString *value;
@property (nonatomic) BOOL isHeld;
@property (nonatomic) BOOL isPermHeld;


+ (instancetype) die;

- (void) roll;



@end
