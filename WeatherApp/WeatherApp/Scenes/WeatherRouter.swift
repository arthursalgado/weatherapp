//
//  WeatherRouter.swift
//  WeatherApp
//
//  Created by Arthur Azevedo Salgado (P) on 10/09/22.
//

import Foundation

protocol WeatherRoutingLogic {
    func routeToAnotherController()
}

class WeatherRouter: WeatherRoutingLogic {
    weak var viewController: WeatherDisplayLogic?
    
    func routeToAnotherController() {
        /*if let vc = viewController?.storyboard?.instantiateViewController(withIdentifier: "AnotherViewController") as? AnotherViewController {
         viewController?.navigationController?.pushViewController(vc, animated: true)
         }*/
    }
}
