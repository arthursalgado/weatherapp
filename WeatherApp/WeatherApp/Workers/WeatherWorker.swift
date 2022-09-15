//
//  WeatherWorker.swift
//  WeatherApp
//
//  Created by Arthur Azevedo Salgado (P) on 10/09/22.
//

import ObjectMapper
import UIKit

protocol WeatherWorkingLogic {
    func fetchWeather(completion: @escaping (Result<WeatherResponse, WAError>) -> Void)
    func fetchImage(code: String, completion: @escaping (UIImage?) -> Void )
}

class WeatherWorker: WeatherWorkingLogic {
    private let cache = NSCache<NSString, UIImage>()
    
    func fetchWeather(completion: @escaping (Result<WeatherResponse, WAError>) -> Void) {
        guard let url = URL(string: WeatherRequest().endpoint) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(WeatherResponse.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func fetchImage(code: String, completion: @escaping (UIImage?) -> Void ) {
        
        let url = WeatherIconRequest(icon: code).endpoint
        let cacheKey = NSString(string: url)
        
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completion(image)
        }
        
        task.resume()
    }
}
