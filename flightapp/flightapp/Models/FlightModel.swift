//
//  FlightModel.swift
//  flightapp
//
//  Created by Onur Mavitas on 11.06.2021.
//

import Foundation

struct FlightData: Codable {
    /*
    enum FlightStatus: String, Codable {
        case active, cancelled, scheduled
    }
    */
    var flight_date: String?
    /*
    var flight_status: FlightStatus
     */
    var departure: Departure
     
    var arrival: Arrival
     
    var airline: Airline
     
    var flight: Flight
 
}

struct Departure: Codable {
    /*
    
    let timezone: String?
    
    
    
 */
    let gate: String?
    //let delay: String?
    let terminal: String?
    let airport: String?
    let icao: String?
    let estimated: String?

}
struct Arrival: Codable {
    /*
    
    let timezone: String?
    let terminal: String?
    let gate: String?
    let delay: String?
    */
    let airport: String?
    let icao: String?
    let estimated: String?

}
struct Airline: Codable {
    let name: String?

}
struct Flight: Codable {
    let number: String?
    let iata: String?
    let icao: String?

}
