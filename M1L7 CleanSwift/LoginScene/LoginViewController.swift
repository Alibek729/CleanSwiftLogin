//
//  LoginViewController.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 14.06.2023.
//

import UIKit

protocol ILoginViewController: AnyObject {
	func render(viewModel: LoginModels.ViewModel)
}

class LoginViewController: UIViewController {

	private var interactor: ILoginInteractor?

	@IBOutlet weak var textFieldLogin: UITextField!
	@IBOutlet weak var textFieldPassword: UITextField!

	override func viewDidLoad() {
        super.viewDidLoad()
		assembly()
    }

	@IBAction func loginPressed(_ sender: UIButton) {

		if let email = textFieldLogin.text, let password = textFieldPassword.text {
			let request = LoginModels.Request(login: email, password: password)
			interactor?.login(request: request)
		}
	}

	private func assembly() {
		let worker = LoginWorker()
		let presenter = LoginPresenter(viewController: self)
		interactor = LoginInteractor(worker: worker, presenter: presenter)
	}
}

extension LoginViewController: ILoginViewController {
	func render(viewModel: LoginModels.ViewModel) {

		let alert: UIAlertController

		if viewModel.success {
			alert = UIAlertController(
				title: "Success",
				message: viewModel.userName,
				preferredStyle: .alert
			)
		} else {
			alert = UIAlertController(
				title: "Error",
				message: "",
				preferredStyle: .alert
			)
		}

		let action = UIAlertAction(title: "Ok", style: .default)
		alert.addAction(action)
		present(alert, animated: true, completion: nil)
	}
}
