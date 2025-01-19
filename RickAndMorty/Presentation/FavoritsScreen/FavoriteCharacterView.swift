//
//  FavoriteCharacterView.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 15.01.2025.
//

import UIKit

final class FavoriteCharacterView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.morty()
        imageView.toAutoLayout()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.roundCorners(
            corners: [
                .layerMaxXMaxYCorner,
                .layerMaxXMinYCorner,
                .layerMinXMaxYCorner,
                .layerMinXMinYCorner
            ],
            radius: 21
        )
        
        return imageView
    }()
    
    private let infoViewDelegate: InfoViewDelegate
    private lazy var favoritesLabelsView = FavoritesLabelsView()
    private lazy var favoriteView: FavoriteView = FavoriteView()
    private lazy var characterInfoView: InfoView = InfoView(delegate: infoViewDelegate)
    
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
        backgroundColor = .green
        clipsToBounds = true
        
        roundCorners(
            corners: [
                .layerMaxXMinYCorner,
                .layerMinXMinYCorner
            ],
            radius: 21
        )
        
        addSubviews()
        setupLayout()
    }
    
    private func addSubviews() {
        [
            characterImageView,
            favoritesLabelsView,
            favoriteView,
            characterInfoView
        ] .forEach { addSubview($0) }
    }
    
    private func setupLayout() {
        toAutoLayout()
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            characterImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            favoritesLabelsView.bottomAnchor.constraint(equalTo: bottomAnchor),
            favoritesLabelsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            favoritesLabelsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            favoritesLabelsView.heightAnchor.constraint(equalToConstant: 67.fitH)
        ])
        
        NSLayoutConstraint.activate([
            favoriteView.topAnchor.constraint(equalTo: characterImageView.topAnchor, constant: 10),
            favoriteView.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor, constant: 10),
            favoriteView.widthAnchor.constraint(equalToConstant: 61),
            favoriteView.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        NSLayoutConstraint.activate([
            characterInfoView.topAnchor.constraint(equalTo: favoritesLabelsView.topAnchor, constant: -31),
            characterInfoView.trailingAnchor.constraint(equalTo: favoritesLabelsView.trailingAnchor),
            characterInfoView.widthAnchor.constraint(equalToConstant: 63),
            characterInfoView.heightAnchor.constraint(equalToConstant: 61)
        ])
    }
}
