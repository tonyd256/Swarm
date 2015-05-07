import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(application: UIApplication, handleWatchKitExtensionRequest userInfo: [NSObject : AnyObject]?, reply: (([NSObject : AnyObject]!) -> Void)!) {
    let string = NSUserDefaults.standardUserDefaults().valueForKey("SwarmItemCount") as? String ?? ""
    reply(["SwarmItemCount": string])
  }
}

