//
//  Constants.swift
//  Adopet
//
//  Created by Caio Luna on 04/10/25.
//

import Foundation

enum Constants {
	static let hasNoAccount = "Ainda não tem cadastro? Então, antes de buscar seu melhor amigo, precisamos de alguns dados:"
	static let hasAccount = "Já tem conta? Faça seu login"
	static let nameLabel = "Nome"
	static let phoneLabel = "Telefone com DDD"
	static let emailLabel = "Email"
	static let passwordLabel = "Senha"
	static let signInButtonTitle = "Entrar"
	static let signUpButtonTitle = "Cadastrar"
}

enum LayoutConstants {
	static let standardMargin: CGFloat = 32
	static let viewSpacing: CGFloat = 16
	
	static let buttonHeight: CGFloat = 48
	static let buttonCornerRadius: CGFloat = 8
	
	static let smallIconSize: CGSize = CGSize(width: 24.0, height: 24.0)
	static let largeIconSize: CGSize = CGSize(width: 36.0, height: 36.0)
}
