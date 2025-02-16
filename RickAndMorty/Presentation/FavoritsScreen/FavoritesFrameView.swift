//
//  FavoritesFrameView.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 15.01.2025.
//

import UIKit

final class FavoritesFrameView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private let infoViewDelegate: InfoViewDelegate
    private lazy var favoriteCharacterView = FavoriteCharacterView(infoViewDelegate: infoViewDelegate)
    
    // MARK: - Initializers
    
    init(infoViewDelegate: InfoViewDelegate) {
        self.infoViewDelegate = infoViewDelegate
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
        backgroundColor = R.color.dark()
        
        roundCorners(
            corners: [
                .layerMaxXMaxYCorner,
                .layerMaxXMinYCorner,
                .layerMinXMaxYCorner,
                .layerMinXMinYCorner
            ],
            radius: 42
        )
        addSubviews()
        setupLayout()
    }
    
    private func addSubviews() {
        [ favoriteCharacterView ] .forEach { addSubview($0) }
    }
    
    private func setupLayout() {
        toAutoLayout()
        
        NSLayoutConstraint.activate([
            favoriteCharacterView.topAnchor.constraint(equalTo: topAnchor, constant: 23.fitH),
            favoriteCharacterView.centerXAnchor.constraint(equalTo: centerXAnchor),
            favoriteCharacterView.widthAnchor.constraint(equalToConstant: 300.fitW),
            favoriteCharacterView.heightAnchor.constraint(equalToConstant: 282)
        ])
        
    }
}
