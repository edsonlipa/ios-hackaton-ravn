//
//  SelectTimeView.swift
//  Ravn-Hackaton
//
//  Created by Edson Lipa Urbina on 1/10/22.
//

import SwiftUI

struct TimeOption: Identifiable {
    let starTime: String
    var user: String?
    let timeLapse: String

    var id: String {
        starTime
    }

    var hasUser: Bool {
        user != nil
    }
}

struct SelectTimeView: View {
    @State var title: String
    @State var timeOptions: [TimeOption] = TimeOption.mockTimeOptionArray
    @State var date: Date = Date()

    var body: some View {
        ZStack {
            Color.defaultBackground
                .ignoresSafeArea(.all)

            VStack {
                LazyVStack {
                    Text("Select a Time")
                        .bold()

                    Text("Duration 30 min")
                        .font(.caption)
                        .foregroundColor(.black.opacity(0.7))

                    ForEach(timeOptions) { timeOption in
                        TimeOptionView(option: timeOption)
                    }

                }
                .navigationTitle(title)
                .toolbar {
                    DatePicker("", selection: $date, displayedComponents: [.date])
                }

                Spacer()
            }
            .padding(.horizontal, 16)
        }
    }
}

struct TimeOptionView: View {
    @State var option: TimeOption
    @State var toConfirm: Bool = false

    var body: some View {
        ZStack {
            if toConfirm {
                HStack {
                    Button(action: {
                        toConfirm = false
                    }) {
                        Text("Cancel")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.primaryColor)
                    Spacer()

                    Text(option.timeLapse)

                    Spacer()

                    Button(action: {
                        toConfirm = false
                        option.user = "My User"
                    }) {
                        Text("Confirm")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color("PimaryColor"))

                }
            } else {
                ZStack {
                    if option.user != nil {
                        HStack {
                            Image("avatarCircular")
                                .padding(.leading)

                            Spacer()
                        }
                    }

                    Text(option.starTime)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .foregroundColor(option.hasUser ? .black.opacity(0.7) : .primaryColor)
                }
                .frame(height: 40)
                .background(option.user != nil ? .gray.opacity(0.1) : Color.defaultBackground)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(option.hasUser ? Color.gray : .primaryColor, lineWidth: 1)

                }
                .onTapGesture {
                    if option.user == nil {
                        toConfirm = true
                    }
                }
            }
        }
    }
}

struct SelectTimeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectTimeView(title: "Areea 1")
    }
}

extension TimeOption {
    static var mockTimeOptionArray: [TimeOption] {
        [
            .init(starTime: "09:00", user: nil, timeLapse: "09:00 - 09:30"),
            .init(starTime: "09:30", user: nil, timeLapse: "09:30 - 10:00"),
            .init(starTime: "10:00", user: nil, timeLapse: "10:00 - 10:30"),
            .init(starTime: "10:30", user: nil, timeLapse: "10:30 - 11:00"),
            .init(starTime: "11:00", user: nil, timeLapse: "11:00 - 11:30"),
            .init(starTime: "11:30", user: "My User", timeLapse: "11:30 - 12:00"),
            .init(starTime: "12:00", user: nil, timeLapse: "12:00 - 12:30"),
            .init(starTime: "12:30", user: nil, timeLapse: "12:30 - 13:00"),
            .init(starTime: "13:00", user: "Other User", timeLapse: "13:00 - 13:30"),
            .init(starTime: "13:300", user: nil, timeLapse: "11:00 - 11:30"),

        ]
    }
}
