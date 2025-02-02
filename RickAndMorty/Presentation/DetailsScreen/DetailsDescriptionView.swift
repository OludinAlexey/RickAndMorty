//
//  DetailsDescriptionView.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 25.01.2025.
//

import UIKit

final class DetailsDescriptionView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private var character: Character = Character()
    
    private let titleFont: UIFont = R.font.inter28ptBold(size: 24)!
    private let valueFont: UIFont = R.font.inter28ptRegular(size: 24)!
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel.getLabel(character.name, font: valueFont, textColor: .black, underlined: true)
        label.textAlignment = .center
        label.contentMode = .center
        return label
    }()
    
    private lazy var idTitleLabel = UILabel.getLabel("ID:", font: titleFont, textColor: .black)
    private lazy var idLabel = UILabel.getLabel(String(character.id), font: valueFont, textColor: .black)
    
    private lazy var statusTitleLabel = UILabel.getLabel("Status:", font: titleFont, textColor: .black)
    private lazy var statusLabel = UILabel.getLabel(character.status, font: valueFont, textColor: .black)
    
    private lazy var speciesTitleLabel = UILabel.getLabel("Species:", font: titleFont, textColor: .black)
    private lazy var speciesLabel = UILabel.getLabel(character.species, font: valueFont, textColor: .black)
    
    private lazy var genderTitleLabel = UILabel.getLabel("Gender:", font: titleFont, textColor: .black)
    private lazy var genderLabel = UILabel.getLabel(character.gender, font: valueFont, textColor: .black)
    
    private lazy var originTitleLabel = UILabel.getLabel("Origin:", font: titleFont, textColor: .black)
    private lazy var originLabel = UILabel.getLabel(character.origin, font: valueFont, textColor: .black)
    
    private lazy var planetTitleLabel = UILabel.getLabel("Planet:", font: titleFont, textColor: .black)
    private lazy var planetLabel = UILabel.getLabel(character.location, font: valueFont, textColor: .black)
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    init(character: Character) {
        self.character = character
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
        
        roundCorners(
            corners: [
                .layerMaxXMaxYCorner,
                .layerMaxXMinYCorner,
                .layerMinXMaxYCorner,
                .layerMinXMinYCorner
            ],
            radius: 37
        )
        
        self.layer.borderColor = R.color.dark()!.cgColor
        self.layer.borderWidth = 2
        addSubviews()
        setupLayout()
    }
    
    private func addSubviews() {
        [
            nameLabel,
            idTitleLabel, idLabel,
            statusTitleLabel, statusLabel,
            speciesTitleLabel, speciesLabel,
            genderTitleLabel, genderLabel,
            originTitleLabel, originLabel,
            planetTitleLabel, planetLabel
        ] .forEach { addSubview($0) }
    }
    
    private func setupLayout() {
        toAutoLayout()
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 22.fitH),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 47.fitH),
            nameLabel.widthAnchor.constraint(equalToConstant: 208.fitW)
        ])
        
        NSLayoutConstraint.activate([
            idTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 70.fitH),
            idTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18.fitW),
            idLabel.topAnchor.constraint(equalTo: idTitleLabel.topAnchor),
            idLabel.leadingAnchor.constraint(equalTo: idTitleLabel.trailingAnchor, constant: 5.fitW),
            
            statusTitleLabel.topAnchor.constraint(equalTo: idTitleLabel.bottomAnchor, constant: 10.fitH),
            statusTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18.fitW),
            statusLabel.topAnchor.constraint(equalTo: statusTitleLabel.topAnchor),
            statusLabel.leadingAnchor.constraint(equalTo: statusTitleLabel.trailingAnchor, constant: 5.fitW),
            
            speciesTitleLabel.topAnchor.constraint(equalTo: statusTitleLabel.bottomAnchor, constant: 10.fitH),
            speciesTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18.fitW),
            speciesLabel.topAnchor.constraint(equalTo: speciesTitleLabel.topAnchor),
            speciesLabel.leadingAnchor.constraint(equalTo: speciesTitleLabel.trailingAnchor, constant: 5.fitW),
            
            genderTitleLabel.topAnchor.constraint(equalTo: speciesTitleLabel.bottomAnchor, constant: 10.fitH),
            genderTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18.fitW),
            genderLabel.topAnchor.constraint(equalTo: genderTitleLabel.topAnchor),
            genderLabel.leadingAnchor.constraint(equalTo: genderTitleLabel.trailingAnchor, constant: 5.fitW),
            
            originTitleLabel.topAnchor.constraint(equalTo: genderTitleLabel.bottomAnchor, constant: 10.fitH),
            originTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18.fitW),
            originLabel.topAnchor.constraint(equalTo: originTitleLabel.topAnchor),
            originLabel.leadingAnchor.constraint(equalTo: originTitleLabel.trailingAnchor, constant: 5.fitW),
            
            planetTitleLabel.topAnchor.constraint(equalTo: originTitleLabel.bottomAnchor, constant: 10.fitH),
            planetTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18.fitW),
            planetLabel.topAnchor.constraint(equalTo: planetTitleLabel.topAnchor),
            planetLabel.leadingAnchor.constraint(equalTo: planetTitleLabel.trailingAnchor, constant: 5.fitW)
        ])
    }
}
