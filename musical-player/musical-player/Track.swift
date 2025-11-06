import UIKit

struct Track {
    let title: String
    let artist: String
    let coverImageName: String
    let audioFileName: String
    
    var coverImage: UIImage? {
        return UIImage(named: coverImageName)
    }
}
