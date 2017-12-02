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
