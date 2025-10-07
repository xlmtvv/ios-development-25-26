

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    /// Связь с картинкой футболиста в Storyboard
    @IBOutlet weak var footballerImageView: UIImageView!
    
    /// Связь с текстом имени футболиста
    @IBOutlet weak var footballerNameLabel: UILabel!
    

    private var currentFootballer: Footballer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Начальная настройка интерфейса
        setupUI()
        
        // Показываем первого случайного футболиста при запуске
        showRandomFootballer()
    }
    
    private func setupUI() {
        // Настройка Image View
        // Скругляем углы
        footballerImageView.layer.cornerRadius = 16
        footballerImageView.clipsToBounds = true
        
        //тень для объёмности
        footballerImageView.layer.shadowColor = UIColor.black.cgColor
        footballerImageView.layer.shadowOpacity = 0.3
        footballerImageView.layer.shadowOffset = CGSize(width: 0, height: 4)
        footballerImageView.layer.shadowRadius = 8
        
        //Настройка лэйбла
        footballerNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        footballerNameLabel.textAlignment = .center
        footballerNameLabel.textColor = .systemBlue
        footballerNameLabel.numberOfLines = 1
        footballerNameLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func showRandomFootballer() {
        //рандом футболист
        let footballer = Footballer.random()
        
        currentFootballer = footballer
        
        // Обновляем UI с новыми данными
        updateUI(with: footballer)
        
        // принт нынешнего футболиста
        print("⚽️ Показан футболист: \(footballer.name)")
    }
    

    private func updateUI(with footballer: Footballer) {
        // Устанавливаем картинку из Assets.xcassets

        footballerImageView.image = UIImage(named: footballer.imageName)
        
        footballerNameLabel.text = footballer.name
        
        // добавили анимацию
        animateFootballerAppearance()
    }
    

    private func animateFootballerAppearance() {
        // Начальное состояни невидим и уменьшен
        footballerImageView.alpha = 0
        footballerImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        //Анимация
        UIView.animate(
            withDuration: 0.5,              // Длительность: 0.5 секунды
            delay: 0,                        // Без задержки
            usingSpringWithDamping: 0.7,    // Упругость пружины
            initialSpringVelocity: 0.5,     // Начальная скорость
            options: .curveEaseOut          // Кривая замедления
        ) {
            //Конечное состояние норм размер
            self.footballerImageView.alpha = 1
            self.footballerImageView.transform = .identity
        }
    }
    

    @IBAction func randomizeButtonTapped(_ sender: UIButton) {
 
        showRandomFootballer()
        
        // Тактильная вибрация (работает на реальном iPhone)
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
        // Анимация кнопки при нажатии (визуальная обратная связь)
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                sender.transform = .identity
            }
        }
    }
}



