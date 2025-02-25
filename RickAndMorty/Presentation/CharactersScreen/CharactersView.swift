//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 01.01.2025.
//

import UIKit

final class CharactersView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private let infoViewDelegate: InfoViewDelegate
    private let nextPrevButtonsViewDelegate: NextPrevButtonsViewDelegate
    private lazy var titleLabel = UILabel.getTitleLabel("Characters")
    private lazy var characterCardView = CharacterCardView(infoViewDelegate: infoViewDelegate, nextPrevButtonsDelegate: nextPrevButtonsViewDelegate)
    
    // MARK: - Initializers
    
    init(infoViewDelegate: InfoViewDelegate, nextPrevButtonsViewDelegate: NextPrevButtonsViewDelegate) {
        self.infoViewDelegate = infoViewDelegate
        self.nextPrevButtonsViewDelegate = nextPrevButtonsViewDelegate
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    // MARK: - Public methods
    
    func updateCharacterView(character: Character) {
        characterCardView.update(character: character)
    }
    
    func deactivateNextButton() {
        characterCardView.deactivateNextButton()
    }
    
    func deactivatePrevButton() {
        characterCardView.deactivatePrevButton()
    }
    
    func activateNextButton() {
        characterCardView.activateNextButton()
    }
    
    func activatePrevButton() {
        characterCardView.activatePrevButton()
    }
    
    // MARK: - Actions
    
    @objc private func someAction() {
        
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        addSubviews()
        setupLayout()
    }
    
    private func addSubviews() {
        [ titleLabel, characterCardView ] .forEach { addSubview($0) }
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 22.fitH),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50.fitH),
            titleLabel.widthAnchor.constraint(equalToConstant: 220.fitW)
        ])
        
        NSLayoutConstraint.activate([
            characterCardView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 27.fitH),
            characterCardView.centerXAnchor.constraint(equalTo: centerXAnchor),
            characterCardView.heightAnchor.constraint(equalToConstant: 646.fitH),
            characterCardView.widthAnchor.constraint(equalToConstant: 347.fitW)
        ])
    }
}
