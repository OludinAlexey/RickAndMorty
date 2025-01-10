//
//  FavoriteView.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 11.01.2025.
//

import UIKit

final class FavoriteView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private var favoriteImageView = UIImageView()

    private var isSelected: Bool = false
    
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
    
    func configure(isFavorite: Bool, likeCount: Int){
        isSelected = isFavorite
        favoriteImageView.alpha = isSelected ? 0.8 : 0.5
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
        toAutoLayout()
        addSubviews()
        setupFavoriteImageView()
    }
    
    private func addSubviews(){
        addSubview(favoriteImageView)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapView)))
    }
    
    private func setupFavoriteImageView(){
        favoriteImageView.tintColor = .yellow.withAlphaComponent(0.8)
        favoriteImageView.image = UIImage(systemName: "star.fill")
    }

    private func animateTap(){
        isSelected.toggle()
        UIView.transition(
            with: self,
            duration: 0.3,
            animations: {[self] in
                favoriteImageView.alpha = isSelected ? 0.8 : 0.5
            }
        )
    }
}
