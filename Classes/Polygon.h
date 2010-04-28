//
//  Polygon.h
//  SimpleGestureRecognizers
//
//  Created by Chase Hensel on 4/27/10.
//  Copyright 2010 Baked-Potato. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Polygon : NSObject {
	int sides;
}

@property (readonly)int sides;
- (Polygon*) initWithSides:(int)s;
- (void) increaseSides;
- (void) decreaseSides;
- (NSString*) typeOfShape;
@end
