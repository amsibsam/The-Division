//
//  DataCacheManager.swift
//  The Division
//
//  Created by MTMAC16 on 13/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation

class DataCacheManager {
    public static let shared: DataCacheManager = DataCacheManager()
    private let preference: UserDefaults = UserDefaults.standard
    
    func saveUserCredential(token: String) {
        preference.set(token, forKey: "user_token")
    }
    
    func getUserCredential() -> String? {
        return preference.string(forKey: "user_token")
    }
    
    func clear() {
        if let bundleIdentifier = Bundle.main.bundleIdentifier {
            preference.removePersistentDomain(forName: bundleIdentifier)
            preference.synchronize()
        }
    }}
