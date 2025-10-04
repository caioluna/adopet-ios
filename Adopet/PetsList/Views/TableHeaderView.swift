//
//  TableHeaderView.swift
//  Adopet
//
//  Created by Giovanna Moeller on 20/02/24.
//

import UIKit

class TableHeaderView: UIView {
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Olá! Veja os amigos disponíveis para adoção!"
		label.font = .init(name: "Poppins", size: 16)
		label.numberOfLines = 0
		label.textAlignment = .center
		label.textColor = UIColor(named: "ColorBlue")
		return label
	}()
	
	private lazy var topGreenShapeImageView: UIImageView = {
		let imageView = UIImageView(image: UIImage(named: "shape-1"))
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubviews()
		setupConstraints()
	}
	
	private func addSubviews() {
		addSubview(topGreenShapeImageView)
		addSubview(titleLabel)
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			topGreenShapeImageView.topAnchor.constraint(equalTo: topAnchor),
			topGreenShapeImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
			topGreenShapeImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
			
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
			titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
