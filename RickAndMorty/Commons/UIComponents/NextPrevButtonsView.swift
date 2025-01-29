//
//  NextPrevButtonsView.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 19.01.2025.
//

import UIKit

final class NextPrevButtonsView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private var nextButtonImage: UIImage
    private var prevButtonImage: UIImage
    
    private lazy var prevCharacterButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.setImage(prevButtonImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    private lazy var nextCharacterButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.setImage(nextButtonImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    // MARK: - Initializers
    
    init(nextButtonImage: UIImage, prevButtonImage: UIImage) {
        self.nextButtonImage = nextButtonImage
        self.prevButtonImage = prevButtonImage
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
        backgroundColor = .clear
        addSubviews()
        setupLayout()
    }
    
    private func addSubviews() {
        [
            prevCharacterButton,
            nextCharacterButton
        ] .forEach { addSubview($0) }
    }
    
    private func setupLayout() {
        toAutoLayout()
        NSLayoutConstraint.activate([
            prevCharacterButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            prevCharacterButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            prevCharacterButton.widthAnchor.constraint(equalToConstant: 35.fitW),
            prevCharacterButton.heightAnchor.constraint(equalToConstant: 66.fitH)
        ])

        NSLayoutConstraint.activate([
            nextCharacterButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            nextCharacterButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            nextCharacterButton.widthAnchor.constraint(equalToConstant: 35.fitW),
            nextCharacterButton.heightAnchor.constraint(equalToConstant: 66.fitH)
        ])
    }
}
