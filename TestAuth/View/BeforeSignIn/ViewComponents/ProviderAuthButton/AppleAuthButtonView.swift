//
//  AppleAuthView.swift
//  TestAuth
//
//  Created by t&a on 2023/04/02.
//

import SwiftUI
import AuthenticationServices
import FirebaseAuth


struct AppleAuthButtonView: View {
    
    // MARK: - ViewModels
    @ObservedObject var authVM = AuthViewModel.shared
    
    // MARK: - Navigationプロパティ
    @Binding var isActive:Bool
    
    // MARK: -
    @Binding var userEditReauthName:String // 変更するユーザー名 or ブランク("")
    
    // MARK: - Flag
    public var isCalledFromUserEditScreen:Bool = false              // EditUserNameViewから呼び出されているか
    public var isCalledFromUserWithDrawaScreen:Bool = false         // WithdrawalButtonViewから呼び出されているか
    
    // MARK: - Appleボタン　ボタンタイトル表示用
    private var displayButtonTitle:SignInWithAppleButton.Label{
        if isCalledFromUserEditScreen == false {
            return .signIn
        }else{
            return .continue
        }
    }
    
    var body: some View {
        
        
        SignInWithAppleButton(displayButtonTitle) { request in
            
            // MARK: - Request
            request.requestedScopes = [.email,.fullName]
            request.nonce = authVM.getHashAndSetCurrentNonce()
            
        } onCompletion: { result in
            
            guard let credential = authVM.switchAuthResult(result: result) else{
                return
            }
            // MARK: - 以下ボタンアクション分岐
            
            
            if isCalledFromUserEditScreen == false {
                
                if isCalledFromUserWithDrawaScreen == false {
                    // MARK: - ログイン
                    authVM.credentialAppleSignIn(credential: credential) { result in
                        authVM.resetErrorMsg()
                        isActive = true
                    }
                }else{
                    // MARK: - 退会
                    authVM.withdrawal(completion: ) { result in
                        if result {
                            isActive = true // EditUserInfo成功アラート表示用
                        }
                    }
                }
                
            }else{
                // MARK: - ユーザーネーム変更
                authVM.editUserNameApple(credential: credential, name: userEditReauthName) {result in
                    if result {
                        isActive = true
                    }
                }
            }
            
        }.frame(width: 200, height: 40)
            .signInWithAppleButtonStyle(.black)
    }
}
