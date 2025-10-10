//
//  PetsListViewController.swift
//  Adopet
//
//  Created by Giovanna Moeller on 13/02/24.
//

import UIKit

class PetsListViewController: UIViewController {
	
	var data: [Pet] = []
	private var dataService = PetsDataService()
	
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.delegate = self
		tableView.dataSource = self
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.separatorColor = .clear
		tableView.insetsContentViewsToSafeArea = false
		tableView.register(UINib(nibName: "PetTableViewCell", bundle: nil), forCellReuseIdentifier: "PetTableViewCell")
		return tableView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		dataService.delegate = self
		
		setupView()
		addSubviews()
		setupTableHeaderView()
		setupNavigationBarButton()
		fetchAllPets()
	}
	
	private func setupView() {
		navigationItem.hidesBackButton = true
		view.backgroundColor = .white
	}
	
	private func addSubviews() {
		view.addSubview(tableView)
	}
	
	private func setupTableHeaderView() {
		self.tableView.tableHeaderView = TableHeaderView(frame: .init(x: 0, y: 0, width: view.frame.size.width, height: 200))
	}
	
	private func setupNavigationBarButton() {
		let backItem = UIBarButtonItem()
		backItem.title = "Pets"
		backItem.tintColor = .white
		navigationItem.backBarButtonItem = backItem
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: -view.safeAreaInsets.top),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
		])
	}
	
	private func fetchAllPets() {
		dataService.fetchPets()
	}
	
	override func viewSafeAreaInsetsDidChange() {
		setupConstraints()
	}
}

// MARK: - DataService Delegate

extension PetsListViewController: PetsDataServiceDelegate {
	func didFetchPetsSuccessfully(_ pets: [Pet]) {
		self.data = pets
		tableView.reloadData()
	}
	
	func didFailWithError(_ error: NetworkError) {
		print(error)
	}
}

// MARK: - Table View Datasource & Delegate

extension PetsListViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "PetTableViewCell", for: indexPath) as? PetTableViewCell else {
			return UITableViewCell()
		}
		
		cell.set(pet: data[indexPath.row])
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		navigationController?.pushViewController(PetDetailsViewController(pet: data[indexPath.row]), animated: true)
	}
}
