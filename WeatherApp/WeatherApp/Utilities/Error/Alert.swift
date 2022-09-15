//
//  Alert.swift
//  WeatherApp
//
//  Created by Arthur Azevedo Salgado (P) on 11/09/22.
//

import UIKit

class AlertView: NSObject {
    class func showAlert(view: UIViewController, alert: AlertItem) {
        let alert = UIAlertController(title: alert.title, message: alert.message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        DispatchQueue.main.async {
            view.present(alert, animated: true, completion: nil)
        }
    }
}

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
}

//MARK: - Network Alerts
struct AlertContext {
    static let invalidData      = AlertItem(title: "Server Error", message: "The data received from the server was invalid. Please contact support.")
    
    static let invalidResponse  = AlertItem(title: "Server Error",
                                            message: "Invalid response from the server. Please try again later or contact support.")
    
    static let invalidURL       = AlertItem(title: "Sever Error",
                                            message: "There was an issue connecting to the server. If this persists, please contact support.")
    
    static let unableToComplete = AlertItem(title: "Server Error",
                                            message: "Unable to complete your request at this time. Please check your internet connection.")
}
