//
//  NextPrevButtonsView.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 19.01.2025.
//

import UIKit

protocol NextPrevButtonsViewDelegate: AnyObject {
    func nextButtonDidTap()
    func prevButtonDidTap()
}

final class NextPrevButtonsView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private let delegate: NextPrevButtonsViewDelegate
    private var nextButtonImage: UIImage
    private var prevButtonImage: UIImage
    
    private lazy var prevCharacterButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.setImage(prevButtonImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(prevButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextCharacterButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.setImage(nextButtonImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initializers
    
    init(nextButtonImage: UIImage, prevButtonImage: UIImage, delegate: NextPrevButtonsViewDelegate) {
        self.delegate = delegate
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
    
    func deactivateNextButton() {
        nextCharacterButton.isEnabled = false
    }
    
    func deactivatePrevButton() {
        prevCharacterButton.isEnabled = false
    }
    
    func activateNextButton() {
        nextCharacterButton.isEnabled = true
    }
    
    func activatePrevButton() {
        prevCharacterButton.isEnabled = true
    }
    
    // MARK: - Actions
    
    @objc private func nextButtonDidTap() {
        print(#function)
        delegate.nextButtonDidTap()
    }
    
    @objc private func prevButtonDidTap() {
        print(#function)
        delegate.prevButtonDidTap()
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
