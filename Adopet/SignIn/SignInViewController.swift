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
		label.text = "Já tem conta? Faça seu login:"
		label.font = .init(name: "Poppins", size: 16)
		label.numberOfLines = 0
		label.textAlignment = .center
		label.textColor = UIColor(named: "ColorBlue")
		return label
	}()
	
	private lazy var emailLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Email"
		label.font = .init(name: "Poppins", size: 16)
		label.numberOfLines = 0
		label.textAlignment = .center
		label.textColor = UIColor(named: "ColorGray")
		return label
	}()
	
	private lazy var emailTextField: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.placeholder = "Insira seu email"
		textField.font = .init(name: "Poppins", size: 16)
		textField.textAlignment = .center
		textField.backgroundColor = UIColor(named: "ColorLightGray")
		textField.layer.cornerRadius = 8
		textField.layer.shadowOffset = .init(width: 0, height: 2)
		textField.layer.shadowOpacity = 0.25
		textField.layer.shadowColor = UIColor(named: "ColorGray")?.cgColor
		textField.layer.shadowRadius = 0
		return textField
	}()
	
	private lazy var passwordLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Senha"
		label.font = .init(name: "Poppins", size: 16)
		label.numberOfLines = 0
		label.textAlignment = .center
		label.textColor = UIColor(named: "ColorGray")
		return label
	}()
	
	private lazy var passwordTextField: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.placeholder = "Crie uma senha"
		textField.font = .init(name: "Poppins", size: 16)
		textField.textAlignment = .center
		textField.backgroundColor = UIColor(named: "ColorLightGray")
		textField.layer.cornerRadius = 8
		textField.layer.shadowOffset = .init(width: 0, height: 2)
		textField.layer.shadowOpacity = 0.25
		textField.layer.shadowColor = UIColor(named: "ColorGray")?.cgColor
		textField.layer.shadowRadius = 0
		textField.rightViewMode = .always
		return textField
	}()
	
	private lazy var stackView: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [emailLabel, emailTextField, passwordLabel, passwordTextField])
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
		button.setTitle("Entrar", for: .normal)
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
			
			emailTextField.heightAnchor.constraint(equalToConstant: 48),
			passwordTextField.heightAnchor.constraint(equalToConstant: 48),
			
			signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88),
			signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -88),
			signInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 32),
			signInButton.heightAnchor.constraint(equalToConstant: 48),
			
		])
	}
	
	@objc func signIn() {
		guard let email = emailTextField.text,
					let password = passwordTextField.text else { return	}
		
		print(email, password)
		
		navigationController?.pushViewController(PetsListViewController(), animated: true)
	}
}
