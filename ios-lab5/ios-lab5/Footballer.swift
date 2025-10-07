import Foundation

/// Модель данных для футболиста
struct Footballer {
    let name: String
    
    let imageName: String
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}

extension Footballer {
    /// Массив всех доступных футболистов 
    static let allFootballers: [Footballer] = [
        Footballer(name: "Lionel Messi", imageName: "LionelMessi"),
        Footballer(name: "Cristiano Ronaldo", imageName: "CristianoRonaldo"),
        Footballer(name: "Kylian Mbappé", imageName: "KylianMbappe"),
        Footballer(name: "Erling Haaland", imageName: "ErlingHaaland"),
        Footballer(name: "Neymar Jr", imageName: "NeymarJr"),
        Footballer(name: "Lamine Yamal", imageName: "LamineYamal"),
        Footballer(name: "Vinícius Júnior", imageName: "ViniciusJunior"),
        Footballer(name: "Kevin De Bruyne", imageName: "KevinDeBruyne"),
        Footballer(name: "Mohamed Salah", imageName: "MohamedSalah"),
        Footballer(name: "Jude Bellingham", imageName: "JudeBellingham")
    ]
    
    static func random() -> Footballer {
        return allFootballers.randomElement() ?? allFootballers[0]
    }
}

