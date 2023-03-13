import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rocketsData = NetworkManager()
        
        rocketsData.getRockets()
        rocketsData.getLaunches()
        
        /*
        // как правильно сделать?
        
        // JSONDecoder нужно вынести в свойство, чтобы не создавать его при каждом запросе
        // Пишем класс, который умеет скачивать данные из сети и возвращать нам массив структур (наших моделей)
         
         class NetworkManager {
             let decoder = JSONDecoder()
             
             func getRockets() {
                 ...
                 ...
                 decoder.decode...
                 ...
             }
         }
         */
        
    }
}
