# ⚽️ Randomizer App - Footballers

## 📱 Project Description
iOS application that displays random footballers from a collection of 10 famous players. Built with UIKit and Storyboard as part of iOS Development Lab 5 at KBTU.

---

## 🎯 Features
- **Random Selection**: Tap the "Randomize" button to display a random footballer
- **10 Footballers**: Collection includes popular players like Messi, Ronaldo, Mbappé, and more
- **Smooth Animations**: Spring animation when footballer appears
- **Adaptive Layout**: Works on all iPhone sizes using Auto Layout
- **Haptic Feedback**: Button vibration on tap (on real devices)

---

## 🛠️ Technical Stack
- **Language**: Swift 5.0
- **Framework**: UIKit
- **UI**: Storyboard
- **Layout**: Auto Layout with constraints
- **Min iOS**: 26.0
- **Xcode**: 26.0.1

---

## 📂 Project Structure
```
ios-lab5/
├── AppDelegate.swift          # App lifecycle
├── SceneDelegate.swift        # Scene management
├── ViewController.swift       # Main screen logic
├── Footballer.swift           # Data model
├── Main.storyboard           # UI layout
├── Assets.xcassets/          # Images
│   ├── LionelMessi
│   ├── CristianoRonaldo
│   ├── KylianMbappe
│   └── ... (7 more)
└── Info.plist
```

---

## ⚽️ Footballers Included
1. Lionel Messi
2. Cristiano Ronaldo
3. Kylian Mbappé
4. Erling Haaland
5. Neymar Jr
6. Lamine Yamal
7. Vinícius Júnior
8. Kevin De Bruyne
9. Mohamed Salah
10. Jude Bellingham

---

## 📱 Tested Devices
- ✅ iPhone SE (3rd generation) - Small screen
- ✅ iPhone 15 Pro - Medium screen
- ✅ iPhone 15 Pro Max - Large screen

All devices tested in **Portrait** orientation.

---

## 🎨 Design Features
- **Rounded corners** on images (16px radius)
- **Shadow effect** for depth
- **Spring animation** for smooth transitions
- **Adaptive text sizing** for long names
- **System colors** for consistency

---

## 🚀 How to Run
1. Clone the repository
2. Open `ios-lab5.xcodeproj` in Xcode 26.0+
3. Select a simulator (iPhone 15 Pro recommended)
4. Press `Cmd + R` or click ▶️ Run button

---

## 📋 Requirements Met
- ✅ UIKit with Storyboard
- ✅ UIImageView, UILabel, UIButton
- ✅ IBOutlet and IBAction connections
- ✅ Auto Layout for all iPhone sizes
- ✅ 10+ items with images in Assets
- ✅ Well-designed interface
- ✅ Tested on multiple simulators

---

## ⚠️ Known Limitations
- Images require internet connection if using remote URLs (currently using local Assets)
- Haptic feedback only works on real devices (not simulator)
- No landscape orientation support (could be added with additional constraints)

---

## 👨‍💻 Author
Alisher Mutaliyev - KBTU iOS Development Course (2025)

---

## 📄 License
Educational project for KBTU iOS Development Lab 5
