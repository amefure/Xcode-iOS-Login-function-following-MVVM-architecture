//
//  ContentView.swift
//  TestAuth
//
//  Created by t&a on 2023/04/02.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var signInUserInfoVM = SignInUserInfoViewModel.shared
    
    var body: some View {
        VStack {
            
            // MARK: - ユーザー名とプロバイダーを表示
            Text(signInUserInfoVM.displayName)
            Text(signInUserInfoVM.signInUserProvider)
            
            Divider()
            
            NavigationLink(destination: {EditUserNameView()}, label: {
                Text("ユーザー情報を編集")
            })
                .frame(width:200)
                    .padding()
                    .background(.cyan)
                    .tint(.white)
                    .cornerRadius(5)
                    .padding()

            SignOutButtonView()
            
            NavigationLink(destination: {WithdrawalButtonView()}, label: {
                Text("退会する")
            })
                .frame(width:70)
                    .padding()
                    .background(.cyan)
                    .tint(.white)
                    .cornerRadius(5)
                    .padding()
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
