//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 06.02.2025.
//

import Foundation
import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let session = URLSession.shared
    private lazy var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    
    private let baseURL: String = "https://rickandmortyapi.com/api/character"
    
    private init() {}
    
    func request<T:Decodable>(_ url: String? = nil, completion: @escaping (T) -> Void) {
        guard let url = URL(string: url ?? baseURL) else { return }
        let request = URLRequest(url: url)
        
        session.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            guard httpResponse.statusCode == 200 else { return }
            
            guard let data = data else { return }
            do {
                let result = try self.jsonDecoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(result)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
