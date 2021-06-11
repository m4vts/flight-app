//
//  MainViewController.swift
//  flightapp
//
//  Created by Onur Mavitas on 10.06.2021.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var flightApi = API()
    
    @IBOutlet weak var tableView: UITableView!
    let myData = ["1","2","3","4"]
    var flights = [FlightData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "MainTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MainTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationItem.title = "Flight"
        
        flightApi.performRequest(completionHandler: { [weak self] response in
            self?.flights = response.data ?? []
            self?.tableView.reloadData()
        })
        
    }

    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        let flight = flights[indexPath.row]
        cell.configureCell(flight: flight)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            detailVC.flight = flights[indexPath.row]
            navigationController?.pushViewController(detailVC, animated: true)
        }
        
    }
}
