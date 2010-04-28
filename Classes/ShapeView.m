//
//  ShapeView.m
//  SimpleGestureRecognizers
//
//  Created by Chase Hensel on 4/28/10.
//  Copyright 2010 Baked-Potato. All rights reserved.
//

#import "ShapeView.h"
#import "Polygon.h"

@implementation ShapeView
@synthesize poly;

- (void) drawRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	[[UIColor whiteColor] set];
	UIRectFill([self bounds]);
	
	CGContextBeginPath(context);
	NSArray *points = [ShapeView pointsForPolygonInRect:[self bounds] numberOfSides:[poly sides]];
	NSValue *p = [points objectAtIndex:0];
	CGPoint point = [p CGPointValue];
	CGContextMoveToPoint(context, point.x, point.y);
	for (NSValue *p in points) {
		point = [p CGPointValue];
		CGContextAddLineToPoint(context, point.x, point.y);
	}
	CGContextClosePath(context);
	[[UIColor blueColor] setStroke];
	CGContextDrawPath(context, kCGPathStroke);
						

}

/*taken from stanford iphone class*/
+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides { 
	CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0); 
	float radius = 0.9 * center.x; 
	NSMutableArray *result = [NSMutableArray array];
	float angle = (2.0 * M_PI) / numberOfSides; 
	float exteriorAngle = M_PI - angle; 
	float rotationDelta = angle - (0.5 * exteriorAngle);
	for (int currentAngle = 0; currentAngle < numberOfSides; currentAngle++) { 
		float newAngle = (angle * currentAngle) - rotationDelta; 
		float curX = cos(newAngle) * radius; 
		float curY = sin(newAngle) * radius;
		[result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX, center.y + curY)]];
	} 
	return result;
}
- (void) dealloc {
	[poly release];
	[super dealloc];
}
@end
