//
//  TabBarController.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 01.01.2025.
//

import UIKit

final class TabBarController: UITabBarController {
        
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private enum TabBarItem {
        case characters
        case search
        case favorites
        
        var title: String {
            switch self {
            case .characters: return "Characters"
            case .search: return "Search"
            case .favorites: return "Favorites"
            }
        }
    }
    
    private var backgroundImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = R.image.backgroundImage()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Initializers
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTabBar()
    }
    
    // MARK: - Public methods
    
    // MARK: - Actions
    
    // MARK: - Private methods
    
    private func setupUI() {
        view.insertSubview(backgroundImageView, at: 0)
        
        setupLayout()
    }
    
    private func setupTabBar() {
        let dataSource: [TabBarItem] = [.characters, .search, .favorites]
        
        self.viewControllers = dataSource.map {
            switch $0 {
            case .characters:
                let charactersViewController = CharactersViewController()
                return self.wrappedInNavigationController(with: charactersViewController)
            case .search:
                let searchViewController = SearchViewController()
                return self.wrappedInNavigationController(with: searchViewController)
            case .favorites:
                let favoritesViewController = FavoritesViewController()
                return self.wrappedInNavigationController(with: favoritesViewController)
            }
        }
        
        self.viewControllers?.enumerated().forEach {

            $1.tabBarItem.title = dataSource[$0].title
            $1.tabBarItem.setTitleTextAttributes([.font: R.font.inter28ptRegular(size: 20)!], for: .normal)
        }
        self.tabBar.backgroundColor = R.color.gray()
        self.tabBar.unselectedItemTintColor = R.color.starBackground()
        self.tabBar.tintColor = R.color.light()
    }

    private func wrappedInNavigationController(with: UIViewController) -> UINavigationController {
        return UINavigationController(rootViewController: with)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
