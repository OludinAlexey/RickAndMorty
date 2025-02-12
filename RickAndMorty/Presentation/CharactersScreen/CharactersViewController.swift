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
        let view = CharactersView(infoViewDelegate: self, nextPrevButtonsViewDelegate: self)
        return view
    }()
    private var page: Page?
    private var characters: [Character] = []
    private var currentCharacterIndex: Int = 0
    private let serviceProvider: ServiceProvider! = .init()
    private var model = CharactersModel()
    
    // MARK: - Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
        model.subscribe(self)
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
        updateView()
        model.notify()
    }
    
    // MARK: - Public methods
    
    // MARK: - Actions
    
    // MARK: - Private methods
    
    private func showInfoView() {
        navigationController?.pushViewController(DetailsViewController(character: characters[currentCharacterIndex]), animated: true)
    }
    
    private func updateView() {
        guard !characters.isEmpty else { return }
        mainView.updateCharacterView(character: characters[currentCharacterIndex])
        setNextPrevButtonsState()
    }
    
    private func getPage() -> Page? {
        var page: Page?
        self.serviceProvider.networkManager.request { (info: Page) in
                print(info)
                page = info
        }
        return page
    }
    
    private func getCharacters() -> [Character] {
//        let characters = [
//            Character(
//                id: 1,
//                name: "Morty Smith",
//                status: "Alive",
//                gender: "Male",
//                species: "Human",
//                origin: "Unknown",
//                created: "2017-11-04T18:50:21.651Z",
//                location: "Citadel of Ricks",
//                imageURL: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"
//            ),
//            Character(
//                id: 2,
//                name: "Rick Sanchez",
//                status: "Alive",
//                gender: "Male",
//                species: "Human",
//                origin: "Earth (C-137)",
//                created: "2017-11-04T18:48:46.250Z",
//                location: "Citadel of Ricks",
//                imageURL: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
//            )
//        ]
        
        let characters = page?.results as? [Character]
        return characters ?? []
    }
}

extension CharactersViewController: InfoViewDelegate {
    func infoViewDidTap() {
        showInfoView()
    }
}

extension CharactersViewController: NextPrevButtonsViewDelegate {
    func nextButtonDidTap() {
        if currentCharacterIndex < characters.count - 1 {
            currentCharacterIndex += 1
            updateView()
        }
    }
    
    func prevButtonDidTap() {
        if currentCharacterIndex > 0 {
            currentCharacterIndex -= 1
            updateView()
        }
    }
    
    private func setNextPrevButtonsState() {
        currentCharacterIndex == 0 ? mainView.deactivatePrevButton() : mainView.activatePrevButton()
        currentCharacterIndex == characters.count - 1 ? mainView.deactivateNextButton() : mainView.activateNextButton()
    }
    
    private func updateCharacters() {
        page?.results?.forEach(
            { result in
                characters.append(
                    Character(
                        id: result.id ?? -1,
                        name: result.name ?? "unknown",
                        status: result.status ?? "unknown",
                        gender: result.gender ?? "unknown",
                        species: result.species ?? "unknown",
                        origin: result.origin?.name ?? "unknown",
                        created: result.created ?? "unknown",
                        location: result.location?.name ?? "unknown",
                        imageURL: result.image ?? "unknown"
                    )
                )
        })
    }
}

extension CharactersViewController: Observer {
    func update(subject: CharactersModel) {
        print(#function)
        guard let page = subject.page else { return }
        self.page = page
        updateCharacters()
        updateView()
    }
}
