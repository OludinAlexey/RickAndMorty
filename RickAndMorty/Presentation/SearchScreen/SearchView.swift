//
//  SearchView.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 12.01.2025.
//

import UIKit

final class SearchView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = R.font.inter28ptRegular(size: 24)
        label.textColor = R.color.primaryText()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.text = "Search"
        return label
    }()
    
    
    private let infoViewDelegate: InfoViewDelegate
    private lazy var searchFrameView = SearchFrameView(infoViewDelegate: infoViewDelegate)
    
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
        addSubviews()
        setupLayout()
    }
    
    private func addSubviews() {
        [ titleLabel, searchFrameView ] .forEach { addSubview($0) }
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 22.fitH),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50.fitH),
            titleLabel.widthAnchor.constraint(equalToConstant: 220.fitW)
        ])
        
        NSLayoutConstraint.activate([
            searchFrameView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 38.fitH),
            searchFrameView.centerXAnchor.constraint(equalTo: centerXAnchor),
            searchFrameView.heightAnchor.constraint(equalToConstant: 634.fitH),
            searchFrameView.widthAnchor.constraint(equalToConstant: 347.fitW)
        ])
    }
}
