//
//  Network.swift
//  Forecast
//
//  Created by 백두산(DooSan Baek) on 05/08/2019.
//  Copyright © 2019 백두산(DooSan Baek). All rights reserved.
//

import Foundation

final class Network {
    
    func request<D: Codable>(url: String, type: D.Type, _ completion: @escaping (Result<D>) -> Void) {
        request(url: url) { (res) in
            do {
                let data = try JSONDecoder().decode(D.self, from: res as? Data ?? Data())
                completion(Result.success(data))
            } catch let err {
                completion(Result.failure(NetworkError(error: err)))
            }
        }
    }
    
    func request(url: String, _ completion: @escaping (Any) -> Void) {
        
        guard let url = URL(string: url) else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, resonse, error) in
            
            if let data = data {
                completion(data)
            } else if let error = error {
                completion(error)
            }
            }.resume()
    }
}

public enum Result<Object> {
    case success(Object)
    case failure(NetworkError)
    
    /// For debug use only
    public var description: String {
        switch self {
        case .success(let object):
            return "success: \(object)"
        case .failure(let error):
            return "failed: \(error)"
        }
    }
}
