//
//  ViewController.swift
//  WeatherApp
//
//  Created by Arthur Azevedo Salgado (P) on 10/09/22.
//

import UIKit

protocol WeatherDisplayLogic: AnyObject {
    func showLoading(_ loading: Bool)
    func displayError(with: WAError)
    func display(weather: WeatherResponse)
}

class WeatherViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var weather: WeatherResponse?
    var interactor: WeatherBusinessLogic?
    var router: WeatherRoutingLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.handleFetchWeather()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
      super.init(coder: aDecoder)
      setup()
    }
    
    private func setup()
    {
        let vc = self
        let interactor = WeatherInteractor()
        let router = WeatherRouter()
        let presenter = WeatherPresenter()
        let worker = WeatherWorker()
        
        vc.interactor = interactor
        vc.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        router.viewController = vc
        presenter.viewController = vc
    }
}

extension WeatherViewController: WeatherDisplayLogic {
    
    func showLoading(_ loading: Bool) {
        DispatchQueue.main.async {
            if loading {
                self.view.showBlurLoader()
            } else {
                self.view.removeBlurLoader()
            }
            self.tableView.reloadData()
        }
    }
    
    func displayError(with: WAError) {
        switch with {
            case .invalidURL:
                AlertView.showAlert(view: self, alert: AlertContext.invalidURL)
            case .invalidResponse:
                AlertView.showAlert(view: self, alert: AlertContext.invalidResponse)
            case .invalidData:
                AlertView.showAlert(view: self, alert: AlertContext.invalidData)
            case .unableToComplete:
                AlertView.showAlert(view: self, alert: AlertContext.unableToComplete)
        }
    }
    
    func display(weather: WeatherResponse) {
        self.weather = weather
    }
}

extension WeatherViewController {
    func setupTableView() {
        tableView.register(WeatherTableViewCell.nib(), forCellReuseIdentifier: WeatherTableViewCell.identifier)
        tableView.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath)
        if let weatherCell = cell as? WeatherTableViewCell, let weather = weather {
            weatherCell.config(with: weather)
            return weatherCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .black
    }
}
