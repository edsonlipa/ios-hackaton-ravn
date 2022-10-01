//
//  LoginView.swift
//  Ravn-Hackaton
//
//  Created by Edson Lipa Urbina on 1/10/22.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var logged: Bool? = false

    var body: some View {
        NavigationView {
            ZStack {
                Color("defaultBackground")
                NavigationLink(
                    destination: WelcomeView(),
                    tag: true,
                    selection: $logged
                ) {
                    Text("Sign In")
                }
                VStack {
                    Image("logo")
                    Text("Sign in to your account")
                        .bold()
                        .font(.title)

                    VStack(spacing: .zero) {
                        TextField("Email address", text: $email)
                        TextField("Password", text: $email)
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                    HStack {
                        Text("Forgot your password?")
                        Spacer()

                        Toggle("Remember me", isOn: .constant(false))

                    }
                    .font(.caption)

                    Button(action: {
                        logged = true
                    }) {
                        Text("Sign In")
                            .frame(minWidth: 0, maxWidth: .infinity)

                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color("PimaryColor"))
                    .foregroundColor(.white)
                }
                .padding(.horizontal, 16)
            }

        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
