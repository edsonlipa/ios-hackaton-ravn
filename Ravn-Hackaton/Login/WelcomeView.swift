//
//  WeolcomeView.swift
//  Ravn-Hackaton
//
//  Created by Edson Lipa Urbina on 1/10/22.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("defaultBackground")
                    .ignoresSafeArea(.all)

                VStack {
                    Image("logo")
                    Text("Sign in to your account")
                        .bold()
                        .font(.title)

                    Text(
                        "It seems that you do not have invitations to any workspace, check that you have been invited to one"
                    )
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .padding(.vertical, 24)

                    Button("Try a different email", action: {})
                }
                .padding(.horizontal, 16)
            }
            .navigationBarHidden(true)
            
        }
    }
}

struct WeolcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
