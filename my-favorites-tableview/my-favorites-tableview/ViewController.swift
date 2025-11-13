import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var favoriteItems: [[FavoriteItem]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        loadFavoriteItems()
        tableView.reloadData()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
        
        tableView.tableFooterView = UIView()
    }
    
    private func loadFavoriteItems() {
        let movies = [
            FavoriteItem(
                title: "Интерстеллар",
                subtitle: "Режиссёр: Кристофер Нолан",
                review: "Космос, время всё идеально. Каждый раз пересматриваю и нахожу что-то новое. Музыка Ханса Циммера топ",
                imageName: "movie1"
            ),
            FavoriteItem(
                title: "Престиж",
                subtitle: "Режиссёр: Кристофер Нолан",
                review: "Концовка взрывает мозг каждый раз. Два фокусника, загадки, соревнование. Любимый фильм",
                imageName: "movie2"
            ),
            FavoriteItem(
                title: "Начало",
                subtitle: "Режиссёр: Кристофер Нолан",
                review: "Сны внутри снов - гениально придумано. Сюжет закрученный, но если вникнуть, то становится ещё круче.",
                imageName: "movie3"
            ),
            FavoriteItem(
                title: "1+1",
                subtitle: "Режиссёр: Оливье Накаш, Эрик Толедано",
                review: "Смотрел раз пять наверное. Такая добрая и смешная история про дружбу, что каждый раз улыбаешься. Просто душевный фильм",
                imageName: "movie4"
            ),
            FavoriteItem(
                title: "Звёздные войны: Месть ситхов",
                subtitle: "Режиссёр: Джордж Лукас",
                review: "Превращение Энакина в Дарта Вейдера - лучший момент всей саги. Битва на Мустафаре огонь! Эпичный финал и лучший фильм по зв.",
                imageName: "movie5"
            )
        ]
        
        let music = [
            FavoriteItem(
                title: "Love Me",
                subtitle: "Lil Wayne ft. Drake & Future",
                review: "Трек качает с первых секунд. Лил Уэйн, Дрейк и Фьючер вместе - это просто бомба.",
                imageName: "music1"
            ),
            FavoriteItem(
                title: "Jumpman",
                subtitle: "Drake & Future",
                review: "Когда включается этот трек, настроение сразу поднимается. Дрейк с Фьючером всегда выдают хиты",
                imageName: "music2"
            ),
            FavoriteItem(
                title: "BAND4BAND",
                subtitle: "Central Cee ft. Lil Baby",
                review: "Централ Си огонь, а с Лил Бейби вообще топ получился. Бит жёсткий, текст заходит, норм дрилл.",
                imageName: "music3"
            ),
            FavoriteItem(
                title: "Up Down (Do This All Day)",
                subtitle: "T-Pain ft. B.o.B",
                review: "Олдскульный трек, который никогда не надоест. Т-Пейн легенда",
                imageName: "music4"
            ),
            FavoriteItem(
                title: "I Wanna Love You",
                subtitle: "Akon ft. Snoop Dogg",
                review: "Этот топ трек из детства! Эйкон и снупдог сделали вечный хит",
                imageName: "music5"
            )
        ]
        
        let books = [
            FavoriteItem(
                title: "Гарри Поттер",
                subtitle: "Автор: Джоан Роулинг",
                review: "С этой серии началась любовь к чтению. Волшебный мир, крутые персонажи, куча приключений. Перечитывал  много раз",
                imageName: "book1"
            ),
            FavoriteItem(
                title: "Властелин колец",
                subtitle: "Автор: Дж. Р. Р. Толкин",
                review: "Эпичное фэнтези, которое создало целый жанр. Путешествие Фродо просто легендарное. Книга намного круче фильмов",
                imageName: "book2"
            ),
            FavoriteItem(
                title: "Маленький принц",
                subtitle: "Автор: Антуан де Сент-Экзюпери",
                review: "Маленькая книга с огромным смыслом. Каждый раз читаешь и понимаешь что-то новое. Любимая книга детства",
                imageName: "book3"
            ),
            FavoriteItem(
                title: "Мост в Терабитию",
                subtitle: "Автор: Кэтрин Патерсон",
                review: "Читал в детстве и запомнил на всю жизнь. История про дружбу и воображение. Концовка очень трогательная",
                imageName: "book4"
            ),
            FavoriteItem(
                title: "Ведьмак",
                subtitle: "Автор: Анджей Сапковский",
                review: "Геральт - один из лучших персонажей в фэнтези. Мир ведьмака прописан детально, сюжет затягивает. После игр решил прочитать книги и не пожалел",
                imageName: "book5"
            )
        ]
        
        let courses = [
            FavoriteItem(
                title: "iOS Development",
                subtitle: "INFT3136",
                review: "Делаем свои приложения с нуля, изучаем Swift и UIKit. Каждая лабка все сложнее и сложнее, но интереснее",
                imageName: "course1"
            ),
            FavoriteItem(
                title: "Algorithms and Data Structures",
                subtitle: "CSCI2105",
                review: "Сложно, но очень полезно. Теперь понимаю, как всё работает под капотом. Алгоритмы решают реальные задачи, это важно знать!",
                imageName: "course2"
            ),
            FavoriteItem(
                title: "History of Kazakhstan",
                subtitle: "HUM1101_R",
                review: "Профессор Абылхожин топ, вытащил предмет",
                imageName: "course3"
            ),
            FavoriteItem(
                title: "Blockchain Development",
                subtitle: "INFT3212",
                review: "Изучаем криптовалюты, смарт-контракты и децентрализацию. Сложная тема, но очень перспективная",
                imageName: "course4"
            ),
            FavoriteItem(
                title: "Discrete Structures",
                subtitle: "CSCI1102",
                review: "Джанкиева топ, лучший препод по матеше",
                imageName: "course5"
            )
        ]
        
        favoriteItems = [movies, music, books, courses]
    }

    
}


extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return favoriteItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteItems[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTableViewCell", for: indexPath)  as? FavoriteTableViewCell else {
            return UITableViewCell()
        }
        
        let item = favoriteItems[indexPath.section][indexPath.row]
        
        cell.configure(with: item)
                                  
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let category = FavoriteCategory(rawValue: section) else {
            return nil
        }
        return category.title
    }
    
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = favoriteItems[indexPath.section][indexPath.row]
        print("выбрано: \(item.title)")
    }
    
    
}
