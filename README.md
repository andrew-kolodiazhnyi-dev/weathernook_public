# Weathernook

**App Store:**  https://apps.apple.com/app/id6738587410
**Play Store:**  https://play.google.com/store/apps/details?id=dev.theengineer.weathernook

A minimalist weather application designed with simplicity and efficiency in mind.

## Technologies and Libraries Used:

- **Clean Architecture**:  
  I adopted a clean architecture approach, as it provides a structured and maintainable codebase, especially for medium-sized apps like this one. This architecture ensures separation of concerns, making it easier to scale and maintain the application.

- **Bloc/Cubit**:  
  For state management, I used the Bloc and Cubit pattern to handle business logic and state changes. This approach helps maintain a clear separation between UI and logic, making the app more testable and modular.

- **Auto_route**:  
  This library is used for routing and navigation, offering a simple and efficient way to manage app navigation with type-safety and easy URL handling.

- **Dio and Retrofit**:  
  I implemented Dio for making network requests and Retrofit for type-safe API calls. This combination streamlines communication with backend services and ensures error-free parsing of responses.

- **Get_it and Injectable**:  
  These libraries are used for dependency injection, helping to manage the app's dependencies cleanly and efficiently. Get_it serves as the locator, and Injectable automates code generation for dependency management.

- **Slang**:  
  For localization, I incorporated Slang, a simple but powerful solution for handling different languages and regions, making the app more accessible to a global audience.

- **Sentry**:  
  Integrated for real-time bug reporting and crash tracking, Sentry helps monitor app stability and provides actionable insights to resolve issues quickly.

- **Firebase Remote Config**:  
  I used Firebase Remote Config to manage app settings and trigger updates. This feature allows me to force or nudge app updates, ensuring users are always on the latest version.

- **Envied**:  
  This tool obfuscates environment variables to enhance security by preventing sensitive data (such as API keys) from being exposed in the codebase.

- **Flutter Form Builder**:  
  This library simplifies the creation of complex forms, ensuring a smooth and error-free experience for users interacting with forms in the app.

- **Hive**:  
  For data storage, I utilized Hive, a lightweight and fast NoSQL database solution, ensuring fast local data persistence for the app.

- **flutter_native_splash**:  
  A native splash screen is implemented for both Android and iOS, providing a seamless experience when launching the app.

- **flutter_launcher_icons**:  
  This tool generates the required app icons for both Android and iOS, simplifying the setup and ensuring the app’s branding is consistent across platforms.

- **Abstract Theming Support**:  
  The app supports dynamic theming, allowing users to switch between different themes (e.g., light, dark) based on their preferences or system settings.

## Development Approach:

Throughout the development of Weathernook, I focused on incorporating best practices and adhering to industry standards. I aimed to deliver clean, maintainable, and scalable code while keeping performance in mind. This approach ensures that the app can evolve and grow over time while providing users with a smooth and enjoyable experience.
