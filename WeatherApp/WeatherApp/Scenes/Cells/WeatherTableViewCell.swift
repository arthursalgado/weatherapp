//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Arthur Azevedo Salgado (P) on 11/09/22.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherTemp: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var tempMin: UILabel!
    @IBOutlet weak var tempMax: UILabel!
    @IBOutlet weak var wind: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension WeatherTableViewCell {
    static let identifier = "WeatherTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "WeatherTableViewCell", bundle: nil)
    }
    
    func config(with: WeatherResponse) {
        cityName.text = with.name ?? "-"
        weatherIcon.setImage(imageCode: with.weather?[0].icon ?? "50d")
        weatherTemp.text = "\(convertTemperature(temp: with.main?.temp ?? 0, from: .kelvin, to: .fahrenheit))°"
        weatherDescription.text = with.weather?[0].description ?? "-"
        tempMin.text = "Low: \(convertTemperature(temp: with.main?.temp_min ?? 0, from: .kelvin, to: .fahrenheit))°"
        tempMax.text = "High: \(convertTemperature(temp: with.main?.temp_max ?? 0, from: .kelvin, to: .fahrenheit))°"
        wind.text = "Wind: \(with.wind?.speed ?? 0) (\(with.wind?.deg ?? 0))"
    }
    
    func convertTemperature(temp: Double, from inputTempType: UnitTemperature, to outputTempType: UnitTemperature) -> Int {
        let input = Measurement(value: temp, unit: inputTempType)
        let output = input.converted(to: outputTempType)
        return Int(output.value)
    }
}

fileprivate extension UIImageView {
    func setImage(imageCode: String) {
        let container: UIView = UIView()
        container.frame = CGRect(x: 0, y: 0, width: self.image?.size.width ?? 72, height: self.image?.size.height ?? 48)
        container.backgroundColor = .clear
        
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.center = container.center
        
        container.addSubview(indicator)
        self.addSubview(container)
        indicator.startAnimating()
        
        WeatherWorker().fetchImage(code: imageCode) { image in
            DispatchQueue.main.async {
                self.image = image
                indicator.stopAnimating()
            }
        }
    }
}
