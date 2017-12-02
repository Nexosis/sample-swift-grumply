import Foundation

class GrumplySettings {

    var datasetName: String {
        if let userId = fetchUserId() {
            return userId
        } else {
            let userId = generateUserId()
            saveUserId(userId)
            return userId
        }
    }

    var apiKey: String {

        guard let fileUrl = Bundle.main.url(forResource: "Settings", withExtension: "plist") else {
            fatalError("Cannot find settings file")
        }

        guard let data = try? Data(contentsOf: fileUrl) else {
            fatalError("Cannot load settings file")
        }

        guard let plist = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any] else {
            fatalError("Cannot parse settings file")
        }

        guard let key = plist?["API_KEY"] as? String else {
            fatalError("No API KEY in plist")
        }

        return key
    }

    private func fetchUserId() -> String? {
        return UserDefaults.standard.string(forKey: "userId")
    }

    private func generateUserId() -> String {
        return UUID().uuidString
    }

    private func saveUserId(_ userId: String) {
        UserDefaults.standard.set(userId, forKey: "userId")
    }
}
