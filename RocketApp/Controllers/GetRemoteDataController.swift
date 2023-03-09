import UIKit

class Rocket: Decodable {
    
    let id: String
    
    let name: String
    let type: String
    let active: Bool
    
    let stages: Int
    let boosters: Int
    let costPerLaunch: Int
    
    let firstFlight: String
    let country: String
    
    let flickrImages: [String]
    
    let height: LocalLength
    let diameter: LocalLength
    let mass: LocalWeight
        
    
    func loadRemoteData() {

        let requestUrl = URL(string: "https://api.spacexdata.com/v4/rockets")!
        var request = URLRequest(url: requestUrl)

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: requestUrl) { data, response, error in
            if let data = data {
                if let rockets = try? JSONDecoder().decode([Rocket].self, from: data) {
                    print(rockets[0])
                } else {
                    print("Invalid Response")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }

        task.resume()

    }
    
    
    
    
}

class Launch: Decodable {
    
    let id: String
    let launchLibraryId: String?
    
    let name: String
    
    let rocket: String
    let success: Bool
    
    let details: String
    let staticFireDateUnix: Int
    
    func loadRemoteData() {

        let requestUrl = URL(string: "https://api.spacexdata.com/v4/launches")!
        var request = URLRequest(url: requestUrl)

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: requestUrl) { data, response, error in
            if let data = data {
                if let rockets = try? JSONDecoder().decode([Rocket].self, from: data) {
                    print(rockets[0])
                } else {
                    print("Invalid Response")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        task.resume()
    }

    
}
