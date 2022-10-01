//
//  ReservationsView.swift
//  Ravn-Hackaton
//
//  Created by Edson Lipa Urbina on 1/10/22.
//

import SwiftUI

struct ReservationsView: View {
    @State var office: String = "Peru"
    @State var floor: String = "1st Floor"
    @State var roomSelected: String?

    var body: some View {
        ZStack {
            Color("defaultBackground")
                .ignoresSafeArea(.all)

            if office == "Peru", floor == "1st Floor" {
                officeMap
                    .padding(.horizontal, 16)
            }

            VStack {
                HStack {
                    Picker("Office", selection: $office) {
                        Text("Peru Office")
                            .tag("Peru")
                        Text("El Salvaddo Office")
                            .tag("El Salvador")
                        Text("American Fork Office")
                            .tag("American Fork")
                    }
                    .tint(Color.primaryColor)

                    Spacer()

                    Picker("Floor", selection: $floor) {
                        Text("1st Floor")
                            .tag("1st Floor")
                        Text("2st Floor")
                            .tag("2st Floor")
                    }
                }
                Divider()

                Spacer()
            }
            .padding(.horizontal, 16)
            .toolbar {
                Image("avatarCircular")
                    .padding(.leading)

            }

        }
    }

    var officeMap: some View {
        VStack(spacing: .zero) {
            HStack(spacing: .zero) {
                drawRoom(height: 130, name: "Area 1")
                drawRoom(height: 130, name: "Area 2")
            }

            HStack(alignment: .top, spacing: .zero) {
                drawRoom(height: 100, name: "Area 3")
                drawRoom(height: 130, name: "Area 4")
            }
            drawRoom(height: 130, name: "Main Metting Room")
        }
    }

    private func drawRoom(height: CGFloat, name: String) -> some View {
        ZStack {
            NavigationLink(destination: SelectTimeView(title: name)) {
                RoundedRectangle(cornerRadius: 0)
                    .stroke(Color.secondaryColor, lineWidth: 3)
                    .frame(height: height)
                    .background(roomSelected == name ?  Color.secondaryColor.opacity(0.25) : Color.defaultBackground)
            }

            Text(name)
                .bold()
        }
        .onTapGesture {
            roomSelected = name
        }

    }
}

struct ReservationsView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationsView()
    }
}
