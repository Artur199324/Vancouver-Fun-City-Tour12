import FirebaseRemoteConfig
import Foundation

class RemoteConfigManager: ObservableObject {
    static let shared = RemoteConfigManager()
    private let remoteConfig = RemoteConfig.remoteConfig()

    @Published var link: String? = nil
    @Published var isFeatureEnabled: Bool = false

    private init() {
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0 // Можно изменить для тестов
        remoteConfig.configSettings = settings

        let defaultValues: [String: NSObject] = [
            "dmksmdbgfk": "" as NSObject, // Пусть будет пустым по умолчанию
            "jdfnglkj": false as NSObject
        ]
        remoteConfig.setDefaults(defaultValues)

        fetchRemoteConfig()
    }

    func fetchRemoteConfig() {
        remoteConfig.fetchAndActivate { status, error in
            if let error = error {
                print("Ошибка загрузки Remote Config: \(error.localizedDescription)")
            } else {
                DispatchQueue.main.async {
                    // ✅ Исправлена ошибка: добавлена проверка на nil
                    let fetchedLink = self.remoteConfig["dmksmdbgfk"].stringValue
                    self.link = fetchedLink.isEmpty == false ? fetchedLink : nil
                    
                    // ✅ Исправлена обработка Bool
                    self.isFeatureEnabled = self.remoteConfig["jdfnglkj"].boolValue

                    print("Remote Config: link=\(self.link ?? "nil"), isFeatureEnabled=\(self.isFeatureEnabled)")
                }
            }
        }
    }
}
