//
//  LoginViewModel.swift
//  Ravn-Hackaton
//
//  Created by Edson Lipa Urbina on 1/10/22.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    enum State: Equatable {
        case idle
        case loading
        case invalidEmail
        case error(message: String)
        case biometricsError
        case success
        case userBlocked

        var isError: Bool {
            switch self {
            case .error:
                return true
            default:
                return false
            }
        }
    }

    // MARK: - Public vars
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var state: State = .idle

    init() {

    }
}
