//
//  SignOutButtonView.swift
//  TestAuth
//
//  Created by t&a on 2023/04/12.
//

import SwiftUI

struct SignOutButtonView: View {
    
    // MARK: - ViewModels
    @ObservedObject var authVM = AuthViewModel.shared
    
    // MARK: - Navigationプロパティ
    @State var isActive:Bool = false
    
    var body: some View {
        VStack{
            
        
            // MARK: - 透明のNavigationLink
            NavigationLink(isActive: $isActive, destination:{ LoginAuthView()}, label: {
                EmptyView()
            })
        Button {
            authVM.signOut { result in
                if result {
                    isActive = true
                }
            }
        } label: {
            Text("SignOut")
        }.frame(width:70)
            .padding()
            .background(.cyan)
            .tint(.white)
            .cornerRadius(5)
            .padding()
            
        }
    }
}

struct SignOutButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SignOutButtonView()
    }
}
