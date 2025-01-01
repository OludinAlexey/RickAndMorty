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
    
    private lazy var mainView = {
        let view = UIView()
        return view
    }()
    
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
    
    // MARK: - Initializers
    
//    init() {
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()
    }
    
    // MARK: - Public methods
    
    // MARK: - Actions
    
    // MARK: - Private methods
    
    private func setupTabBar() {
        let dataSource: [TabBarItem] = [.characters, .search, .favorites]
        
        self.viewControllers = dataSource.map {
            switch $0 {
            case .characters:
                let charactersViewController = CharactersViewController()
                return self.wrappedInNavigationController(with: charactersViewController, title: $0.title)
            case .search:
                let searchViewController = SearchViewController()
                return self.wrappedInNavigationController(with: searchViewController, title: $0.title)
            case .favorites:
                let favoritesViewController = FavoritesViewController()
                return self.wrappedInNavigationController(with: favoritesViewController, title: $0.title)
            }
        }
        
        self.viewControllers?.enumerated().forEach {

            $1.tabBarItem.title = dataSource[$0].title
            $1.tabBarItem.setTitleTextAttributes([.font: R.font.inter28ptRegular(size: 20)!], for: .normal)
        }
//        self.tabBar.translatesAutoresizingMaskIntoConstraints = false
        self.tabBar.backgroundColor = R.color.gray()
        self.tabBar.unselectedItemTintColor = R.color.starBackground()
        self.tabBar.tintColor = R.color.light()
//        self.tabBar.heightAnchor.constraint(equalToConstant: 180).isActive = true
//        
//        self.tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor ).isActive = true
//        self.tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    private func wrappedInNavigationController(with: UIViewController, title: Any?) -> UINavigationController {
        return UINavigationController(rootViewController: with)
    }
    
}
