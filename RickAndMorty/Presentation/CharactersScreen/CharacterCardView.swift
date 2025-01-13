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
    
    private lazy var planetTitleLabel: UILabel = getLabel("Planet:", font: titleFont)
    private lazy var nameTitleLabel: UILabel = getLabel("Name:", font: titleFont)
    private lazy var statusTitleLabel: UILabel = getLabel("Status:", font: titleFont)
    private lazy var createdTitleLabel: UILabel = getLabel("Created:", font: titleFont)
    
    private lazy var planetLabel: UILabel = getLabel("Earth", font: valueFont)
    private lazy var nameLabel: UILabel = getLabel("Morty Smith", font: valueFont)
    private lazy var statusLabel: UILabel = getLabel("Alive", font: valueFont)
    private lazy var createdLabel: UILabel = getLabel("2017-11-04T18:48:46.250Z", font: valueFont)
    
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
    private lazy var characterInfoView: InfoView = InfoView()
    
    private lazy var prevCharacterButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.setImage(R.image.arrowLeftWhite(), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    private lazy var nextCharacterButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.setImage(R.image.arrowRightWhite(), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
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
            prevCharacterButton, nextCharacterButton
        ] .forEach { addSubview($0) }
    }
    
    private func setupLayout() {
        toAutoLayout()
        NSLayoutConstraint.activate([
            planetTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            planetTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 39),
            planetLabel.topAnchor.constraint(equalTo: planetTitleLabel.topAnchor),
            planetLabel.leadingAnchor.constraint(equalTo: planetTitleLabel.trailingAnchor, constant: 8),
            
            nameTitleLabel.topAnchor.constraint(equalTo: planetTitleLabel.bottomAnchor, constant: 15),
            nameTitleLabel.leadingAnchor.constraint(equalTo: planetTitleLabel.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: nameTitleLabel.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.trailingAnchor, constant: 8),
            
            statusTitleLabel.topAnchor.constraint(equalTo: nameTitleLabel.bottomAnchor, constant: 14),
            statusTitleLabel.leadingAnchor.constraint(equalTo: planetTitleLabel.leadingAnchor),
            statusLabel.topAnchor.constraint(equalTo: statusTitleLabel.topAnchor),
            statusLabel.leadingAnchor.constraint(equalTo: statusTitleLabel.trailingAnchor, constant: 8),
            
            createdTitleLabel.topAnchor.constraint(equalTo: statusTitleLabel.bottomAnchor, constant: 14),
            createdTitleLabel.leadingAnchor.constraint(equalTo: planetTitleLabel.leadingAnchor),
            createdLabel.topAnchor.constraint(equalTo: createdTitleLabel.topAnchor),
            createdLabel.leadingAnchor.constraint(equalTo: createdTitleLabel.trailingAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: createdTitleLabel.bottomAnchor,constant: 16),
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            characterImageView.widthAnchor.constraint(equalToConstant: 300),
            characterImageView.heightAnchor.constraint(equalToConstant: 375),
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
            prevCharacterButton.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 18),
            prevCharacterButton.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -69),
            prevCharacterButton.widthAnchor.constraint(equalToConstant: 35),
            prevCharacterButton.heightAnchor.constraint(equalToConstant: 66)
        ])
        
        NSLayoutConstraint.activate([
            nextCharacterButton.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 18),
            nextCharacterButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 69),
            nextCharacterButton.widthAnchor.constraint(equalToConstant: 35),
            nextCharacterButton.heightAnchor.constraint(equalToConstant: 66)
        ])
    }
    
    private func getTitleLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.toAutoLayout()
        label.font = R.font.inter28ptBold(size: 15)
        label.textColor = R.color.light()
        label.textAlignment = .left
        label.text = text
        return label
    }
    
    private func getValueLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.toAutoLayout()
        label.font = R.font.inter28ptRegular(size: 15)
        label.textColor = R.color.light()
        label.textAlignment = .left
        label.text = text
        return label
    }
    
    private func getLabel(_ text: String, font: UIFont) -> UILabel {
        let label = UILabel()
        label.toAutoLayout()
        label.font = font
        label.textColor = R.color.light()
        label.textAlignment = .left
        label.text = text
        return label
    }
}
