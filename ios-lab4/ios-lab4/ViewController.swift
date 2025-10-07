

import UIKit

class ViewController: UIViewController {
    
    let diceImages = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]


    override func viewDidLoad() {
        super.viewDidLoad()
        rollDice()
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        rollDice()
    }
    
    func rollDice() {
            //Анимация вращения и увеличения(0.5 сек)
            UIView.animate(withDuration: 0.5, animations: {
                
                // Увеличение размера
                self.leftDiceImageView.transform = self.leftDiceImageView.transform.scaledBy(x: 1.2, y: 1.2)
                self.rightDiceImageView.transform = self.rightDiceImageView.transform.scaledBy(x: 1.2, y: 1.2)
            }) { _ in
                //После анимации меняем картинки
                let leftRandomIndex = Int.random(in: 0...5)
                let rightRandomIndex = Int.random(in: 0...5)
                
                self.leftDiceImageView.image = UIImage(named: self.diceImages[leftRandomIndex])
                self.rightDiceImageView.image = UIImage(named: self.diceImages[rightRandomIndex])
                
                //Возвращаем нормальный размер
                UIView.animate(withDuration: 0.3) {
                    self.leftDiceImageView.transform = .identity
                    self.rightDiceImageView.transform = .identity
                }
                
                print("Левый: \(self.diceImages[leftRandomIndex]), Правый: \(self.diceImages[rightRandomIndex])")
            }
        }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            print("📳 Встряхивание обнаружено!")
            rollDice()
        }
    }

    @IBOutlet var leftDiceImageView: UIImageView!
    
    @IBOutlet var rightDiceImageView: UIImageView!
    
    
    
    
    
    
    
    
}

