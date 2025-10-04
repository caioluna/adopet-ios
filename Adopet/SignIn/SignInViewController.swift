//
//  SignInViewController.swift
//  Adopet
//
//  Created by Giovanna Moeller on 12/02/24.
//

import UIKit

class SignInViewController: UIViewController {
	
	private lazy var pawsImageView: UIImageView = {
		let imageView = UIImageView(image: UIImage(named: "paws"))
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	private lazy var topGreenShapeImageView: UIImageView = {
		let imageView = UIImageView(image: UIImage(named: "shape-1"))
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	private lazy var lateralGreenShapeImageView: UIImageView = {
		let image = UIImage(named: "shape-2")?.withHorizontallyFlippedOrientation()
		let imageView = UIImageView(image: image)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	private lazy var logoImageView: UIImageView = {
		let imageView = UIImageView(image: UIImage(named: "logo-blue"))
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	private lazy var subtitleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = Constants.hasAccount
		label.font = .init(name: "Poppins", size: 16)
		label.numberOfLines = 0
		label.textAlignment = .center
		label.textColor = UIColor(named: "ColorBlue")
		return label
	}()
	
	private lazy var emailInputField: LabeledTextField = {
		let inputField = LabeledTextField(title: Constants.emailLabel, placeholder: "Insira seu email")
		inputField.textField.keyboardType = .emailAddress
		return inputField
	}()
	
	private lazy var passwordInputField: LabeledTextField = {
		return LabeledTextField(title: Constants.passwordLabel, placeholder: "Insira sua senha", isSecureTextEntry: true)
	}()
	
	private lazy var stackView: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [emailInputField, passwordInputField])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.alignment = .fill
		stack.distribution = .equalSpacing
		stack.spacing = 16
		stack.axis = .vertical
		return stack
	}()
	
	private lazy var signInButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle(Constants.signInButtonTitle, for: .normal)
		button.backgroundColor = UIColor(named: "ColorCoral")
		button.titleLabel?.font = .init(name: "Poppins-Bold", size: 18)
		button.layer.cornerRadius = 8
		button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
		return button
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		addSubViews()
		setupContraints()
	}
	
	private func setupView() {
		navigationItem.hidesBackButton = true
		view.backgroundColor = .white
	}
	
	private func addSubViews() {
		view.addSubview(topGreenShapeImageView)
		view.addSubview(lateralGreenShapeImageView)
		view.addSubview(pawsImageView)
		view.addSubview(logoImageView)
		view.addSubview(subtitleLabel)
		view.addSubview(stackView)
		view.addSubview(signInButton)
	}
	
	private func setupContraints() {
		NSLayoutConstraint.activate([
			lateralGreenShapeImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -48),
			
			logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			logoImageView.topAnchor.constraint(equalTo: topGreenShapeImageView.bottomAnchor, constant: -108),
			
			subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
			subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
			subtitleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 32),
			
			pawsImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			
			stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
			stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
			stackView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 32),
			
			signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88),
			signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -88),
			signInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 32),
			signInButton.heightAnchor.constraint(equalToConstant: 48),
			
		])
	}
	
	@objc func signIn() {
		guard let email = emailInputField.textField.text,
					let password = passwordInputField.textField.text else { return	}
		
		print(email, password)
		
		navigationController?.pushViewController(PetsListViewController(), animated: true)
	}
}
