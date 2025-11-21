import UIKit

class CoursesViewController: FavoritesListViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Courses"
        items = [
            FavoriteItem(
                title: "iOS Development",
                imageName: "course1",
                description: "Практический курс по UIKit, Auto Layout и архитектуре приложений. Много проектов и работы со Storyboard.",
                myThoughts: "Именно здесь понял, как работает весь pipeline от идеи до App Store."
            ),
            FavoriteItem(
                title: "Algorithms and Data Structures",
                imageName: "course2",
                description: "Базовый предмет для понимания эффективности кода, включая графы, деревья и динамическое программирование.",
                myThoughts: "Сложный, но без него невозможно проходить собеседования и писать оптимальный код."
            ),
            FavoriteItem(
                title: "History of Kazakhstan",
                imageName: "course3",
                description: "Изучение ключевых событий и личностей региона, формирование критического взгляда на прошлое.",
                myThoughts: "Интересно понять корни традиций и современную идентичность."
            ),
            FavoriteItem(
                title: "Blockchain Development",
                imageName: "course4",
                description: "Основы смарт-контрактов, безопасность и применение децентрализованных технологий.",
                myThoughts: "Нравится сочетание криптографии и реальных кейсов."
            ),
            FavoriteItem(
                title: "Discrete Structures",
                imageName: "course5",
                description: "Комбинаторика, логика, множества и графы как фундаментальная база CS.",
                myThoughts: "Сначала тяжело, но потом замечаешь, как это помогает в алгоритмах."
            ),
            FavoriteItem(
                title: "iOS Development",
                imageName: "course1",
                description: "Практический курс по UIKit, Auto Layout и архитектуре приложений. Много проектов и работы со Storyboard.",
                myThoughts: "Именно здесь понял, как работает весь pipeline от идеи до App Store."
            ),
            FavoriteItem(
                title: "Algorithms and Data Structures",
                imageName: "course2",
                description: "Базовый предмет для понимания эффективности кода, включая графы, деревья и динамическое программирование.",
                myThoughts: "Сложный, но без него невозможно проходить собеседования и писать оптимальный код."
            ),
            FavoriteItem(
                title: "History of Kazakhstan",
                imageName: "course3",
                description: "Изучение ключевых событий и личностей региона, формирование критического взгляда на прошлое.",
                myThoughts: "Интересно понять корни традиций и современную идентичность."
            ),
            FavoriteItem(
                title: "Blockchain Development",
                imageName: "course4",
                description: "Основы смарт-контрактов, безопасность и применение децентрализованных технологий.",
                myThoughts: "Нравится сочетание криптографии и реальных кейсов."
            ),
            FavoriteItem(
                title: "Discrete Structures",
                imageName: "course5",
                description: "Комбинаторика, логика, множества и графы как фундаментальная база CS.",
                myThoughts: "Сначала тяжело, но потом замечаешь, как это помогает в алгоритмах."
            ),
            
        ]
    }
}
