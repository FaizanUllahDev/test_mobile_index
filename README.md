# Test Mobile Index

A new Flutter project for creating a mobile job application platform.

## Description

This project is a Flutter-based mobile application that serves as a job board. It allows users to browse job listings, create profiles, and apply for jobs with a single click. The application is designed with a clean and user-friendly interface to provide a seamless job search experience.

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- An editor like [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/) with the Flutter plugin.

### Installation

1.  Clone the repo
    ```sh
    git clone https://github.com/your_username/test_mobile_index.git
    ```
2.  Navigate to the project directory
    ```sh
    cd test_mobile_index
    ```
3.  Install dependencies
    ```sh
    flutter pub get
    ```
4.  Run the app
    ```sh
    flutter run
    ```

## Project Structure

The project follows a standard Flutter project structure, with the main application code located in the `lib` directory. Key directories include:

-   `lib/core`: Core utilities, constants, and theme definitions.
-   `lib/features`: Feature-based modules, such as authentication and job listings.
-   `lib/main.dart`: The entry point of the application.
-   `assets`: Contains static assets like images, icons, and fonts.
-   `test`: Includes unit and widget tests.

## Key Dependencies

This project utilizes several key packages to enhance its functionality:

-   **[flutter_bloc](https://pub.dev/packages/flutter_bloc)**: For state management, implementing the BLoC (Business Logic Component) pattern.
-   **[go_router](https://pub.dev/packages/go_router)**: A declarative routing package for Flutter that simplifies navigation.
-   **[flutter_svg](https://pub.dev/packages/flutter_svg)**: For rendering SVG files, providing scalable and high-quality icons and illustrations.
-   **[google_fonts](https://pub.dev/packages/google_fonts)**: To easily use and customize fonts from the Google Fonts library.
-   **[equatable](https://pub.dev/packages/equatable)**: To simplify equality comparisons in Dart objects.

## Usage

Once the application is running, you can navigate through the different screens to explore its features. The landing page provides an overview of the job application process, and you can proceed to register or log in to access the full functionality.

## Testing

To run the tests for this project, use the following command:

```sh
flutter test
```

## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.
