//
//  PetsDataService.swift
//  Adopet
//
//  Created by Caio Luna on 06/10/25.
//

import Foundation

class PetsDataService {
	
	private var networkService: NetworkProtocol = URLSessionNetwork()
	
	func fetchPets(completion: @escaping (Result<[Pet], NetworkError>) -> Void) {
		
		guard let url = URL(string: "https://my-json-server.typicode.com/giovannamoeller/pets-api/pets") else { return }
		
		networkService.request(url, completion: completion)
	}
}
