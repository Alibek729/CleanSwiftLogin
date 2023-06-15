//
//  LoginModels.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 14.06.2023.
//

import Foundation

enum LoginModels {

	struct Request {
		var login: String
		var password: String
	}

	struct Responce {
		var success: Bool
		var login: String
		var lastLoginDate: Date
	}

	struct ViewModel {
		var success: Bool
		var userName: String
		var lastLoginDate: String
	}
}
