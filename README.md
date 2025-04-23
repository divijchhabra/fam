# Fam Assignment - Contextual Cards App

A Flutter application that displays contextual cards with different designs and interactions. The app fetches card data from an API and presents them in a scrollable list with various card types (HC1, HC3, HC5, HC6, HC9).

## Features

- **Multiple Card Types**: Support for different card designs (HC1, HC3, HC5, HC6, HC9)
- **Interactive Cards**: 
  - HC3 cards with swipe-to-dismiss and remind-later functionality
  - CTA buttons with URL navigation
  - Formatted text support with custom styling
  - Background images and gradients
- **State Management**: Uses BLoC pattern for state management
- **Dependency Injection**: Uses GetIt for dependency management

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- Android Studio / VS Code with Flutter extensions
- Git

## Project Structure

```
lib/
├── core/
│   ├── api/
│   ├── di/
│   ├── network/
│   ├── routes/
│   ├── services/
│   └── utils/
├── features/
│   ├── contextual_cards/
│   │   ├── bloc/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   ├── enums/
│   │   │   ├── mappers/
│   │   │   └── models/
│   │   └── presentation/
│   │       ├── pages/
│   │       └── widgets/
│   └── home/
│       └── presentation/
└── main.dart
```

## Architecture

The app follows a clean architecture approach with:

- **Presentation Layer**: 
  - UI components (Widgets)
  - BLoC for state management
  - Pages for screen layouts
- **Domain Layer**: 
  - Business logic
  - Models and mappers
  - Repository contracts
- **Data Layer**: 
  - Repository implementation
  - Network models
  - API integration

### Key Components

- **BLoC**: Manages state and business logic for contextual cards
- **Repository**: Handles data operations and API calls
- **Models**: 
  - Network models for API response
  - Presentation models for UI
- **Widgets**: Reusable UI components for different card types
- **Dependency Injection**: GetIt for managing dependencies

## Dependencies

- `flutter_bloc`: State management
- `http`: HTTP client for API calls
- `shared_preferences`: Local storage for card states
- `url_launcher`: URL handling for CTA buttons
- `get_it`: Dependency injection
- `json_annotation`: JSON serialization
- `json_serializable`: Code generation for JSON models