struct Rocket: Decodable {
    
    let id: String
    let name: String
    
    let type: String
    let active: Bool
    
    let stages: Int
    let boosters: Int
    let costPerLaunch: Double?
    
    let firstFlight: String
    let country: String
    
    let flickrImages: [String]
    
    let diameter: Length
    let height: Length
    let mass: Mass
    
    let firstStage: FirstStage
    let secondStage: SecondStage
    
    
}

extension Rocket {
    
    struct Length: Decodable {
        let meters: Double?
        let feet: Double?
    }
    
    struct Mass: Decodable {
        let kg: Double?
        let lb: Double?
    }

    struct Force: Decodable {
        let kN: Double?
        let lbf: Double?
    }
    
    struct FirstStage: Decodable {
        let thrustSeaLevel: Force
        let thrustVacuum: Force
        let reusable: Bool
        let engines: Int?
        let fuel_amount_tons: Int?
        let burn_time_sec: Int?
    }
    
    struct SecondStage: Decodable {
        let thrust: Force
        let reusable: Bool
        let engines: Int?
        let payloads: Payloads
        let fuelAmountTons: Double?
        let burnTimeSec: Double?
    }
    
    struct Payloads: Decodable {
        let compositeFairing: CompositeFairing
    }
    
    struct CompositeFairing: Decodable {
        let height: Length
        let diameter: Length
    }
    
}
