//
//  DetailViewController.swift
//  flightapp
//
//  Created by Onur Mavitas on 10.06.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var flight: FlightData?

    @IBOutlet weak var lblDepAbr: UILabel!
    @IBOutlet weak var lblDepAirport: UILabel!
    @IBOutlet weak var lblDepDate: UILabel!
    @IBOutlet weak var lblDepTime: UILabel!
    
    @IBOutlet weak var lblArrAbr: UILabel!
    @IBOutlet weak var lblArrAirport: UILabel!
    @IBOutlet weak var lblArrDate: UILabel!
    @IBOutlet weak var lblArrTime: UILabel!
    
    @IBOutlet weak var lblFlight: UILabel!
    @IBOutlet weak var lblTerminal: UILabel!
    @IBOutlet weak var lblGate: UILabel!
    @IBOutlet weak var lblDelay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addBackground(imageName: "PlaneStraight",x: 0, y: CGFloat(70)+self.topbarHeight, height: CGFloat(259.0))
        self.view.addBackground(imageName: "bg", x: 0, y: 0+self.topbarHeight, height: CGFloat(280.0))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lblDepAbr.text = flight?.departure.icao!
        lblArrAbr.text = flight?.arrival.icao!
        
        lblDepAirport.text = flight?.departure.airport!
        lblArrAirport.text = flight?.arrival.airport!
        
        lblTerminal.text = flight?.departure.terminal!
        
        if let safeGate = flight?.departure.gate {
            lblGate.text = safeGate
        } else {
            lblGate.text = "N/A"
        }
        
        //lblDelay.text = flight?.departure.delay!
    }
    


}
