import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCellAppearance()
    }
    
    private func setupCellAppearance(){
        favoriteImageView.layer.cornerRadius = 8
        favoriteImageView.clipsToBounds = true
    }
    
    func configure(with item: FavoriteItem) {
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        reviewLabel.text = item.review
        
        if let image = UIImage(named: item.imageName) {
            favoriteImageView.image = image
            favoriteImageView.contentMode = .scaleAspectFill
        } else {
            favoriteImageView.image = UIImage(systemName: "photo")
            favoriteImageView.contentMode = .scaleAspectFit
            favoriteImageView.tintColor = .systemGray
        }
        
    }
    

    
}
