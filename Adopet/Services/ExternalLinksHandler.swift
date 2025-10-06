//
//  ExternalLinksHandler.swift
//  Adopet
//
//  Created by Caio Luna on 06/10/25.
//

import Foundation

class ExternalLinksHandler {
	
	private var urlHandler = URLHandler()
	
	func openPhoneUrl(phoneNumber: String) {
		if let phoneUrl = URL(string: "tel://\(phoneNumber)") {
			urlHandler.openUrl(phoneUrl)
		}
	}
	
	func openWhatsappUrl(phoneNumber: String, message: String) {
		guard let whatsappURL = URL(string: "whatsapp://send?phone=\(phoneNumber)&text=\(message)") else { return }
		
		if urlHandler.canOpenUrl(whatsappURL) {
			urlHandler.openUrl(whatsappURL)
		} else {
			openWhatsappInAppStore()
		}
	}
	
	func openWhatsappInAppStore() {
		guard let appStoreURL = URL(string: "https://apps.apple.com/app/whatsapp-messenger/id310633997") else { return }
		urlHandler.openUrl(appStoreURL)
	}
}
