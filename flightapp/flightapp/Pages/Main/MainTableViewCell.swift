//
//  MainTableViewCell.swift
//  flightapp
//
//  Created by Onur Mavitas on 10.06.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    @IBOutlet weak var lblHavayolu: UILabel!
    @IBOutlet weak var lblKalkis: UILabel!
    @IBOutlet weak var lblVaris: UILabel!
    @IBOutlet weak var imgStatus: UIImage!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(flight: FlightData) {
        let arr_estimated: String = flight.arrival.estimated!
        let range = NSRange(location: 0, length: arr_estimated.utf16.count)
        let regex = try! NSRegularExpression(pattern: "T..:..")
        regex.firstMatch(in: arr_estimated, options: [], range: range)
        
        
        lblVaris.text = "Varış: \(flight.arrival.icao!) - \(flight.arrival.estimated!)"
        lblKalkis.text = "Kalkış: \(flight.departure.icao!) - \(flight.departure.estimated!)"
        lblHavayolu.text = "Havayolu: \(flight.airline.name!)"
        
    }
    
}
