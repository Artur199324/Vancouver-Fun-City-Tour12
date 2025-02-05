import Foundation

final class UserDataManager {
   
    static let shared = UserDataManager()
    
  
    private let usernameKey = "SavedUsername"
    private let avatarKey = "SelectedAvatar"
    private let favoritesKey = "Favorites"
    
   
    private init() {}
    
 

    
    private func removeUsername() {
        UserDefaults.standard.removeObject(forKey: usernameKey)
    }
    
  
    private func removeAvatar() {
        UserDefaults.standard.removeObject(forKey: avatarKey)
    }
    
   
    private func removeFavorites() {
        UserDefaults.standard.removeObject(forKey: favoritesKey)
    }
    

    func clearAllData() {
        removeUsername()
        removeAvatar()
        removeFavorites()
    }
}
