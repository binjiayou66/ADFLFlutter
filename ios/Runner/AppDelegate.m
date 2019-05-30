#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "ViewController.h"
#import "ADFlutterRouter.h"
#import <flutter_boost/FlutterBoostPlugin.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    ViewController *vc1 = [[ViewController alloc] init];
    UINavigationController *nvc1 = [[UINavigationController alloc] initWithRootViewController:vc1];

    
    self.window.rootViewController = nvc1;
    
    [FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:[ADFlutterRouter sharedRouter] onStart:nil];
  
    // Override point for customization after application launch.
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
