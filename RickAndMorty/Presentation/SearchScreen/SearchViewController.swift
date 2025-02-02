//
//  SearchViewController.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 01.01.2025.
//

import UIKit

final class SearchViewController: UIViewController {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private lazy var mainView = {
        let view = SearchView(infoViewDelegate: self)
        return view
    }()
    
    // MARK: - Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        view = mainView
    }
    
    // MARK: - Public methods
    
    // MARK: - Actions
    
    // MARK: - Private methods
    
    private func showInfoView() {
        navigationController?.pushViewController(DetailsViewController(character: Character()), animated: true)
    }
    
}

extension SearchViewController: InfoViewDelegate {
    func infoViewDidTap() {
        showInfoView()
    }
}
