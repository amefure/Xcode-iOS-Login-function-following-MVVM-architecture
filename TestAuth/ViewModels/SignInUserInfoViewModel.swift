//
//  SignInUserInfoViewModel.swift
//  TestAuth
//
//  Created by t&a on 2023/04/12.
//

import UIKit

class SignInUserInfoViewModel :ObservableObject{
    
    private let userDefaults: UserDefaultsProtocol
    
    init(userDefaults: UserDefaultsProtocol = UserDefaultsWrapper.shared) {
        self.userDefaults = userDefaults
        self.displayName = userDefaults.object(forKey: "SignInUserName") as? String ?? "none"
    }
    
    static let shared = SignInUserInfoViewModel()
    
    @Published var displayName:String = ""
    
    var signInUserId: String {
        get {
            return userDefaults.object(forKey: "SignInUserId") as? String ?? "none"
        }
        set {
            userDefaults.set(newValue, forKey: "SignInUserId")
        }
    }
    
    var signInUserName: String {
        get {
            return userDefaults.object(forKey: "SignInUserName") as? String ?? "none"
        }
        set {
            displayName = newValue
            userDefaults.set(newValue, forKey: "SignInUserName")
        }
    }
    
    var signInUserProvider: String {
        get {
            return userDefaults.object(forKey: "SignInUserProvider") as? String ?? "none"
        }
        set {
            userDefaults.set(newValue, forKey: "SignInUserProvider")
        }
    }
    
    public func setSignInProvider(provider:AuthProviderModel){
        switch provider{
            
        case .email:
            self.signInUserProvider = AuthProviderModel.email.rawValue
        case .apple:
            self.signInUserProvider = AuthProviderModel.apple.rawValue
        case .google:
            self.signInUserProvider = AuthProviderModel.google.rawValue
        }
    }
    
    public func resetUserInfo(){
        signInUserId = ""
        signInUserName = ""
        signInUserProvider = ""
    }
}
