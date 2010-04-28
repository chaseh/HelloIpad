#import "GestureRecognizerViewController.h"
#import "Polygon.h"
#import "ShapeView.h"
@implementation GestureRecognizerViewController

@synthesize poly;
#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
	UIGestureRecognizer *recognizer;

    /*
     Create a swipe gesture recognizer to recognize swipes.
     We're only interested in receiving messages from this recognizer, and the view will take ownership of it, so we don't need to keep a reference to it.
     */
	UISwipeGestureRecognizer *r;
	recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
	r = (UISwipeGestureRecognizer *)recognizer;
	r.direction = UISwipeGestureRecognizerDirectionRight;
	[self.view addGestureRecognizer:recognizer];
	[recognizer release];

	recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
	r = (UISwipeGestureRecognizer *)recognizer;
	r.direction = UISwipeGestureRecognizerDirectionLeft;
	[self.view addGestureRecognizer:recognizer];
	[recognizer release];
		
	self.poly = [[Polygon alloc] initWithSides:3];
	
	/*Init the sub-shape in order to set up our shape view*/
	CGRect frame = CGRectMake(20, 109, 728, 875);
	shapeView = [[ShapeView alloc] initWithFrame:frame];
	shapeView.poly = poly;
	shapeView.backgroundColor = [UIColor grayColor];
	[self.view addSubview:shapeView];
	[self.view addSubview:label];

}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
	if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        [poly decreaseSides];
    }
    else if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        [poly increaseSides];
    }
	label.text = [poly typeOfShape];
	numOfSides.text = [NSString stringWithFormat:@"%d", [poly sides]];
	[shapeView setNeedsDisplay];
}

- (IBAction) increaseButton {
	[poly increaseSides];
	label.text = [poly typeOfShape];
	numOfSides.text = [NSString stringWithFormat:@"%d", [poly sides]];
	[shapeView setNeedsDisplay];	
}

- (IBAction) decreaseButton {
	[poly decreaseSides];
	[shapeView setNeedsDisplay];
	numOfSides.text = [NSString stringWithFormat:@"%d", [poly sides]];
	label.text = [poly typeOfShape];
}
#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[poly release];
	[label release];
	[numOfSides release];
	[shapeView release];
	[increaseButton release];
	[decreaseButton release];
    [super dealloc];
}

@end
