//
//  SearchFrameView.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 12.01.2025.
//

import UIKit

final class SearchFrameView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private lazy var searchDropdownMenuView = SearchDropdownMenuView()
    
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
        [ searchDropdownMenuView ] .forEach { addSubview($0) }
    }
    
    private func setupLayout() {
        toAutoLayout()
        NSLayoutConstraint.activate([
            searchDropdownMenuView.topAnchor.constraint(equalTo: topAnchor, constant: 46),
            searchDropdownMenuView.centerXAnchor.constraint(equalTo: centerXAnchor),
            searchDropdownMenuView.heightAnchor.constraint(equalToConstant: 57),
            searchDropdownMenuView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}
