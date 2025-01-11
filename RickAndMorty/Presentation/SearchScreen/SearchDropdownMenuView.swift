//
//  SearchDropdownMenuView.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 12.01.2025.
//

import UIKit

final class SearchDropdownMenuView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private lazy var planetIcon: UIImageView = {
        let imageView = UIImageView(image: R.image.earth())
        imageView.toAutoLayout()
//        imageView.heightAnchor.constraint(equalToConstant: 49).isActive = true
//        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.color.dark()
        label.toAutoLayout()
        label.font = R.font.inter28ptBold(size: 20)
        label.textAlignment = .center
        label.text = "Search by Planet"
        return label
    }()
    
    private lazy var arrowIcon: UIImageView = {
        let imageView = UIImageView(image: R.image.searchArrowDown())
        imageView.toAutoLayout()
//        imageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
//        imageView.widthAnchor.constraint(equalToConstant: 29).isActive = true
        return imageView
    }()
    
//    private lazy var stackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [planetIcon, titleLabel, arrowIcon])
//        stackView.axis = .horizontal
////        stackView.distribution = .fillProportionally
//        stackView.spacing = 16
//        stackView.toAutoLayout()
//        return stackView
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
        backgroundColor = R.color.green()
        
        roundCorners(
            corners: [
                .layerMaxXMaxYCorner,
                .layerMaxXMinYCorner,
                .layerMinXMaxYCorner,
                .layerMinXMinYCorner
            ],
            radius: 16
        )
        
        addSubviews()
        setupLayout()
    }
    
    private func addSubviews() {
        [ titleLabel, planetIcon, arrowIcon ] .forEach { addSubview($0) }
//        [ stackView ] .forEach { addSubview($0) }
    }
    
    private func setupLayout() {
        toAutoLayout()
//        NSLayoutConstraint.activate([
//            stackView.heightAnchor.constraint(equalTo: heightAnchor),
//            stackView.widthAnchor.constraint(equalTo: widthAnchor),
//            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
//       ])
        
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 46),
            titleLabel.widthAnchor.constraint(equalToConstant: 166),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            planetIcon.heightAnchor.constraint(equalToConstant: 49),
            planetIcon.widthAnchor.constraint(equalToConstant: 50),
            planetIcon.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -16),
            planetIcon.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            arrowIcon.heightAnchor.constraint(equalToConstant: 16),
            arrowIcon.widthAnchor.constraint(equalToConstant: 29),
            arrowIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowIcon.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 16)
        ])
    }
}
