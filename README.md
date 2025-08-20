# Profile Viewer (iOS)

An iOS demo app that displays profiles in a **grid layout** and allows toggling into a **fullscreen layout** for an immersive profile view.  
Supports smooth transition animations and state preservation when switching back to grid.

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
   ```git clone https://github.com/yourusername/profile-viewer.git -> cd profile-viewer```
Open the project in Xcode:
  ```open ProfileViewer.xcodeproj```


Build & run on iOS Simulator or a real device (iOS 15.0+ recommended).

📸 Screenshots

Grid Layout	
	<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2025-08-20 at 20 34 35" src="https://github.com/user-attachments/assets/9996112d-ef53-4dab-af1b-c0a66156ebf5" />

Fullscreen Layout
  <img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2025-08-20 at 20 34 39" src="https://github.com/user-attachments/assets/1c362f01-7025-45e1-8786-07656970134d" />
  
## 📖 Usage

Launch the app → Profiles appear in grid layout.

Tap a profile → Switches to fullscreen layout.

Swipe horizontally in fullscreen to navigate between profiles.

Tap "Close" (❌) → Returns to grid layout (previous scroll position restored).

Tap ❤️ to like/unlike a profile.

## 🧩 To-Do / Improvements

 Add networking (load profiles from API instead of local).

 Add persistence for liked profiles.

 Add animations for smoother transitions.

 Dark/Light mode support.

## 📄 License

This project is open-sourced under the MIT License.

## 🎥 Animated Demo


https://github.com/user-attachments/assets/6b4a072b-9571-4be5-81a0-676783a97c03




