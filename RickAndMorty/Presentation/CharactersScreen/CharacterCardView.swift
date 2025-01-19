//
//  CharacterCardView.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 10.01.2025.
//

import UIKit

final class CharacterCardView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private let titleFont: UIFont = R.font.inter28ptBold(size: 15)!
    private let valueFont: UIFont = R.font.inter28ptRegular(size: 15)!
    private let infoViewDelegate: InfoViewDelegate
    
    private lazy var planetTitleLabel: UILabel = UILabel.getLabel("Planet:", font: titleFont)
    private lazy var nameTitleLabel: UILabel = UILabel.getLabel("Name:", font: titleFont)
    private lazy var statusTitleLabel: UILabel = UILabel.getLabel("Status:", font: titleFont)
    private lazy var createdTitleLabel: UILabel = UILabel.getLabel("Created:", font: titleFont)
    
    private lazy var planetLabel: UILabel = UILabel.getLabel("Earth", font: valueFont)
    private lazy var nameLabel: UILabel = UILabel.getLabel("Morty Smith", font: valueFont)
    private lazy var statusLabel: UILabel = UILabel.getLabel("Alive", font: valueFont)
    private lazy var createdLabel: UILabel = UILabel.getLabel("2017-11-04T18:48:46.250Z", font: valueFont)
    
    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.image = R.image.morty()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.roundCorners(
            corners: [
                .layerMaxXMaxYCorner,
                .layerMaxXMinYCorner,
                .layerMinXMaxYCorner,
                .layerMinXMinYCorner
            ],
            radius: 32
        )
        return imageView
    }()
    
    private lazy var favoriteView: FavoriteView = FavoriteView()
    private lazy var characterInfoView: InfoView = InfoView(delegate: infoViewDelegate)
    
    private lazy var nextPrevButtonsView = NextPrevButtonsView(nextButtonImage: R.image.arrowRightWhite ()!, prevButtonImage: R.image.arrowLeftWhite()!)
    
    
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
        [
            planetTitleLabel, planetLabel,
            nameTitleLabel, nameLabel,
            statusTitleLabel, statusLabel,
            createdTitleLabel, createdLabel,
            characterImageView,
            favoriteView,
            characterInfoView,
            nextPrevButtonsView
        ] .forEach { addSubview($0) }
    }
    
    private func setupLayout() {
        toAutoLayout()
        NSLayoutConstraint.activate([
            planetTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 19.fitH),
            planetTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 39.fitW),
            planetLabel.topAnchor.constraint(equalTo: planetTitleLabel.topAnchor),
            planetLabel.leadingAnchor.constraint(equalTo: planetTitleLabel.trailingAnchor, constant: 8.fitW),
            
            nameTitleLabel.topAnchor.constraint(equalTo: planetTitleLabel.bottomAnchor, constant: 14.fitH),
            nameTitleLabel.leadingAnchor.constraint(equalTo: planetTitleLabel.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: nameTitleLabel.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.trailingAnchor, constant: 8.fitW),
            
            statusTitleLabel.topAnchor.constraint(equalTo: nameTitleLabel.bottomAnchor, constant: 15.fitH),
            statusTitleLabel.leadingAnchor.constraint(equalTo: planetTitleLabel.leadingAnchor),
            statusLabel.topAnchor.constraint(equalTo: statusTitleLabel.topAnchor),
            statusLabel.leadingAnchor.constraint(equalTo: statusTitleLabel.trailingAnchor, constant: 8.fitW),
            
            createdTitleLabel.topAnchor.constraint(equalTo: statusTitleLabel.bottomAnchor, constant: 14.fitH),
            createdTitleLabel.leadingAnchor.constraint(equalTo: planetTitleLabel.leadingAnchor),
            createdLabel.topAnchor.constraint(equalTo: createdTitleLabel.topAnchor),
            createdLabel.leadingAnchor.constraint(equalTo: createdTitleLabel.trailingAnchor, constant: 8.fitW)
        ])
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: createdTitleLabel.bottomAnchor,constant: 19.fitH),
            characterImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            characterImageView.widthAnchor.constraint(equalToConstant: 300.fitW),
            characterImageView.heightAnchor.constraint(equalToConstant: 375.fitH),
        ])
        
        NSLayoutConstraint.activate([
            favoriteView.topAnchor.constraint(equalTo: characterImageView.topAnchor, constant: 10),
            favoriteView.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor, constant: 10),
            favoriteView.widthAnchor.constraint(equalToConstant: 61),
            favoriteView.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        NSLayoutConstraint.activate([
            characterInfoView.bottomAnchor.constraint(equalTo: characterImageView.bottomAnchor),
            characterInfoView.trailingAnchor.constraint(equalTo: characterImageView.trailingAnchor),
            characterInfoView.widthAnchor.constraint(equalToConstant: 63),
            characterInfoView.heightAnchor.constraint(equalToConstant: 61)
        ])
        
        NSLayoutConstraint.activate([
            nextPrevButtonsView.topAnchor.constraint(equalTo: characterImageView.bottomAnchor),
            nextPrevButtonsView.bottomAnchor.constraint(equalTo: bottomAnchor),
            nextPrevButtonsView.centerXAnchor.constraint(equalTo: centerXAnchor),
            nextPrevButtonsView.widthAnchor.constraint(equalToConstant: 208.fitW)
        ])
    }

}
