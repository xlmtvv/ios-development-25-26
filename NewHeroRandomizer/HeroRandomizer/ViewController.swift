import UIKit
import Kingfisher

class ViewController: UIViewController, HeroServiceDelegate {
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

    @IBOutlet private weak var errorLabel: UILabel!
    
    
    var service = HeroService()

    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true

        service.delegate = self
        
        setupInitialHero()
    }
    
    @IBAction func randomizeHero(_ sender: Any) {
        service.fetchHeroes()
    }

    
    func didFetchHero(model: HeroModel) {
        errorLabel.isHidden = true
        heroNameLabel.text = "Name: \(model.name)"
        heroFullNameLabel.text = "Full name: " + (model.biography.fullName == "" ? "Unknown" : model.biography.fullName)

       heroHeightLabel.text = "Height: " + (model.appearance.height[1] != "0 cm" ? String(model.appearance.height[1]) : "Unknown")
       heroWeightLabel.text = "Weight: " + (model.appearance.weight[1] != "0 kg" ? String(model.appearance.weight[1]) : "Unknown")
       
       heroGenderLabel.text = "Gender: \(model.appearance.gender)"
        
       heroIntelligenceLabel.text = "Intelligence: \(model.powerstats.intelligence)"
       heroStrengthLabel.text = "Strength: \(model.powerstats.strength)"
       heroSpeedLabel.text = "Speed: \(model.powerstats.speed)"
       heroPowerLabel.text = "Power: \(model.powerstats.power)"
        if let url = URL(string: model.images.md) {
            heroImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "person.fill.questionmark"))
        } else {
            heroImageView.image = UIImage(systemName: "person.fill.questionmark")
        }

        storeHeroLocally(model: model)

        
        
        
    }

    func didFail(with error: Error) {
        errorLabel.text = "Error loading your superhero, try again!"


        heroNameLabel.text = "Name: —"
        heroFullNameLabel.text = "Full name: —"
        heroHeightLabel.text = "Height: —"
        heroWeightLabel.text = "Weight: —"
        heroGenderLabel.text = "Gender: —"
        heroIntelligenceLabel.text = "Intelligence: —"
        heroStrengthLabel.text = "Strength: —"
        heroSpeedLabel.text = "Speed: —"
        heroPowerLabel.text = "Power: —"
        
        errorLabel.isHidden = false
        print("error fetching hero: \(error)")

        heroImageView.image = UIImage(systemName: "person.fill.questionmark")
        let alert = UIAlertController(title: "Error", message: "Failed to fetch hero. Please try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    
    private func storeHeroLocally(model: HeroModel) {
        do {
            let data = try PropertyListEncoder().encode(model)
            UserDefaults.standard.set(data, forKey: "heroModel")
            print("hero sohranen localno")
        } catch {
            print("error saving : \(error)")
        }
    }
    
    
    private func setupInitialHero() {
        guard let heroData = UserDefaults.standard.data(forKey: "heroModel"), let model = try? PropertyListDecoder().decode(HeroModel.self, from: heroData) else {
            return
        }
        
        didFetchHero(model: model)
        
    }

}

