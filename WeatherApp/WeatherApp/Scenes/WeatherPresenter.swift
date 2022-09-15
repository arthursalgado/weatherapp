//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by Arthur Azevedo Salgado (P) on 10/09/22.
//

import Foundation

protocol WeatherPresentationLogic {
    func showLoading(isLoading: Bool)
    func presentError(error: WAError)
    func present(weather: WeatherResponse)
}

class WeatherPresenter: WeatherPresentationLogic {
    weak var viewController: WeatherDisplayLogic?
    
    func showLoading(isLoading: Bool) {
        viewController?.showLoading(isLoading)
    }
    
    func presentError(error: WAError) {
        viewController?.displayError(with: error)
    }
    
    func present(weather: WeatherResponse) {
        viewController?.display(weather: weather)
    }
}
