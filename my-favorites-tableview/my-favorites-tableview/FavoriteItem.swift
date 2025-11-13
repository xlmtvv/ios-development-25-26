import Foundation

struct FavoriteItem {
    let title: String
    let subtitle: String
    let review: String
    let imageName: String
}


enum FavoriteCategory: Int, CaseIterable {
    case movies = 0
    case music = 1
    case books = 2
    case courses = 3
    
    var title: String {
        switch self {
            case .movies: return "Favorite Movies"
            case .music: return "Favorite Music"
            case .books: return "Favorite Books"
            case .courses: return "Favorite Courses"
        }
    }
}
