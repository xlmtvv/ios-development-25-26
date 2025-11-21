import UIKit

class MusicViewController: FavoritesListViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Music"
        items = [
              FavoriteItem(
                  title: "Love Me — Lil Wayne",
                  imageName: "music1",
                  description: "Темный, атмосферный трек с мощным битом и сложными рифмами. Отлично передаёт настроение ранних десятых.",
                  myThoughts: "Слушаю, когда нужна энергия. Инструментал идеально сочетается с вокалом Drake."
              ),
              FavoriteItem(
                  title: "Jumpman — Drake & Future",
                  imageName: "music2",
                  description: "Гимн совместного микстейпа What a Time To Be Alive. Трек про победы, амбиции и уверенность.",
                  myThoughts: "Идеальна для тренировок и поездок. Бит Metro Boomin мгновенно поднимает настроение."
              ),
              FavoriteItem(
                  title: "BAND4BAND — Gunna & Offset",
                  imageName: "music3",
                  description: "хит из Атланты с фирменным потоком и яркими метафорами. Много воздуха и плотного баса.",
                  myThoughts: "Нравится, как Gunna смешивает мелодичность и агрессию. Отличный пример современного trap-звука."
              ),
              FavoriteItem(
                  title: "Up Down — T-Pain ft. B.o.B",
                  imageName: "music4",
                  description: "Весёлый клубный трек с автотюном и фанковым настроением. Смесь старой школы и электронных элементов.",
                  myThoughts: "Включаю на вечеринках — проверенный способ раскачать людей."
              ),
              FavoriteItem(
                  title: "I Wanna Love You — Akon ft. Snoop Dogg",
                  imageName: "music5",
                  description: "Гладкий R&B с расслабленной подачей и узнаваемым вокалом Akon. Лирика о влечении и ночной жизни.",
                  myThoughts: "Ностальгия по 2000‑м. Вечная химия между Akon и Snoop."
              ),
              FavoriteItem(
                  title: "Love Me — Lil Wayne",
                  imageName: "music1",
                  description: "Темный, атмосферный трек с мощным битом и сложными рифмами. Отлично передаёт настроение ранних десятых.",
                  myThoughts: "Слушаю, когда нужна энергия. Инструментал идеально сочетается с вокалом Drake."
              ),
              FavoriteItem(
                  title: "Jumpman — Drake & Future",
                  imageName: "music2",
                  description: "Гимн совместного микстейпа What a Time To Be Alive. Трек про победы, амбиции и уверенность.",
                  myThoughts: "Идеальна для тренировок и поездок. Бит Metro Boomin мгновенно поднимает настроение."
              ),
              FavoriteItem(
                  title: "BAND4BAND — Gunna & Offset",
                  imageName: "music3",
                  description: "хит из Атланты с фирменным потоком и яркими метафорами. Много воздуха и плотного баса.",
                  myThoughts: "Нравится, как Gunna смешивает мелодичность и агрессию. Отличный пример современного trap-звука."
              ),
              FavoriteItem(
                  title: "Up Down — T-Pain ft. B.o.B",
                  imageName: "music4",
                  description: "Весёлый клубный трек с автотюном и фанковым настроением. Смесь старой школы и электронных элементов.",
                  myThoughts: "Включаю на вечеринках — проверенный способ раскачать людей."
              ),
              FavoriteItem(
                  title: "I Wanna Love You — Akon ft. Snoop Dogg",
                  imageName: "music5",
                  description: "Гладкий R&B с расслабленной подачей и узнаваемым вокалом Akon. Лирика о влечении и ночной жизни.",
                  myThoughts: "Ностальгия по 2000‑м. Вечная химия между Akon и Snoop."
              )
        ]
    }
}
