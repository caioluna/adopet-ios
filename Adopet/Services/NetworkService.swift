//
//  NetworkService.swift
//  Adopet
//
//  Created by Caio Luna on 07/10/25.
//

import Foundation

enum NetworkError: Error {
	case networkError(Error)
	case dataUnavailable
	case decodingError(Error)
	case urlUnavailable
}

protocol NetworkProtocol {
	func request<T: Decodable>(_ url: URL, completion: @escaping (Result<T, NetworkError>) -> Void)
}

class URLSessionNetwork: NetworkProtocol {
	func request<T>(_ url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable {
		URLSession.shared.dataTask(with: url) { (responseData, _, error) in
			if let error {
				completion(.failure(.networkError(error)))
				return
			}
			
			guard let data = responseData else {
				completion(.failure(.dataUnavailable))
				return
			}
			
			do {
				let result = try JSONDecoder().decode(T.self, from: data)
				completion(.success(result))
			} catch {
				completion(.failure(.decodingError(error)))
			}
		}.resume()
	}
	
	
}
