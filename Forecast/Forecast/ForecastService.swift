//
//  ForecastService.swift
//  Forecast
//
//  Created by 백두산(DooSan Baek) on 07/08/2019.
//  Copyright © 2019 백두산(DooSan Baek). All rights reserved.
//

import Foundation

enum Forecast {
    case weatherSearch(latitude: String, longitude: String)
    
    var url: String {
        switch self {
        case .weatherSearch(let lat, let lon):
            return "https://api.darksky.net/forecast/8cd540d0ccd9472a8100ad4d9f1d7a27/\(lat),\(lon)"
        }
    }
}


class ForecastService {
    private let network: Network
    
    init(network: Network) {
        self.network = network
    }
    
    func weatherSearch(latitude: String, longitude: String, _ completion: @escaping (DarkSkyResponse) -> Void) {
        let url = Forecast.weatherSearch(latitude: latitude, longitude: longitude).url
        network.request(url: url, type: DarkSkyResponse.self, { (res) in
            switch res {
                
            case .success(let info):
                completion(info)
            case .failure(let err):
                print(err)
            }
        })
    }
}
