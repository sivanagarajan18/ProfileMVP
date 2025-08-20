# Profile Viewer (iOS)

An iOS demo app that displays profiles in a **grid layout** and allows toggling into a **fullscreen layout** for an immersive profile view.  
Supports smooth transition animations, orientation handling (portrait/landscape), and state preservation when switching back to grid.

---

## ✨ Features

- 📱 **Two Layouts**  
  - Grid layout (two-column card-style profiles).  
  - Fullscreen layout (horizontal paging between profiles).  

- 🔄 **Smooth Toggle**  
  - Tap on a profile to switch to fullscreen.  
  - Close button in fullscreen returns to grid view.  
  - Preserves scroll position when switching back.  

- ❤️ **Profile Interactions**  
  - Like/unlike profiles.  
  - Show messages using alerts.  

- 🎛 **Adaptive Layout**  
  - Works in both portrait & landscape orientations.  
  - Uses Auto Layout constraints for flexible positioning.  

---

## 🛠 Tech Stack

- **Language:** Swift 5+
- **Frameworks:** UIKit, Auto Layout
- **Architecture:** MVP (Model–View–Presenter) pattern
- **UI:** `UICollectionView` with custom cells
- **Storyboard + Programmatic Constraints** for flexibility

---

## 📂 Project Structure

├── Models/
│ └── Profile.swift
├── Views/
│ ├── ProfileCollectionViewCell.xib
│ └── ProfileCollectionViewCell.swift
├── Presenters/
│ └── ProfilePresenter.swift
├── Controllers/
│ └── ProfileViewController.swift
├── Resources/
│ └── Assets.xcassets
│ └── Main.storyboard
└── README.md


---

## 🚀 Getting Started

1. Clone the repo:
   ```bash
   git clone https://github.com/yourusername/profile-viewer.git
   cd profile-viewer
    ```
    
    
2. Open the project in Xcode.
        open ProfileViewer.xcodeproj
        
3. Build & run on iOS Simulator or a real device (iOS 15.0+ recommended).

## 📸 Screenshots
| Grid Layout            | Fullscreen Layout                  |
| ---------------------- | ---------------------------------- |
| /Users/sivanagarajan/Desktop/Simulator Screenshot - iPhone 16 Pro - 2025-08-20 at 20.34.35.png | /Users/sivanagarajan/Desktop/Simulator Screenshot - iPhone 16 Pro - 2025-08-20 at 20.34.39.png |

📖 Usage

Launch the app → Profiles appear in grid layout.

Tap a profile → Switches to fullscreen layout.

Swipe horizontally in fullscreen to navigate between profiles.

Tap "Close" (❌) → Returns to grid layout (previous scroll position restored).

Tap ❤️ to like/unlike a profile.

🧩 To-Do / Improvements

 Add networking (load profiles from API instead of local).

 Add persistence for liked profiles.

 Add animations for smoother transitions.

 Dark/Light mode support.

📄 License

This project is open-sourced under the MIT License.


---

Would you like me to also add a **short animated GIF demo section** (showing grid → fullscreen → back), so it looks more professional for GitHub?
## 🎥 Animated Demo

/Users/sivanagarajan/Desktop/Simulator Screen Recording - iPhone 16 Pro - 2025-08-20 at 20.17.13.mp4
