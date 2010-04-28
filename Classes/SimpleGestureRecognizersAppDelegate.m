
#import "SimpleGestureRecognizersAppDelegate.h"
#import "GestureRecognizerViewController.h"

@implementation SimpleGestureRecognizersAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Display the view controller's view in the application's window. 
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
