# Crypto Exchange UIKit App

## Description

The **Crypto Exchange UIKit App** is an iOS application designed to provide an intuitive user interface for viewing cryptocurrency exchange data. The project utilizes the VIP (View-Interactor-Presenter) architecture and follows clean code principles to ensure maintainability and scalability.

## Requirements

- **Xcode**: Required to build and run the project.
- **iOS 14.0+**: Minimum supported iOS version.

## Running the Project

To run the application, follow these steps:

1. **Clone the Repository:**

    ```bash
    git clone https://github.com/yourusername/crypto_exchange_uikit_app.git
    ```

2. **Open the Project in Xcode:**

    Navigate to the project directory and open the `crypto_exchange_app.xcodeproj` file in Xcode:

    ```bash
    open crypto_exchange_app.xcodeproj
    ```

3. **Build and Run:**

    - Select the desired build target (simulator or real device).
    - Click the **Run** button in Xcode or use the shortcut `Cmd + R` to build and run the application.

## Technologies Used

- **Architecture:**
  - [x] VIP (View-Interactor-Presenter)

- **Keychain:**
  - [x] Secure storage for sensitive data

- **SnapKit:**
  - [x] Auto Layout DSL for easy and readable constraints management

- **Swift Package Manager (SPM):**
  - [x] Dependency management and integration

- **Clean Code:**
  - [x] Adherence to clean code principles for better readability and maintainability

- **API:**
  - [x] [CoinAPI](https://rest.coinapi.io/v1/) - Used to fetch exchange data
