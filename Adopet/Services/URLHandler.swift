//
//  URLHandler.swift
//  Adopet
//
//  Created by Caio Luna on 06/10/25.
//

import UIKit

class URLHandler {
	func openUrl(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:], completionHandler completion: (@MainActor (Bool) -> Void)? = nil) {
		return UIApplication.shared.open(url, options: options, completionHandler: completion)
	}
	
	func canOpenUrl(_ url: URL) -> Bool {
		return UIApplication.shared.canOpenURL(url)
	}
}
