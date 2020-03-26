#import "SceneDelegate.h"
#import "klotFeedVC.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
//          self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
        
        klotFeedVC * LoginVC = [[klotFeedVC alloc]init];
        
        
    //    //1.创建Tab所属的ViewController
    //    // 看书首页
    //    ReaderHomeViewController *homeVC = [[ReaderHomeViewController alloc] init];
    //    UITabBarItem* homeTabItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0];
    //    homeTabItem.title = @"看书";
    //    homeVC.tabBarItem = homeTabItem;
    ////    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    ////    homeNav.navigationBar.translucent = NO;
    //
    //
    ////    //工作
    //    PersonalCenterPageViewController * PersonalCenterPageVC = [[PersonalCenterPageViewController alloc]init];
    ////    UINavigationController *PersonalCenterPageVCNav = [[UINavigationController alloc] initWithRootViewController:PersonalCenterPageVC];
    ////    PersonalCenterPageVCNav.navigationBar.translucent = NO;
    ////    UITabBarItem * PerSonCenItem = [[UITabBarItem alloc]initWithTitle:@"个人中心" image:[UIImage imageNamed:@"PersonalCenterPageVC.jpg"] tag:1];
    //    UITabBarItem * PerSonCenItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemMore tag:1];
    //    PerSonCenItem.title = @"个人中心";
    //    PersonalCenterPageVC.tabBarItem = PerSonCenItem;
    //
    //
    //    //2、创建一个数组，放置多有控制器
    //    NSArray *vcArray = [NSArray arrayWithObjects:homeVC,PersonalCenterPageVC, nil];
    //
    //    //3、创建UITabBarController，将控制器数组设置给UITabBarController
    //    UITabBarController *tabBarVC = [[UITabBarController alloc]init];
    //    //设置多个Tab的ViewController到TabBarViewController
    //    tabBarVC.viewControllers = vcArray;
    //    //4、将UITabBarController设置为Window的RootViewController
    //    self.window.rootViewController = tabBarVC;
        self.window.rootViewController = LoginVC;
        //显示Window
        [self.window makeKeyAndVisible];
        


    
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
