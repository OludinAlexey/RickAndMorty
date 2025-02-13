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
    var page: Page?
    var results: [Character]?
    private lazy var subscribers: [WeakSubscriber] = []
    private let serviceProvider: ServiceProvider = ServiceProvider()
    
    init() {
        getPage()
    }
    
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
