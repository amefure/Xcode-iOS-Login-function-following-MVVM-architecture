//
//  ContentView.swift
//  TestAuth
//
//  Created by t&a on 2023/03/31.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

struct GoogleAuthButtonView: View {
    
    // MARK: - Navigationプロパティ
    @Binding var isActive:Bool
    
    // MARK: - ViewModels
    @ObservedObject var authVM = AuthViewModel.shared
    
    // MARK: -
    @Binding var userEditReauthName:String // 変更するユーザー名 or ブランク("")
    
    // MARK: - Flag
    public var isCalledFromUserEditScreen:Bool = false              // EditUserNameViewから呼び出されているか
    public var isCalledFromUserWithDrawaScreen:Bool = false         // WithdrawalButtonViewから呼び出されているか
    
    var body: some View {
        Button(action: {
            
            if isCalledFromUserEditScreen == false {
                if isCalledFromUserWithDrawaScreen == false{
                    authVM.credentialGoogleSignIn { result in
                        if result {
                            authVM.resetErrorMsg()
                            isActive = true
                        }
                    }
                }else{
                    authVM.credentialGoogleWithdrawal { result in
                        if result {
                            isActive = true
                        }
                    }
                }
            }else{
                authVM.editUserInfo(credential: nil, name: userEditReauthName, pass: nil, completion: { result in
                    isActive = true
                })
            }
            
        }, label: {
            Text("Sign in with Google")
        }).frame(width:170)
            .padding()
            .background(.cyan)
            .tint(.white)
            .cornerRadius(5)
            .padding()
    }
}
