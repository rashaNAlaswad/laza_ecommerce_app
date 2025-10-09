# Laza E-Commerce App

A modern Flutter e-commerce application built with clean architecture and BLoC state management pattern.

## 📱 Features

- **Welcome Screen** - Onboarding experience for new users
- **Authentication**
  - User Login with secure credential storage
  - User Signup with validation
  - Email Verification with OTP/PIN code
- **Home Screen**
  - Product catalog browsing
  - Category filtering

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (^3.9.2)
- Dart SDK
- Android Studio / Xcode (for mobile development)

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd laza_ecommerce_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run code generation:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Run the app:
```bash
flutter run
```

## 🔧 Code Generation

This project uses code generation for models and API clients. After making changes to annotated files, run:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## 🏗️ Architecture

This project follows **Clean Architecture** principles with a feature-first folder structure:

```
lib/
├── core/                    # Core functionality shared across features
│   ├── constants/          # App-wide constants
│   ├── di/                 # Dependency injection setup
│   ├── helper/             # Helper utilities
│   ├── networking/         # API clients and interceptors
│   ├── router/             # Navigation routing
│   ├── theme/              # App theming and styles
│   ├── utils/              # Utility functions
│   └── widgets/            # Reusable widgets
└── features/               # Feature modules
    ├── welcome/
    ├── login/
    ├── signup/
    ├── verify_email/
    └── home/
```

Each feature follows a layered architecture:
- **Data Layer** - Models, repositories, data sources
- **Domain Layer** - Use cases, entities
- **Presentation Layer** - BLoC, screens, widgets



