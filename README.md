## CPR App
The primary goal of CPR App is to offer a user-friendly and accessible tool for individuals who may need to perform CPR on different age groups (adults, children, and infants). The app is not intended for professional training but rather as a support tool to help users recall essential CPR steps when needed.

### Current Implementations
The app has been developed using Flutter, making it cross-platform (iOS and Android). Key features implemented so far include:

### Home Screen with Navigation

A bottom navigation bar allows users to switch between CPR instructions for different age groups and the settings section.
The app provides three CPR categories:

- **Adult CPR** (for individuals aged 14 and above)
- **Child CPR** (for individuals aged 1 year to puberty)
- **Infant CPR** (for infants from birth to 12 months)

### CPR Instruction Screens

Each category screen clearly displays the selected CPR type.
A button to start CPR is present (action to be implemented in the future).
Below the button, a short description explains the age range covered by the selected category, with key terms highlighted in bold.

### Future Enhancements (Planned)

- Emergency audio guidance to assist users during the CPR process.
- Customization options for adjusting text size, brightness, and audio settings.
- Multi-language support to make the app accessible to a broader audience.
- Step-by-step CPR instructions with animations or images to guide users visually.


### Technical Aspects

**Framework**: Flutter (Dart)
**Dependencies Used**:
url_launcher (to open external links)
flutter_lints (for code quality checks)
**Asset Management**: The app includes a custom YAML configuration to handle assets like images (CRI logo, which is protected by copyright).



-------------------------------------------------------------------------------------------
## Getting Started with Flutter

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
