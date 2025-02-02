//
//  DetailsViewController.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 19.01.2025.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private lazy var mainView = {
        let view = DetailsView(character: character)
        return view
    }()
    
    private var character = Character()
    
    // MARK: - Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    init(character: Character) {
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        view = mainView
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    // MARK: - Public methods
    
    // MARK: - Actions
    
    // MARK: - Private methods
    
    
}
