//
//  LoginWorker.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 14.06.2023.
//

import Foundation

public struct LoginDTO {
	var success: Int
	var login: String
	var lastLoginDate: Date
}

protocol ILoginWorker {
	func login(login: String, password: String) -> LoginDTO
}

class LoginWorker: ILoginWorker {
	func login(login: String, password: String) -> LoginDTO {

		if login == "hello@mail.ru" && password == "123" {
			return LoginDTO(
				success: 1,
				login: login,
				lastLoginDate: Date()
			)
		} else {
			return LoginDTO(
				success: 0,
				login: login,
				lastLoginDate: Date()
			)
		}
	}
}
