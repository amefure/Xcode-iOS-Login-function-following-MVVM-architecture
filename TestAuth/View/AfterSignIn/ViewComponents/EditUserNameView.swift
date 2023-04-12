//
//  EditUserNameView.swift
//  TestAuth
//
//  Created by t&a on 2023/04/12.
//

import SwiftUI

struct EditUserNameView: View {
    
    // MARK: - ViewModels
    @ObservedObject var authVM = AuthViewModel.shared
    
    // MARK: - Navigationプロパティ
    @State var isActive:Bool = false
    @State var name:String = ""
    @State var pass:String = ""
    
    
    var body: some View {
        VStack{
            TextField("UserName", text: $name)
            
            switch AuthProviderModel.getProviderModel(rawValue: SignInUserInfoViewModel.shared.signInUserProvider) {
            case .email:
                
                VStack{
                    
                    SecureInputView(password: $pass)
                    Button {
                        authVM.editUserInfoEmail(name: name, pass: pass) { result in
                            isActive = true
                        }
                    } label: {
                        Text("更新")
                    }
                    
                }
                
            case .apple:
                AppleAuthButtonView(isActive: $isActive, userEditReauthName: $name,isCalledFromUserEditScreen: true)
            case .google:
                GoogleAuthButtonView(isActive: $isActive,userEditReauthName: $name,isCalledFromUserEditScreen: true)
            case .none:
                EmptyView()
            }
        }.alert("更新しました", isPresented: $isActive) {
            
        }
    }
}

struct EditUserNameView_Previews: PreviewProvider {
    static var previews: some View {
        EditUserNameView()
    }
}
