import Foundation

protocol HeroServiceDelegate: AnyObject {
    func didFetchHero(model: HeroModel, imageData: Data)
}


struct HeroService {
    var delegate: HeroServiceDelegate?
    
    func fetchHeroes(randomId: Int) {
        let apiUrl = "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/id/\(randomId).json"
        let session = URLSession(configuration: .default)
        
        guard let url = URL(string: apiUrl) else {return}
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let error { print ("Error: \(error)") }
            
            guard let data else {return}
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print("otvet servera: \(jsonString)")
            }
            
            do {
                let model = try self.parseHeroModel(data: data)
                
                let imageUrl = URL(string: model.images.md)!
                let imageData = try! Data(contentsOf: imageUrl)
                
                DispatchQueue.main.async {
                    delegate?.didFetchHero(model: model, imageData: imageData)
                    }
                } catch {
                    print("FetchHeroes Error: \(error)")
                
            }
        }
        dataTask.resume( )
    }
    
    private func parseHeroModel(data: Data) throws -> HeroModel {
        do {
            let model = try JSONDecoder().decode(HeroModel.self, from: data)
            return model
        } catch {
            throw error
        }
    }
}
