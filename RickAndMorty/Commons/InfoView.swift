//
//  InfoView.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 11.01.2025.
//

import UIKit

protocol InfoViewDelegate: AnyObject {
    func infoViewDidTap()
}

final class InfoView: UIButton {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = R.font.inter28ptRegular(size: 36)
        label.textAlignment = .center
        label.text = "ℹ️️"
        return label
    }()
    
    private let delegate: InfoViewDelegate
    
    // MARK: - Initializers
    
    init(delegate: InfoViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        addTarget(self, action: #selector(showInfo), for: .touchUpInside)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    // MARK: - Public methods
    
    // MARK: - Actions
    
    @objc private func showInfo() {
        print(#function)
        delegate.infoViewDidTap()
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
            radius: 31
        )
        toAutoLayout()
        addSubviews()
        setupLayout()
    }
    
    private func addSubviews() {
        [ infoLabel ] .forEach { addSubview($0) }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            infoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            infoLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            infoLabel.widthAnchor.constraint(equalToConstant: 40),
            infoLabel.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
