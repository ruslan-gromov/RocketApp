import UIKit

struct Rocket: Decodable {

    // describing simple props
    
    let id: String
    
    let name: String
    let type: String
    let active: Bool
    // to short up print result -> let description: String
    
    let stages: Int
    let boosters: Int
    let cost_per_launch: Int
    
    let first_flight: String
    let country: String
    
    let flickr_images: [String]
    
    // describing complex props
    
    struct LocalLength: Decodable {
        let meters: Double
        let feet: Double
    }
    
    struct LocalWeight: Decodable {
        let kg: Int
        let lb: Int
    }
    
    let height: LocalLength
    let diameter: LocalLength
    let mass: LocalWeight
    
    struct LocalThrust: Decodable {
        let kN: Int
        let lbf: Int
    }
    
    // is it correct?
    struct Stages: Decodable {
        let thrust_sea_level: LocalThrust
        let thrust_vacuum: LocalThrust
        let reusable: Bool
        let engines: Int
        let fuel_amount_tons: Int
        let burn_time_sec: Int? // can have nil value
    }
    
    // some bug here...
    // let first_stage: Stages
    
}

