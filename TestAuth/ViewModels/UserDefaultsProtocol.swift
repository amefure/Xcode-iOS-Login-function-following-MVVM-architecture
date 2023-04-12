//
//  UserDefaultsProtocol.swift
//  TestAuth
//
//  Created by t&a on 2023/04/12.
//

import UIKit

protocol UserDefaultsProtocol {
    func set(_ value: Any?, forKey defaultName: String)
    func object(forKey defaultName: String) -> Any?
    // 他にも必要なメソッドを追加
}

class UserDefaultsWrapper: UserDefaultsProtocol {
    static let shared = UserDefaultsWrapper()

    private init() {}

    func set(_ value: Any?, forKey defaultName: String) {
        UserDefaults.standard.set(value, forKey: defaultName)
    }

    func object(forKey defaultName: String) -> Any? {
        return UserDefaults.standard.object(forKey: defaultName)
    }
}
