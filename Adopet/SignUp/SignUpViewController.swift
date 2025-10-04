//
//  SignUpViewController.swift
//  Adopet
//
//  Created by Giovanna Moeller on 13/02/24.
//

import UIKit

class SignUpViewController: UIViewController {
	
	private let db = DataManager()
	
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
		label.text = "Ainda não tem cadastro? Então, antes de buscar seu melhor amigo, precisamos de alguns dados:"
		label.font = .init(name: "Poppins", size: 16)
		label.numberOfLines = 0
		label.textColor = UIColor(named: "ColorBlue")
		label.textAlignment = .center
		return label
	}()
	
	private lazy var nameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Nome"
		label.font = .init(name: "Poppins", size: 16)
		label.numberOfLines = 0
		label.textColor = UIColor(named: "ColorGray")
		return label
	}()
	
	private lazy var nameTextField: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.placeholder = "Digite seu nome completo"
		textField.font = .init(name: "Poppins", size: 16)
		textField.backgroundColor = UIColor(named: "ColorLightGray")
		textField.layer.cornerRadius = 8
		textField.layer.shadowOffset = .init(width: 0, height: 2)
		textField.layer.shadowOpacity = 0.25
		textField.layer.shadowColor = UIColor(named: "ColorGray")?.cgColor
		textField.layer.shadowRadius = 0
		textField.setLeftPaddingPoints(15)
		return textField
	}()
	
	private lazy var emailLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Email"
		label.font = .init(name: "Poppins", size: 16)
		label.numberOfLines = 0
		label.textColor = UIColor(named: "ColorGray")
		return label
	}()
	
	private lazy var emailTextField: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.placeholder = "Escolha seu melhor email"
		textField.font = .init(name: "Poppins", size: 16)
		textField.backgroundColor = UIColor(named: "ColorLightGray")
		textField.layer.cornerRadius = 8
		textField.layer.shadowOffset = .init(width: 0, height: 2)
		textField.layer.shadowOpacity = 0.25
		textField.layer.shadowColor = UIColor(named: "ColorGray")?.cgColor
		textField.layer.shadowRadius = 0
		textField.setLeftPaddingPoints(15)
		textField.addTarget(self, action: #selector(textFieldChanging(_:)), for: .editingChanged)
		return textField
	}()
	
	private lazy var telefoneLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Telefone com DDD"
		label.font = .init(name: "Poppins", size: 16)
		label.numberOfLines = 0
		label.textColor = UIColor(named: "ColorGray")
		return label
	}()
	
	private lazy var phoneNumberTextField: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.placeholder = "Insira seu telefone/whatsapp"
		textField.font = .init(name: "Poppins", size: 16)
		textField.backgroundColor = UIColor(named: "ColorLightGray")
		textField.layer.cornerRadius = 8
		textField.layer.shadowOffset = .init(width: 0, height: 2)
		textField.layer.shadowOpacity = 0.25
		textField.layer.shadowColor = UIColor(named: "ColorGray")?.cgColor
		textField.layer.shadowRadius = 0
		textField.setLeftPaddingPoints(15)
		return textField
	}()
	
	private lazy var passwordLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Senha"
		label.font = .init(name: "Poppins", size: 16)
		label.numberOfLines = 0
		label.textColor = UIColor(named: "ColorGray")
		return label
	}()
	
	private lazy var passwordTextField: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.placeholder = "Crie uma senha"
		textField.font = .init(name: "Poppins", size: 16)
		textField.backgroundColor = UIColor(named: "ColorLightGray")
		textField.layer.cornerRadius = 8
		textField.layer.shadowOffset = .init(width: 0, height: 2)
		textField.layer.shadowOpacity = 0.25
		textField.layer.shadowColor = UIColor(named: "ColorGray")?.cgColor
		textField.layer.shadowRadius = 0
		textField.isSecureTextEntry = true
		textField.setLeftPaddingPoints(15)
		return textField
	}()
	
	private lazy var stackView: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [nameLabel, nameTextField, emailLabel, emailTextField, telefoneLabel, phoneNumberTextField, passwordLabel, passwordTextField])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.alignment = .fill
		stack.distribution = .equalSpacing
		stack.spacing = 16
		stack.axis = .vertical
		return stack
	}()
	
	private lazy var signUpButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Cadastrar", for: .normal)
		button.backgroundColor = UIColor(named: "ColorCoral")
		button.titleLabel?.font = .init(name: "Poppins-Bold", size: 18)
		button.layer.cornerRadius = 8
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
			
			stackView.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 32),
			stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
			stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
			
			nameTextField.heightAnchor.constraint(equalToConstant: 48),
			phoneNumberTextField.heightAnchor.constraint(equalToConstant: 48),
			emailTextField.heightAnchor.constraint(equalToConstant: 48),
			passwordTextField.heightAnchor.constraint(equalToConstant: 48),
			
			signUpButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 88),
			signUpButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -88),
			signUpButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 32),
			signUpButton.heightAnchor.constraint(equalToConstant: 48),
			
			signUpButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32)
		])
	}
	
	@objc
	func didTapSignUpButton() {
		
		guard let name = nameTextField.text,
					let email = emailTextField.text,
					let phoneNumber = phoneNumberTextField.text,
					let password =  passwordTextField.text else { return }
		
		let userData = CreateUserAccountModel(name: name, email: email, phoneNumber: phoneNumber, password: password)
		
		db.saveUser(userData: userData)
		
		navigationController?.pushViewController(SignInViewController(), animated: true)
	}
	
	@objc
	func textFieldChanging(_ textField: UITextField) {
		guard let txt = textField.text else {
			textField.layer.borderColor = UIColor.red.cgColor
			textField.layer.borderWidth = 1.0
			return
		}
		if txt.contains("@") {
			textField.layer.borderColor = UIColor.clear.cgColor
			textField.layer.borderWidth = 0.0
		} else {
			textField.layer.borderColor = UIColor.red.cgColor
			textField.layer.borderWidth = 1.0
		}
	}
}
