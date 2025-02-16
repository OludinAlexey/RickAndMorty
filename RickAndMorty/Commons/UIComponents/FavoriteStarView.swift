//
//  FavoriteStarView.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 11.01.2025.
//

import UIKit

final class FavoriteStarView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private var favoriteImageView = UIImageView()

    private var isSelected: Bool = false
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        setupUI()
        configure(isFavorite: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    // MARK: - Public methods
    
    func configure(isFavorite: Bool){
        isSelected = isFavorite
        favoriteImageView.image = isSelected ? R.image.starFilled() : R.image.star()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        favoriteImageView.frame = bounds
    }
    
    // MARK: - Actions
    
    @objc private func tapView(){
        animateTap()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        backgroundColor = .clear
        roundCorners(
            corners: [
                .layerMaxXMaxYCorner,
                .layerMaxXMinYCorner,
                .layerMinXMaxYCorner,
                .layerMinXMinYCorner
            ],
            radius: 32
        )
        toAutoLayout()
        addSubviews()
        configure(isFavorite: isSelected)
    }
    
    private func addSubviews(){
        addSubview(favoriteImageView)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapView)))
    }

    private func animateTap(){
        isSelected.toggle()
        UIView.transition(
            with: self,
            duration: 0.3,
            animations: {[self] in
                configure(isFavorite: isSelected)
            }
        )
    }
}
