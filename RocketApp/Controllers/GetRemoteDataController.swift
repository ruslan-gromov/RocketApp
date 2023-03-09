import UIKit

public class Rocket: Decodable {
    
    private let id: String
    
    public let name: String
    public let type: String
    public let active: Bool
    
    public let stages: Int
    public let boosters: Int
    public let costPerLaunch: Int
    
    public let firstFlight: String
    public let country: String
    
    public let flickrImages: [String]
    
    internal let height: LocalLength
    internal let diameter: LocalLength
    internal let mass: LocalWeight
        
    
    private func loadRemoteData() -> String {

        let requestUrl = URL(string: "https://api.spacexdata.com/v4/rockets")!
        var request = URLRequest(url: requestUrl)
        var result: String

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: requestUrl) { data, response, error in
            if let data = data {
                if let rockets = try? JSONDecoder().decode([Rocket].self, from: data) {
                    result = "sdsdfd"
                } else {
                   // return "Invalid Response"
                }
            } else if let error = error {
                // return "HTTP Request Failed \(error)"
            }
        }

        task.resume()

        return result

    }
    
    
    
    
}


public class Launch: Decodable {
    
    private let id: String
    private let launchLibraryId: String?
    
    public let name: String
    
    private let rocket: String
    public let success: Bool
    
    public let details: String
    public let staticFireDateUnix: Int
    
    private func loadRemoteData() {

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
