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
    private lazy var searchedCharactersView = SearchedCharactersView()
    
//    private lazy var characterImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = R.image.morty()
//        roundCorners(
//            corners: [
//                .layerMaxXMaxYCorner,
//                .layerMaxXMinYCorner,
//                .layerMinXMaxYCorner,
//                .layerMinXMinYCorner
//            ],
//            radius: 21
//        )
//        imageView.toAutoLayout()
//        
//        
//        return imageView
//    }()
    
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
        [ searchDropdownMenuView, searchedCharactersView ] .forEach { addSubview($0) }
    }
    
    private func setupLayout() {
        toAutoLayout()
        NSLayoutConstraint.activate([
            searchDropdownMenuView.topAnchor.constraint(equalTo: topAnchor, constant: 46),
            searchDropdownMenuView.centerXAnchor.constraint(equalTo: centerXAnchor),
            searchDropdownMenuView.heightAnchor.constraint(equalToConstant: 57),
            searchDropdownMenuView.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            searchedCharactersView.topAnchor.constraint(equalTo: searchDropdownMenuView.bottomAnchor, constant: 42),
            searchedCharactersView.centerXAnchor.constraint(equalTo: centerXAnchor),
            searchedCharactersView.heightAnchor.constraint(equalToConstant: 380),
            searchedCharactersView.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        
    }
}
