//
//  ViewController.swift
//  RocketApp
//
//  Created by Ruslan Gromov on 05.03.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let url = URL(string: "https://api.spacexdata.com/v4/rockets")!

        var request = URLRequest(url: url)

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
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

