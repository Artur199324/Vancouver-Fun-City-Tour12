import Foundation
final class LoginManager {
  
    static let shared = LoginManager()
    
  
    private let loginKey = "isLoggedIn"
    
   
    private init() {}
    
  

 
    func saveLoginStatus(isLoggedIn: Bool) {
        UserDefaults.standard.set(isLoggedIn, forKey: loginKey)
    }

 
    func getLoginStatus() -> Bool {
        return UserDefaults.standard.bool(forKey: loginKey)
    }

   
    func toggleLoginStatus() {
        let currentStatus = getLoginStatus()
        saveLoginStatus(isLoggedIn: !currentStatus)
    }
}
