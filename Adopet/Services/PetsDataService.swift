//
//  PetsDataService.swift
//  Adopet
//
//  Created by Caio Luna on 06/10/25.
//

import Foundation

protocol PetsDataServiceDelegate: AnyObject {
	func didFetchPetsSuccessfully(_ pets: [Pet])
	func didFailWithError(_ error: NetworkError)
}

class PetsDataService {
	
	weak var delegate: PetsDataServiceDelegate?
	
	private var networkService: NetworkProtocol = URLSessionNetwork()
	
	func fetchPets() {
		
		guard let url = URL(string: "https://my-json-server.typicode.com/giovannamoeller/pets-api/pets") else { return }
		
		networkService.request(url) { [weak self] (result: Result<[Pet], NetworkError>) in
			DispatchQueue.main.async {
				switch result {
				case .success(let pets):
					self?.delegate?.didFetchPetsSuccessfully(pets)
				case .failure(let failure):
					self?.delegate?.didFailWithError(failure)
				}
			}
		}
	}
}
