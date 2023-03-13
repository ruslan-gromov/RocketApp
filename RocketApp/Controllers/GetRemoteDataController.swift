import UIKit

class NetworkManager {

    /*
    Если объявляю свойство здесь, чтобы создавать объект каждый раз при вызове функции, то получается ошибка
     
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase

    */
    
    // хотел вместо getRockets() и getLaunches() сделать унивверсальную функцию getRemoteData(url, dataType) - так будет лучше?
    
    func getRockets()  {
        
        let requestUrl = URL(string: "https://api.spacexdata.com/v4/rockets")!
        var request = URLRequest(url: requestUrl)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: requestUrl) {
            data, response, error in
            if let data = data {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                
                // если вторым параметром передаем тип данных, тогда используем его здесь вместо Launch и Rocket
                if let remoteData = try? decoder.decode([Rocket].self, from: data) {
                    print(remoteData[0])
                    
                    // вот здесь вместо print(...) пытаюсь сделать return remoteData
                    // ошибка: Unexpected non-void return value in void function
                    
                } else {
                    print("Invalid Response") // здесь таже вместо print(...) возвращаем код ошибки
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")  // здесь таже вместо print(...) возвращаем код ошибки
            }
        }
        task.resume()
    }
    
    
    func getLaunches()  {
        
        let requestUrl = URL(string: "https://api.spacexdata.com/v4/launches")!
        var request = URLRequest(url: requestUrl)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: requestUrl) {
            data, response, error in
            if let data = data {
        
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                if let remoteData = try? decoder.decode([Launch].self, from: data) {
                    print(remoteData[0])
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
