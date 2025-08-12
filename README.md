# 🎬 Cinema App

A Flutter application for browsing movie information using the **MVVM** architecture, local database **sqflite**, and integration with **Kinopoisk API**.

![Flutter](https://img.shields.io/badge/Flutter-Framework-blue)
![Dart](https://img.shields.io/badge/Dart-Language-blue)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 📌 Features
- 🔍 **Movie search** with search history
- ❤️ **Favorite movies** stored locally in SQLite
- 🎞 **Movie categories**: Popular, Top Rated, Now Playing, Upcoming
- 📱 **Responsive UI** for different screen sizes
- 🚀 **MVVM architecture** for clean code separation
- 📡 Data fetching from **Kinopoisk API**

---

## 🛠 Tech Stack
- **Flutter** — UI framework
- **Provider** — state management
- **sqflite** — local storage for favorites & search history
- **http** — API requests
- **MVVM** — separation of concerns

---

## 📂 Project Structure
lib/
├── models/ # Data models (MovieModel, etc.)
├── services/ # API & local DB services (MovieApiService, LocalDbService)
├── repositories/ # Repositories (FavoritesRepository, SearchRepository)
├── view_models/ # ViewModels for business logic
├── views/ # UI screens & widgets
└── utils/ # Constants, colors, helpers
