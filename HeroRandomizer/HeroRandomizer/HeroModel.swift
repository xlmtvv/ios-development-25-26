struct HeroModel: Codable {
    let id: Int
    let name: String
    let images: HeroImage
    let appearance: HeroAppearance
    let biography: HeroBiography
    let powerstats: HeroPowerstats
    
    struct HeroImage: Codable {
        let md: String
    }
    
    struct HeroAppearance: Codable {
        let gender: String
        let height: [String]
        let weight: [String]
    }
    
    struct HeroBiography: Codable {
        let fullName: String
    }
    
    struct HeroPowerstats: Codable {
        let strength: Int
        let intelligence: Int
        let speed: Int
        let power: Int
    }
    
}
