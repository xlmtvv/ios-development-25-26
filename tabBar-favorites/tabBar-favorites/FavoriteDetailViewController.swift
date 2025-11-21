import UIKit

class FavoriteDetailViewController: UIViewController {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var reviewTextLabe: UILabel!
    
    var item: FavoriteItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let item else { return }
        
        coverImageView.image = UIImage(named: item.imageName) ?? UIImage(systemName: "photo")
        titleLabel.text = item.title
        descriptionTextLabel.text = item.description
        reviewTextLabe.text = item.myThoughts
    }
}

