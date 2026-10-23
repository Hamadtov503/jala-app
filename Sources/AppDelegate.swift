import UIKit
import AVFoundation

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
        Self.configureAudio()
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        application.isIdleTimerDisabled = true
        Self.configureAudio()
    }

    /// The announcement (recorded names + the phone's voice) must be heard even with the silent switch on,
    /// and may record names: playAndRecord through the loudspeaker, mixing politely with other audio.
    static func configureAudio() {
        let session = AVAudioSession.sharedInstance()
        try? session.setCategory(.playAndRecord, mode: .spokenAudio,
                                 options: [.defaultToSpeaker, .allowBluetoothA2DP, .duckOthers])
        try? session.setActive(true)
    }
}

extension UIColor {
    static let jalaMilk = UIColor(red: 0xF5 / 255, green: 0xEF / 255, blue: 0xE3 / 255, alpha: 1)
}
