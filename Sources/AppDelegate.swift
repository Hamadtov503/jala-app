import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .jalaMilk
        window.rootViewController = WebViewController()
        window.makeKeyAndVisible()
        self.window = window

        // Keep the screen on while a game is being scored.
        application.isIdleTimerDisabled = true
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        application.isIdleTimerDisabled = true
    }
}

extension UIColor {
    static let jalaMilk = UIColor(red: 0xF5 / 255, green: 0xEF / 255, blue: 0xE3 / 255, alpha: 1)
}
