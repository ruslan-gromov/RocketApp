import UIKit

public class PickFlavorViewController: UIViewController {
  // MARK: - Instance Properties
  public var flavors: [Flavor] = []
  private let flavorFactory = FlavorFactory()

  // MARK: - Outlets
  @IBOutlet var contentView: UIView!
  @IBOutlet var collectionView: UICollectionView!
//  @IBOutlet var iceCreamView: IceCreamView!
  @IBOutlet var label: UILabel!

  // MARK: - View Lifecycle
  public override func viewDidLoad() {
    super.viewDidLoad()

    loadFlavors()
  }

  private func loadFlavors() {
    // TO-DO: Implement this
  }

  private func selectFirstFlavor() {
    guard let flavor = flavors.first else {
      return
    }
    update(with: flavor)
  }
}

// MARK: - FlavorAdapter
extension PickFlavorViewController: FlavorAdapter {
  public func update(with flavor: Flavor) {
//    iceCreamView.update(with: flavor)
    label.text = flavor.name
  }
}

// MARK: - UICollectionViewDataSource
extension PickFlavorViewController: UICollectionViewDataSource {
  private struct CellIdentifiers {
    static let scoop = "ScoopCell"
  }

  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return flavors.count
  }

  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.scoop, for: indexPath) as! ScoopCell
    let flavor = flavors[indexPath.row]
    cell.update(with: flavor)
    return cell
  }
}

// MARK: - UICollectionViewDelegate
extension PickFlavorViewController: UICollectionViewDelegate {
  public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let flavor = flavors[indexPath.row]
    update(with: flavor)
  }
}





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

