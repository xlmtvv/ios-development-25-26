import Foundation
import Alamofire

protocol HeroServiceDelegate: AnyObject {
    func didFetchHero(model: HeroModel)
    func didFail(with error: Error)
    
}


struct HeroService {
    var delegate: HeroServiceDelegate?
    
    func fetchHeroes() {
        let randomId = Int.random(in: 1...731)
        let apiUrl = "https://akabab.github.io/superhero-api/api/id/\(randomId).json"
        
        
        AF.request(apiUrl).responseDecodable(of: HeroModel.self) { response in
            switch response.result {
            case .success(let model):
                delegate?.didFetchHero(model: model)
            case .failure(let error):
                delegate?.didFail(with: error)
            }
                
        }
        
    }
    

}

