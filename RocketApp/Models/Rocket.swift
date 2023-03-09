struct LocalLength: Decodable {
    let meters: Double
    let feet: Double
}

struct LocalWeight: Decodable {
    let kg: Int
    let lb: Int
}

struct LocalThrust: Decodable {
    let kN: Int
    let lbf: Int
}


// is it correct?
struct Stages: Decodable {
    let thrustSeaLevel: LocalThrust
    let thrustVacuum: LocalThrust
    let reusable: Bool
    let engines: Int
    let fuelAmountTons: Int
    let burnTimeSec: Int?
}
