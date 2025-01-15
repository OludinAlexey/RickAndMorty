//
//  FavoritesView.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 15.01.2025.
//

import UIKit

final class FavoritesView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private lazy var titleLabel = UILabel.getTitleLabel("Favorites")
    private lazy var favoritesFrameView = FavoritesFrameView()
    
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
        addSubviews()
        setupLayout()
    }
    
    private func addSubviews() {
        [ titleLabel, favoritesFrameView ] .forEach { addSubview($0) }
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.widthAnchor.constraint(equalToConstant: 220)
        ])
        
        NSLayoutConstraint.activate([
            favoritesFrameView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 33),
            favoritesFrameView.centerXAnchor.constraint(equalTo: centerXAnchor),
            favoritesFrameView.heightAnchor.constraint(equalToConstant: 616),
            favoritesFrameView.widthAnchor.constraint(equalToConstant: 347)
        ])
    }
}