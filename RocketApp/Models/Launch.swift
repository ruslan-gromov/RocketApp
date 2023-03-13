struct Launch: Decodable {
    
    let id: String
    let name: String
    
    let dateUtc: String
    let flightNumber: Int

    let upcoming: Bool?
    let success: Bool?

    let rocket: String?
    
}
