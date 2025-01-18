//
//  FavoritesLabelsView.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 15.01.2025.
//

import UIKit

final class FavoritesLabelsView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private let titleFont: UIFont = R.font.inter28ptBold(size: 20)!
    private let valueFont: UIFont = R.font.inter28ptRegular(size: 20)!
    
    private lazy var nameTitleLabel: UILabel = UILabel.getLabel("Name:", font: titleFont, textColor: .black)
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
    
    // MARK: - Private methods
    
    private func setupUI() {
        backgroundColor = R.color.green()
        addSubviews()
        setupLayout()
    }
    
    private func addSubviews() {
        [ nameTitleLabel, nameLabel ] .forEach { addSubview($0) }
    }
    
    private func setupLayout() {
        toAutoLayout()
        
        NSLayoutConstraint.activate([
            nameTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14.fitW),
            nameTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14.fitW),
            nameTitleLabel.heightAnchor.constraint(equalToConstant: 30.fitH),
            nameTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7.fitH)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14.fitW),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14.fitW),
            nameLabel.heightAnchor.constraint(equalToConstant: 30.fitH),
            nameLabel.topAnchor.constraint(equalTo: nameTitleLabel.bottomAnchor)
        ])
    }
}
