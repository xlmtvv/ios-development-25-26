# iOS Lab 5 - Copilot Instructions

## Project Overview
This is a UIKit-based iOS lab project targeting iOS 26.0+ using Xcode 26.0.1. The project follows a traditional Storyboard-based architecture with UIKit, not SwiftUI.

## Architecture & Structure

### Core Components
- **Entry Point**: `AppDelegate.swift` - Uses `@main` attribute, manages app lifecycle and scene configuration
- **Scene Management**: `SceneDelegate.swift` - Handles UIWindow setup and scene lifecycle (iOS 13+ multi-window support)
- **Main UI**: `ViewController.swift` - Single view controller connected to `Main.storyboard`
- **UI Layout**: Storyboard-based UI defined in `ios-lab5/Base.lproj/Main.storyboard`

### Project Configuration
- **Bundle ID**: `KBTU.ios-lab5`
- **Swift Version**: 5.0
- **Deployment Target**: iOS 26.0
- **Devices**: Universal (iPhone and iPad)
- **Swift Features**: 
  - Default actor isolation: `MainActor`
  - Approachable concurrency enabled
  - Member import visibility upcoming feature enabled

## File Organization
```
ios-lab5/               # Main source folder
├── AppDelegate.swift
├── SceneDelegate.swift
├── ViewController.swift
├── Info.plist         # Scene configuration, storyboard reference
├── Base.lproj/        # Localized resources
│   ├── Main.storyboard
│   └── LaunchScreen.storyboard
└── Assets.xcassets/   # Image and color assets
```

## Development Workflow

### Building & Running
- Open `ios-lab5.xcodeproj` in Xcode
- Use Xcode's build system (Cmd+B to build, Cmd+R to run)
- Project uses file system synchronized groups (modern Xcode 14+ feature)

### Adding New Features
1. **New View Controllers**: Create Swift file, add `import UIKit`, inherit from `UIViewController`
2. **UI Layout**: Drag elements in `Main.storyboard`, create IBOutlets/IBActions in corresponding VC
3. **Navigation**: If adding multiple screens, embed in UINavigationController via storyboard
4. **Assets**: Add images/colors in `Assets.xcassets`

## Code Conventions

### Swift Style
- File headers include creation date format: `Created by Alisher Mutaliyev on 24.10.2025`
- Use `// MARK:` comments to organize code sections (see `AppDelegate.swift` UISceneSession Lifecycle example)
- Lifecycle methods include Apple's default comments explaining their purpose

### UIKit Patterns
- **Storyboard Connections**: Use `@IBOutlet` for UI elements, `@IBAction` for user interactions
- **Initial ViewController**: Set via `initialViewController` in storyboard (currently `BYZ-38-t0r`)
- **Scene Delegate**: Handle scene state transitions in dedicated lifecycle methods (active/background/foreground)

## Key Technical Details

### Scene-Based Architecture
This project uses iOS 13+ scene-based lifecycle:
- Multiple windows supported via `UISceneSession`
- Scene configuration defined in `Info.plist` under `UIApplicationSceneManifest`
- Scene class: `SceneDelegate`, Storyboard: `Main`

### Build Settings
- Code signing: Automatic
- Info.plist generation: YES (partial - references `ios-lab5/Info.plist`)
- Supported orientations:
  - iPhone: Portrait, Landscape Left, Landscape Right
  - iPad: All orientations

## Common Tasks

### Adding UI Elements
1. Open `Main.storyboard` in Interface Builder
2. Drag UI components from Object Library to view controller
3. Control-drag to `ViewController.swift` to create outlets/actions
4. Configure constraints for Auto Layout

### Testing on Simulator/Device
- Simulator: Select target device from Xcode scheme selector
- Physical device: Connect via USB, ensure proper provisioning profile
- Deployment target is iOS 26.0 - ensure test devices support this version

## Educational Context
This appears to be Lab 5 in an iOS development course at KBTU (Kazakh-British Technical University). Maintain consistency with previous labs in the `ios-dev-25-26` course folder.
