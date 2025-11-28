import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var heroImageView: UIImageView!
    @IBOutlet private weak var heroNameLabel: UILabel!
    @IBOutlet private weak var heroFullNameLabel: UILabel!
    @IBOutlet private weak var heroHeightLabel: UILabel!
    @IBOutlet private weak var heroWeightLabel: UILabel!
    @IBOutlet private weak var heroGenderLabel: UILabel!
    @IBOutlet private weak var heroIntelligenceLabel: UILabel!
    @IBOutlet private weak var heroStrengthLabel: UILabel!
    @IBOutlet private weak var heroSpeedLabel: UILabel!
    @IBOutlet private weak var heroPowerLabel: UILabel!
    
    
    var service = HeroService()

    override func viewDidLoad() {
        super.viewDidLoad()
        service.delegate = self
    }
    
    @IBAction func randomizeHero(_ sender: Any) {
        let randomId = Int.random(in: 1...731)
        service.fetchHeroes(randomId: randomId)
        
    }


}

extension ViewController: HeroServiceDelegate {
    func didFetchHero(model: HeroModel, imageData: Data) {
        heroImageView.image = UIImage(data: imageData)
        heroNameLabel.text = "Name: \(model.name)"
        heroFullNameLabel.text = "Full name: " + (model.biography.fullName == "" ? "Unknown" : model.biography.fullName)

       heroHeightLabel.text = "Height: " + (model.appearance.height[1] != "0 cm" ? String(model.appearance.height[1]) : "Unknown")
       heroWeightLabel.text = "Weight: " + (model.appearance.weight[1] != "0 kg" ? String(model.appearance.weight[1]) : "Unknown")
       
       heroGenderLabel.text = "Gender: \(model.appearance.gender)"
        
       heroIntelligenceLabel.text = "Intelligence: \(model.powerstats.intelligence)"
       heroStrengthLabel.text = "Strength: \(model.powerstats.strength)"
       heroSpeedLabel.text = "Speed: \(model.powerstats.speed)"
       heroPowerLabel.text = "Power: \(model.powerstats.power)"
    }
}
