//
//  Polygon.m
//  SimpleGestureRecognizers
//
//  Created by Chase Hensel on 4/27/10.
//  Copyright 2010 Baked-Potato. All rights reserved.
//

#import "Polygon.h"


@implementation Polygon

@synthesize sides;

- (Polygon*) initWithSides:(int)s {
	sides = 3;
	if(s > 2 && s < 21) {
		sides = s;
	}
	return self;
}

- (void) increaseSides 
{
	if(sides < 20) {
		sides++;
	}
}

- (void) decreaseSides 
{
	if(sides > 3) {
		sides--;
	}
}

- (NSString*) typeOfShape {	
	switch (sides) {
		case 3:
			return @"Triangle";
			break;
		case 4:
			return @"Square";
			break;
		case 5:
			return @"Pentagon";
			break;
		case 6:
			return @"Hexagon";
			break;
		case 7:
			return @"Heptagon";
			break;
		case 8:
			return @"Octagon";
			break;
		case 9:
			return @"Nonagon";
			break;
		case 10:
			return @"Decagon";
			break;
		case 11:
			return @"Hendecagon";
			break;
		case 12:
			return @"Dodecagon";
			break;
		case 13:
			return @"Tridecagon";
			break;
		case 14:
			return @"Tetradecagon";
			break;
		case 15:
			return @"Pentadecagon";
			break;
		case 16:
			return @"Hexadecagon";
			break;
		case 17:
			return @"Heptadecagon";
			break;
		case 18:
			return @"Octadecagon";
			break;
		case 19:
			return @"Enneadecagon";
			break;
		case 20:
			return @"Icosagon";
			break;
		default:
			break;
	}
	return @"OOPS";
}
@end
