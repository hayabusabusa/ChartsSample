//
//  LocalSettings.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/25.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import Foundation

enum LocalSettings {
    
    // MARK: - Keys
    
    static private let kUserStatusKey: String = "kUserStatusKey"
    static private let kTimerCacheKey: String = "kTimerCacheKey"
    
    enum UserStatus: Int {
        case initial
        case loggedIn
        case loggedOut
    }
    
    // MARK: - User status
    
    static func getUserStatus() -> UserStatus {
        guard let rawValue = UserDefaults.standard.object(forKey: kUserStatusKey) as? Int,
            let stored = UserStatus(rawValue: rawValue) else { return .initial }
        return stored
    }
    
    static func saveUserStatus(_ status: UserStatus) {
        UserDefaults.standard.set(status.rawValue, forKey: kUserStatusKey)
    }
    
    static func removeUserStatus() {
        UserDefaults.standard.removeObject(forKey: kUserStatusKey)
    }
    
    // MARK: - Timer cache
    
    static func getTimerCache() -> TimerCache? {
        guard let data = UserDefaults.standard.data(forKey: kTimerCacheKey),
            let stored = try? JSONDecoder().decode(TimerCache.self, from: data) else { return nil }
        return stored
    }
    
    static func saveTimerCache(_ cache: TimerCache) {
        guard let data = try? JSONEncoder().encode(cache) else { return }
        UserDefaults.standard.set(data, forKey: kTimerCacheKey)
    }
    
    static func removeTimerCache() {
        UserDefaults.standard.removeObject(forKey: kTimerCacheKey)
    }
}
