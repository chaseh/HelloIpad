//
//  ShapeView.h
//  SimpleGestureRecognizers
//
//  Created by Chase Hensel on 4/28/10.
//  Copyright 2010 Baked-Potato. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Polygon;
@interface ShapeView : UIView {
	Polygon *poly;
}

@property (retain) Polygon *poly;
+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides;
@end
