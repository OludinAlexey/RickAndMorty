//
//  DetailsFrameView.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 25.01.2025.
//

import UIKit

final class DetailsFrameView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private var character: Character = Character()
    private lazy var detailsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.image = character.image
        imageView.backgroundColor = R.color.starBackgroundGray()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.roundCorners(
            corners: [
                .layerMaxXMaxYCorner,
                .layerMaxXMinYCorner,
                .layerMinXMaxYCorner,
                .layerMinXMinYCorner
            ],
            radius: 41
        )
        return imageView
    }()
    
    private lazy var detailsDescriptionView = DetailsDescriptionView(character: character)
    
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
        backgroundColor = R.color.light()
        
        roundCorners(
            corners: [
                .layerMaxXMaxYCorner,
                .layerMaxXMinYCorner,
                .layerMinXMaxYCorner,
                .layerMinXMinYCorner
            ],
            radius: 40
        )
        
        self.layer.borderColor = R.color.green()!.cgColor
        self.layer.borderWidth = 3
        
        addSubviews()
        setupLayout()
    }
    
    private func addSubviews() {
        [ detailsImageView, detailsDescriptionView ] .forEach { addSubview($0) }
    }
    
    private func setupLayout() {
        toAutoLayout()
        NSLayoutConstraint.activate([
            detailsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 45.fitH),
            detailsImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            detailsImageView.heightAnchor.constraint(equalToConstant: 155.fitH),
            detailsImageView.widthAnchor.constraint(equalToConstant: 275.fitW)
        ])
        
        NSLayoutConstraint.activate([
            detailsDescriptionView.topAnchor.constraint(equalTo: detailsImageView.bottomAnchor, constant: 40.fitH),
            detailsDescriptionView.centerXAnchor.constraint(equalTo: centerXAnchor),
            detailsDescriptionView.heightAnchor.constraint(equalToConstant: 356.fitH),
            detailsDescriptionView.widthAnchor.constraint(equalToConstant: 275.fitW)
        ])
    }
}
