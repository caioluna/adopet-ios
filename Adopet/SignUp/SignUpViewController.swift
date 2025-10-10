//
//  SignUpViewController.swift
//  Adopet
//
//  Created by Giovanna Moeller on 13/02/24.
//

import UIKit

class SignUpViewController: UIViewController {
	
	private let userManager = UserManager()
	
	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		return scrollView
	}()
	
	private lazy var contentView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var topGreenShapeImageView: UIImageView = {
		let imageView = UIImageView(image: UIImage(named: "shape-1"))
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	private lazy var pawsImageView: UIImageView = {
		let imageView = UIImageView(image: UIImage(named: "paws"))
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	private lazy var signUpLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = Constants.hasNoAccount
		label.font = .init(name: "Poppins", size: 16)
		label.numberOfLines = 0
		label.textColor = UIColor(named: "ColorBlue")
		label.textAlignment = .center
		return label
	}()
	
	private lazy var nameInputField: LabeledTextField = {
		return LabeledTextField(title: Constants.nameLabel, placeholder: "Digite seu nome completo")
	}()
	
	private lazy var emailInputField: LabeledTextField = {
		let inputField = LabeledTextField(title: Constants.emailLabel, placeholder: "Escolha seu melhor email")
		inputField.textField.addTarget(self, action: #selector(textFieldChanging(_:)), for: .editingChanged)
		inputField.textField.keyboardType = .emailAddress
		return inputField
	}()
	
	private lazy var phoneInputField: LabeledTextField = {
		let inputField = LabeledTextField(title: Constants.phoneLabel, placeholder: "Insira seu telefone/whatsapp")
		inputField.textField.keyboardType = .phonePad
		return inputField
	}()
	
	private lazy var passwordInputField: LabeledTextField = {
		return LabeledTextField(title: Constants.passwordLabel, placeholder: "Crie uma senha", isSecureTextEntry: true)
	}()
	
	private lazy var stackView: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [nameInputField, emailInputField, phoneInputField, passwordInputField])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.alignment = .fill
		stack.distribution = .equalSpacing
		stack.spacing = LayoutConstants.viewSpacing
		stack.axis = .vertical
		return stack
	}()
	
	private lazy var signUpButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle(Constants.signUpButtonTitle, for: .normal)
		button.backgroundColor = UIColor(named: "ColorCoral")
		button.titleLabel?.font = .init(name: "Poppins-Bold", size: 18)
		button.layer.cornerRadius = LayoutConstants.buttonCornerRadius
		button.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
		return button
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		addSubviews()
		setupContraints()
	}
	
	private func setupView() {
		view.backgroundColor = .white
		navigationItem.hidesBackButton = true
	}
	
	private func addSubviews() {
		view.addSubview(scrollView)
		
		scrollView.addSubview(contentView)
		scrollView.contentInsetAdjustmentBehavior = .never
		
		contentView.addSubview(topGreenShapeImageView)
		contentView.addSubview(signUpLabel)
		contentView.addSubview(stackView)
		contentView.addSubview(signUpButton)
		contentView.addSubview(pawsImageView)
	}
	
	private func setupContraints() {
		NSLayoutConstraint.activate([
			
			scrollView.topAnchor.constraint(equalTo: view.topAnchor),
			scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			
			contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
			contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			
			contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
			
		])
		
		NSLayoutConstraint.activate([
			
			pawsImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			pawsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			
			topGreenShapeImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			topGreenShapeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			topGreenShapeImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			
			signUpLabel.topAnchor.constraint(equalTo: topGreenShapeImageView.bottomAnchor, constant: -120),
			signUpLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 64),
			signUpLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -64),
			
			stackView.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: LayoutConstants.standardMargin),
			stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutConstants.standardMargin),
			stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -LayoutConstants.standardMargin),
			
			signUpButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 88),
			signUpButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -88),
			signUpButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: LayoutConstants.standardMargin),
			signUpButton.heightAnchor.constraint(equalToConstant: LayoutConstants.buttonHeight),
			
			signUpButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -LayoutConstants.standardMargin)
		])
	}
	
	@objc
	func didTapSignUpButton() {
		
		guard let name = nameInputField.textField.text,
					let email = emailInputField.textField.text,
					let phoneNumber = phoneInputField.textField.text,
					let password =  passwordInputField.textField.text else { return }
		
		let userData = CreateUserAccountModel(name: name, email: email, phoneNumber: phoneNumber, password: password)
		
		userManager.saveUser(userData: userData)
		
		navigationController?.pushViewController(SignInViewController(authenticationManager: GoogleAuthenticationProvider()), animated: true)
	}
	
	@objc
	func textFieldChanging(_ textField: UITextField) {
		guard let text = textField.text else {
			textField.layer.borderColor = UIColor.red.cgColor
			textField.layer.borderWidth = 1.0
			return
		}
		if text.contains("@") {
			textField.layer.borderColor = UIColor.clear.cgColor
			textField.layer.borderWidth = 0.0
		} else {
			textField.layer.borderColor = UIColor.red.cgColor
			textField.layer.borderWidth = 1.0
		}
	}
}
