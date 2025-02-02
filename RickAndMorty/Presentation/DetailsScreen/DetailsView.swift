//
//  DetailsView.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 19.01.2025.
//

import UIKit

final class DetailsView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private var character: Character = Character()
    private lazy var titleLabel = UILabel.getTitleLabel("Details")
    private lazy var detailsFrameView = DetailsFrameView(character: character)
    
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
        addSubviews()
        setupLayout()
    }
    
    private func addSubviews() {
        [ titleLabel, detailsFrameView ] .forEach { addSubview($0) }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 22.fitH),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50.fitH),
            titleLabel.widthAnchor.constraint(equalToConstant: 220.fitW)
        ])
        
        NSLayoutConstraint.activate([
            detailsFrameView.topAnchor.constraint(equalTo: topAnchor, constant: 106.fitH),
            detailsFrameView.centerXAnchor.constraint(equalTo: centerXAnchor),
            detailsFrameView.heightAnchor.constraint(equalToConstant: 639.fitH),
            detailsFrameView.widthAnchor.constraint(equalToConstant: 312.fitW)
        ])
    }
}
