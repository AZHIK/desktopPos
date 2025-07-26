# PharmaVault

A Flutter project for a pharmacy management system.

## Getting Started

This project is a starting point for a Flutter application.


### Prerequisites

- Flutter SDK
- Dart SDK

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/your_username_/PharmaVault.git
   ```
2. Install packages
   ```sh
   flutter pub get
   ```
3. Run the app
   ```sh
   flutter run
   ```

## Project Structure

The project is structured as follows:

```
lib/
├── app.dart
├── bootstrap.dart
├── main.dart
├── app/
├── core/
│   ├── constants/
│   ├── device/
│   ├── formatters/
│   ├── responsive/
│   ├── styles/
│   ├── theme/
│   ├── utils/
│   └── validators/
├── data/
│   ├── local/
│   ├── remote/
│   └── repositories/
├── domain/
│   ├── models/
│   └── services/
├── features/
│   ├── auth/
│   ├── cart/
│   ├── checkout/
│   ├── home/
│   ├── orders/
│   ├── products/
│   └── sync/
├── providers/
│   ├── auth_provider.dart
│   ├── cart_provider.dart
│   ├── connectivity_provider.dart
│   ├── database_provider.dart
│   ├── order_provider.dart
│   ├── product_provider.dart
│   ├── sync_provider.dart
│   └── users_dao_provider.dart
├── router/
│   ├── app_router.dart
│   └── routes.dart
└── widgets/
    ├── app_button.dart
    ├── app_circular_image.dart
    ├── app_dialogs.dart
    ├── app_loader.dart
    ├── app_rouded_image.dart
    ├── appbar.dart
    ├── drawer.dart
    ├── form_fields.dart
    ├── containers/
    ├── loaders/
    ├── shimmers/
    ├── sidebar/
    └── texts/
```

## Features

- User authentication
- Product management
- Cart and checkout
- Order management
- Offline support with data synchronization

## Technologies Used

- **State Management:** [flutter_riverpod](https://riverpod.dev/)
- **Routing:** [go_router](https://pub.dev/packages/go_router)
- **Local Storage:** [Drift](https://drift.simonbinder.eu/)
- **Networking:** [Dio](https://pub.dev/packages/dio)
- **Secure Storage:** [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage)
- **UI:**
    - [Iconsax](https://pub.dev/packages/iconsax)
    - [Shimmer](https://pub.dev/packages/shimmer)
    - [Cached Network Image](https://pub.dev/packages/cached_network_image)
    - [Lottie](https://pub.dev/packages/lottie)
- **Testing:**
    - [Flutter Lints](https://pub.dev/packages/flutter_lints)

## How to Run Tests

To run the tests, use the following command:

```sh
flutter test
```