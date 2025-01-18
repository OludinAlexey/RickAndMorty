//
//  DescriptionLabelsView.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 14.01.2025.
//

import UIKit

final class DescriptionLabelsView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private let titleFont: UIFont = R.font.inter28ptBold(size: 20)!
    private let valueFont: UIFont = R.font.inter28ptRegular(size: 20)!
    
    private lazy var planetTitleLabel: UILabel = UILabel.getLabel("Planet:", font: titleFont, textColor: .black)
    private lazy var nameTitleLabel: UILabel = UILabel.getLabel("Name:", font: titleFont, textColor: .black)

    private lazy var planetLabel: UILabel = UILabel.getLabel("Earth", font: valueFont, textColor: .black)
    private lazy var nameLabel: UILabel = UILabel.getLabel("Morty Smith", font: valueFont, textColor: .black)

    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    // MARK: - Public methods
    
    // MARK: - Actions
    
    @objc private func someAction() {
        
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        backgroundColor = R.color.green()
        addSubviews()
        setupLayout()
    }
    
    private func addSubviews() {
        [ planetTitleLabel, nameTitleLabel, planetLabel, nameLabel ] .forEach { addSubview($0) }
    }
    
    private func setupLayout() {
        toAutoLayout()
        NSLayoutConstraint.activate([
            planetTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14.fitW),
            planetTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14.fitW),
            planetTitleLabel.heightAnchor.constraint(equalToConstant: 25.fitH),
            planetTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 18.fitH)
        ])
        
        NSLayoutConstraint.activate([
            planetLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14.fitW),
            planetLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14.fitW),
            planetLabel.heightAnchor.constraint(equalToConstant: 25.fitH),
            planetLabel.topAnchor.constraint(equalTo: planetTitleLabel.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.fitW),
            nameTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14.fitW),
            nameTitleLabel.heightAnchor.constraint(equalToConstant: 25.fitH),
            nameTitleLabel.topAnchor.constraint(equalTo: planetLabel.bottomAnchor, constant: 10.fitH)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14.fitW),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14.fitW),
            nameLabel.heightAnchor.constraint(equalToConstant: 25.fitH),
            nameLabel.topAnchor.constraint(equalTo: nameTitleLabel.bottomAnchor)
        ])
    }
}
