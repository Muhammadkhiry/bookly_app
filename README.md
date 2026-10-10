
<div align="center">

  <img src="https://raw.githubusercontent.com/Muhammadkhiry/bookly_app/main/assets/images/Logo.png" alt="Bookly Logo" width="160" />

  # 📚 Bookly App

  **A modern, scalable Flutter application for browsing, searching, and managing book collections.**

  Built with Clean Architecture, BLoC Pattern, and Offline-First Capabilities.

  [![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
  [![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
  [![State Management](https://img.shields.io/badge/State_Management-BLoC%2FCubit-blueviolet?style=for-the-badge&logo=bloc&logoColor=white)](https://bloclibrary.dev)
  [![Database](https://img.shields.io/badge/Database-Hive-FF6F00?style=for-the-badge&logo=hive&logoColor=white)](https://docs.hivedb.dev)
  [![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)

</div>

---

## 🌟 Overview

**Bookly** is designed to deliver a smooth and responsive experience for book lovers. The project focuses on real-world application architecture, robust error handling, local caching, and pixel-perfect UI implementation.

---

## ✨ Features

- 📖 **Featured & Best Sellers:** Discover trending books with rich metadata and preview options.
- 🔍 **Real-time Search:** Search books instantly by title, author, or category.
- ❤️ **Favorites & Offline Mode:** Save favorite books locally using **Hive** with real-time UI synchronization via `ValueListenableBuilder`.
- 👆 **Swipe to Delete:** Effortless management of favorites with interactive dismissible list items.
- 🎨 **Shimmer Skeletons:** Premium loading indicators preventing layout shifts during data fetches.
- 🔗 **Deep Linking & Navigation:** Clean navigation handling using **GoRouter**.

---

## 🏗️ Architecture & Project Structure

The project strictly adheres to **Clean Architecture** combined with **Feature-First** organization:

```text
lib/
├── core/
│   ├── errors/          # Custom Failure classes & Dio error handlers
│   ├── utils/           # AppRouter, ServiceLocator (GetIt), AppStyles, MockData
│   └── widgets/         # Shared UI components (CustomButton, CustomErrorWidget, LoadingIndicators)
└── features/
    ├── home/            # Featured books, Best seller, and Book Details
    │   ├── data/        # Models, Repositories Implementation, Remote/Local Data Sources
    │   ├── domain/      # Entities, Repositories Contracts, Use Cases
    │   └── presentation/# Cubits, Views, and Feature Widgets
    ├── search/          # Book search feature & filters
    └── splash/          # Splash view with animated transitions

```

---

## 🛠️ Tech Stack & Packages

| Category | Technology / Package | Purpose |
| --- | --- | --- |
| **Framework** | [Flutter](https://flutter.dev) | Cross-platform UI Toolkit |
| **Language** | [Dart](https://dart.dev) | Primary Programming Language |
| **State Management** | [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) | Predictable State & Business Logic |
| **Dependency Injection** | [`get_it`](https://pub.dev/packages/get_it) | Service Locator for Decoupled Components |
| **Routing** | [`go_router`](https://pub.dev/packages/go_router) | Declarative Routing & Argument Passing |
| **Networking** | [`dio`](https://pub.dev/packages/dio) | HTTP Client with Interceptors |
| **Local Storage** | [`hive`](https://pub.dev/packages/hive) & [`hive_flutter`](https://pub.dev/packages/hive_flutter) | Fast, Lightweight Key-Value DB |
| **Functional Programming** | [`dartz`](https://pub.dev/packages/dartz) | Either<Failure, Success> Error Handling |
| **UI Enhancements** | [`shimmer`](https://pub.dev/packages/shimmer), [`google_fonts`](https://pub.dev/packages/google_fonts) | Smooth Loading Skeletons & Typography |

---

## 🚀 Getting Started

### Prerequisites

Ensure you have the following installed on your machine:

* [Flutter SDK](https://docs.flutter.dev/get-started/install) (`>= 3.x`)
* [Dart SDK](https://dart.dev/get-dart) (`>= 3.x`)
* Android Studio / VS Code with Flutter extensions

### Installation

1. **Clone the repository:**
```bash
git clone https://github.com/Muhammadkhiry/bookly_app.git
cd bookly_app

```


2. **Install dependencies:**
```bash
flutter pub get

```


3. **Generate Hive Adapters (if needed):**
```bash
flutter pub run build_runner build --delete-conflicting-outputs

```


4. **Run the app:**
```bash
flutter run

```



---

## 👤 Author

**Muhammad Khairy**

* 🐙 GitHub: [@Muhammadkhiry](https://www.google.com/search?q=https://github.com/Muhammadkhiry)
* 💼 LinkedIn: [Muhammad Khairy](https://www.linkedin.com)

---

⭐ **If you find this project helpful, give it a star!** ⭐

---

