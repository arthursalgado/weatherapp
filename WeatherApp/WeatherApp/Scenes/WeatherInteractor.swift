//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created by Arthur Azevedo Salgado (P) on 10/09/22.
//

import Foundation

protocol WeatherBusinessLogic {
    func handleFetchWeather()
}

class WeatherInteractor: WeatherBusinessLogic {
    
    var presenter: WeatherPresentationLogic?
    var worker: WeatherWorkingLogic?

    func handleFetchWeather() {
        presenter?.showLoading(isLoading: true)
        worker?.fetchWeather(completion: { [weak self] result in
            self?.presenter?.showLoading(isLoading: false)
            switch result {
            case .success(let response):
                self?.presenter?.present(weather: response)
            case .failure(let error):
                self?.presenter?.presentError(error: error)
            }
        })
    }
}
