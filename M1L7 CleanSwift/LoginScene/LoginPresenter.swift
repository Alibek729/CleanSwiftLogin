//
//  LoginPresenter.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 14.06.2023.
//

import Foundation

protocol ILoginPresenter {
	func present(responce: LoginModels.Responce)
}

class LoginPresenter: ILoginPresenter {

	private weak var viewController: ILoginViewController?

	init(viewController: ILoginViewController?) {
		self.viewController = viewController
	}
	
	func present(responce: LoginModels.Responce) {
		let viewModel = LoginModels.ViewModel(
			success: responce.success,
			userName: responce.login,
			lastLoginDate: "\(responce.lastLoginDate.formatted())"
		)

		viewController?.render(viewModel: viewModel)
	}
}
