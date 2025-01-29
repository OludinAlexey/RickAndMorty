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
        let view = CharactersView(infoViewDelegate: self)
        return view
    }()
    
    private lazy var characters = getCharacters()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.updateCharacterView(character: characters[0])
    }
    
    // MARK: - Public methods
    
    // MARK: - Actions
    
    // MARK: - Private methods
    
    private func showInfoView() {
        navigationController?.pushViewController(DetailsViewController(), animated: true)
    }
    
    private func getCharacters() -> [Character] {
        let characters = [
            Character(
                id: 1,
                name: "Morty Smith",
                status: "Alive",
                gender: "Male",
                species: "Human",
                origin: "Unknown",
                created: "2017-11-04T18:50:21.651Z",
                location: "Citadel of Ricks",
                image: R.image.morty()!
            ),
            Character(
                id: 2,
                name: "Rick Sanchez",
                status: "Alive",
                gender: "Male",
                species: "Human",
                origin: "Earth (C-137)",
                created: "2017-11-04T18:48:46.250Z",
                location: "Citadel of Ricks",
                image: R.image.rick()!
            )
        ]
        return characters
    }
    
    
}

extension CharactersViewController: InfoViewDelegate {
    func infoViewDidTap() {
        showInfoView()
    }
}
