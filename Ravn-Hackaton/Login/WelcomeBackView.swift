//
//  WelcomeBackView.swift
//  Ravn-Hackaton
//
//  Created by Edson Lipa Urbina on 1/10/22.
//

import SwiftUI

struct WelcomeBackView: View {
    var body: some View {
        ZStack {
            Color("defaultBackground")
                .ignoresSafeArea(.all)

            VStack {
                Image("logo")
                Text("Welcome Back")
                    .bold()
                    .font(.title)

                Text(
                    "Choose a workspace below to get back to working with your team."
                )
                .foregroundColor(.gray)
                .font(.subheadline)
                .padding(.vertical, 24)

                NavigationLink(destination: ReservationsView()) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Ravn")
                                .foregroundColor(.black)
                                .font(.title3)
                                .bold()

                            HStack{
                                Image("Users")
                                Text("38 Members")
                                    .foregroundColor(.gray)
                            }
                        }
                        Spacer()

                        Image("Arrow")
                    }
                    .padding(.all)
                    .overlay {
                        RoundedRectangle(cornerRadius: 1)
                            .stroke(Color.gray, lineWidth: 1)
                    }
                }

                NavigationLink(destination: LoginView()) {
                    Button("Try a different email", action: {})
                        .padding(.all)
                }

            }
            .padding(.horizontal, 16)
            .navigationBarHidden(true)

        }
    }
}

struct WelcomeBackView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeBackView()
    }
}
