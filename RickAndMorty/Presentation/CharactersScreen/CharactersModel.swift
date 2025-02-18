//
//  CharactersModel.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 13.02.2025.
//

import Foundation

protocol Observer: AnyObject {
    func update(subject: CharactersModel)
}

struct WeakSubscriber {
    weak var value : Observer?
}

class CharactersModel {
    
    // MARK: - Public properties
    
    var page: Page?
    var results: [Character]?
    
    // MARK: - Private properties
    
    private lazy var subscribers: [WeakSubscriber] = []
    private let serviceProvider: ServiceProvider = ServiceProvider()
    
    // MARK: - Initializers
    
    init() {
        getPage()
    }
    
    // MARK: - Public methods
    
    func subscribe(_ subscriber: Observer) {
        print("subscribed")
        subscribers.append(WeakSubscriber(value: subscriber))
    }
    
    func unsubscribe(_ subscriber: Observer) {
        subscribers.removeAll(where: { $0.value === subscriber })
        print("unsubscribed")
    }
    
    func notify() {
        subscribers.forEach { $0.value?.update(subject: self)
        }
    }
    
    func nextPage() {
        getPage(url: page?.info?.next ?? "")
    }
    
    func prevPage() {
        getPage(url: page?.info?.prev ?? "")
    }
    
    // MARK: - Private methods
    
    private func getPage() {
        self.serviceProvider.networkManager.request { (info: Page) in
            self.page = info
            print(self.page!)
            self.notify()
        }
    }
    
    private func getPage(url: String) {
        self.serviceProvider.networkManager.request(url) { (info: Page) in
            self.page = info
            print(self.page!)
            self.notify()
        }
    }
}
