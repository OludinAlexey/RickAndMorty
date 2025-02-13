//
//  Page.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 06.02.2025.
//

struct Page: Codable {
    let info: Info?
    let results: [Result]?
    
    enum CodingKeys: String, CodingKey {
        case info
        case results
    }
    
    struct Info: Codable {
        let count: Int?
        let pages: Int?
        let next: String?
        let prev: String?
    }

    struct Result: Codable {
        
        let id: Int?
        let name: String?
        let status: String?
        let gender: String?
        let species: String?
        let origin: Origin?
        let created: String?
        let location: Location?
        let image: String?
    }
    
    struct Origin: Codable {
        let name: String?
        let url: String?
    }
    
    struct Location: Codable {
        let name: String?
        let url: String?
    }
}
