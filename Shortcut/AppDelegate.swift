import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var viewControllersArray = [UIViewController]()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mountainVC = storyboard.instantiateViewController(withIdentifier: MOUNTAIN_VC_IDENTIFIER) as! MountainVC
        let spaceVC = storyboard.instantiateViewController(withIdentifier: SPACE_VC_IDENTIFIER) as! SpaceVC
        let oceanVC = storyboard.instantiateViewController(withIdentifier: OCEAN_VC_IDENTIFIER) as! OceanVC
        viewControllersArray = [mountainVC,spaceVC,oceanVC]
        return true
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        guard let type = shortcutItem.type.components(separatedBy: ".").last else {
            completionHandler(false)
            return
        }
        let navVC = window?.rootViewController as! UINavigationController
        navVC.setViewControllers(viewControllersArray, animated: false)
        switch type {
        case ShortcutType.Mountain.rawValue:
            navVC.popToRootViewController(animated: true)
            completionHandler(true)
            break
        case ShortcutType.Space.rawValue:
            navVC.popToViewController(viewControllersArray[1], animated: true)
            completionHandler(true)
            break
        case ShortcutType.Ocean.rawValue:
            navVC.popToViewController(viewControllersArray[2], animated: true)
            completionHandler(true)
            break
        default:
            navVC.popToRootViewController(animated: true)
            completionHandler(true)
            break
        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}
}
