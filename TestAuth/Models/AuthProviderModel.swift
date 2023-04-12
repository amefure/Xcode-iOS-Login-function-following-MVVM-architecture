//
//  AuthProviderModel.swift
//  TestAuth
//
//  Created by t&a on 2023/04/12.
//

import UIKit

enum AuthProviderModel:String,CaseIterable{
    case email
    case apple
    case google
    
    static func getProviderModel(rawValue:String) -> AuthProviderModel?{
        switch rawValue{
        case AuthProviderModel.email.rawValue :
            return .email
        case AuthProviderModel.apple.rawValue :
            return .apple
        case AuthProviderModel.google.rawValue :
            return .google
        default :
            return .none
        }
        
    }
}
