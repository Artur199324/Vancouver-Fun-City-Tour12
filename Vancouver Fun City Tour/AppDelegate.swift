
import SwiftUI
import FirebaseCore
import SdkPushExpress
class AppDelegate: NSObject, UIApplicationDelegate {
    private let PUSHEXPRESS_APP_ID = "36923-1086"
    private var myOwnDatabaseExternalId = UUID().uuidString
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            FirebaseApp.configure()
                  
            try! PushExpressManager.shared.initialize(appId: PUSHEXPRESS_APP_ID)
            let id = UserDefaults.standard.string(forKey: "id")
            if id == nil {
                UserDefaults.standard.set(myOwnDatabaseExternalId, forKey: "id")
            } else {
                myOwnDatabaseExternalId = id!
            }
            try! PushExpressManager.shared.activate(extId: myOwnDatabaseExternalId)
            
            return true
        }
        
        func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
            let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
            PushExpressManager.shared.transportToken = tokenParts.joined()
        }
}
