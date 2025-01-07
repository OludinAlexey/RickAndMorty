//
//  CharactersViewController.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 25.12.2024.
//

import UIKit

final class CharactersViewController: UIViewController {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private lazy var mainView = {
        let view = UIView()
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
    
}
