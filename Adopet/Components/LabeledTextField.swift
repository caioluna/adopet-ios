//
//  LabeledTextField.swift
//  Adopet
//
//  Created by Caio Luna on 04/10/25.
//

import UIKit

class LabeledTextField: UIView {
	
	private var title: String
	private var placeholder: String
	private var isSecureTextEntry: Bool
	
	init(title: String, placeholder: String, isSecureTextEntry: Bool = false) {
		self.title = title
		self.placeholder = placeholder
		self.isSecureTextEntry = isSecureTextEntry
		
		super.init(frame: .zero)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private lazy var label: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .init(name: "Poppins", size: 16)
		label.numberOfLines = 0
		label.textColor = UIColor(named: "ColorGray")
		return label
	}()
	
	lazy var textField: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.font = .init(name: "Poppins", size: 16)
		textField.backgroundColor = UIColor(named: "ColorLightGray")
		textField.layer.cornerRadius = LayoutConstants.buttonCornerRadius
		textField.layer.shadowOffset = .init(width: 0, height: 2)
		textField.layer.shadowOpacity = 0.25
		textField.layer.shadowColor = UIColor(named: "ColorGray")?.cgColor
		textField.layer.shadowRadius = 0
		textField.setLeftPaddingPoints(15)
		return textField
	}()
	
	private func setupView() {
		updateUI()
		addSubviews()
		setupConstraints()
	}
	
	private func updateUI() {
		label.text = title
		textField.placeholder = placeholder
		textField.isSecureTextEntry = isSecureTextEntry
	}
	
	private func addSubviews() {
		addSubview(label)
		addSubview(textField)
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			
			label.topAnchor.constraint(equalTo: topAnchor),
			label.leadingAnchor.constraint(equalTo: leadingAnchor),
			label.trailingAnchor.constraint(equalTo: trailingAnchor),
			
			textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
			textField.leadingAnchor.constraint(equalTo: leadingAnchor),
			textField.trailingAnchor.constraint(equalTo: trailingAnchor),
			textField.bottomAnchor.constraint(equalTo: bottomAnchor),
			textField.heightAnchor.constraint(equalToConstant: LayoutConstants.buttonHeight),
			
		])
	}
}
