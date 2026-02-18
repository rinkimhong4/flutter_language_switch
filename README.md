# Universal Multilingual App

A Flutter application demonstrating comprehensive internationalization (i18n) support with 6 supported languages and a beautiful, responsive UI.

## Project Overview

This app is designed to showcase Flutter's internationalization capabilities with a clean, modern interface. It features:

- **Multilingual Support**: 6 languages (English, Khmer, French, Chinese, Arabic, Spanish)
- **Responsive Design**: Works on both mobile and tablet devices
- **State Management**: Provider for language switching
- **Local Storage**: SharedPreferences to remember user's language preference
- **Beautiful UI**: Modern Material Design with gradient effects and smooth animations

## Features

### 1. Home Screen
- Greeting message in the selected language
- Welcome section with app description
- Current language display (name and code)
- Settings button to switch language

### 2. Settings Screen
- Language selection interface with radio buttons
- Real-time preview of selected language
- Persistent language preference

### 3. Localization System
- Generated from ARB files using Flutter's `gen-l10n` tool
- 16 translation keys for complete UI coverage
- Support for RTL languages (Arabic)
- Khmer font support

## Technology Stack

- **Flutter**: UI framework
- **Provider**: State management
- **shared_preferences**: Local storage
- **flutter_localizations**: Built-in localization support
- **intl**: Internationalization package

## Project Structure

```
lib/
├── language/
│   ├── core/
│   │   └── localization/
│   │       ├── app_localizations.dart      # Generated base class
│   │       ├── app_localizations_*.dart   # Language-specific classes
│   │       ├── language_controller.dart   # Language state management
│   │       └── supported_locales.dart     # Supported languages list
│   ├── l10n/
│   │   └── app_*.arb                      # ARB translation files
│   └── ui/
│       ├── home_screen.dart              # Main home page
│       └── settings_screen.dart          # Language settings
├── main.dart                             # Entry point
└── app.dart                              # App widget
```

## Supported Languages

| Language | Code | File |
|----------|------|------|
| English | en | app_en.arb |
| Khmer (Cambodian) | km | app_km.arb |
| French | fr | app_fr.arb |
| Chinese (Simplified) | zh | app_zh.arb |
| Arabic | ar | app_ar.arb |
| Spanish | es | app_es.arb |

## Getting Started

### Prerequisites
- Flutter SDK installed
- Dart SDK 3.10.7 or higher
- iOS simulator or Android emulator (or physical device)

### Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

### Adding New Languages

To add a new language:

1. Create a new ARB file in `lib/language/l10n/`:
   ```
   app_{languageCode}.arb
   ```

2. Add translations for all 16 keys (see `app_en.arb` as template)

3. Update `supported_locales.dart` to include the new language:
   ```dart
   const supportedLocales = [
     // Existing languages
     Locale('{languageCode}'), // Language name
   ];

   const localeNames = {
     // Existing names
     '{languageCode}': 'Language Name',
   };
   ```

4. Regenerate localization files:
   ```bash
   flutter gen-l10n
   ```

## Localization Configuration

The localization system is configured in `l10n.yaml`:
```yaml
arb-dir: lib/language/l10n
output-dir: lib/language/core/localization
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
```

## Key Translation Keys

All supported UI strings are defined in the ARB files with these keys:
- `app_title`: Application title
- `hello`: Greeting message
- `welcome`: Welcome text
- `description`: App description
- `settings`: Settings page title
- `language`: Language label
- `about`: About page (future)
- `login`, `logout`, `profile`: Authentication
- `save`, `cancel`, `search`: Common actions
- `error`, `success`, `loading`: Status messages

## UI Components

### Home Screen
Located in `home_screen.dart`, this is the main entry point featuring:
- Gradient container for greeting
- Card with welcome message
- Current language information
- Settings button with icon

### Settings Screen
Located in `settings_screen.dart`, this page provides:
- Language selection via radio buttons
- Real-time language preview
- Clean, modern design with container borders and spacing

## State Management

Language state is managed using Provider and the `LanguageController` class:

```dart
class LanguageController extends ChangeNotifier {
  Locale _locale = const Locale('en');
  
  Locale get locale => _locale;
  
  Future<void> changeLanguage(Locale locale) async {
    _locale = locale;
    notifyListeners();
    // Save to shared preferences
  }
}
```

## Storage

The app uses shared_preferences to persist language preferences:
```dart
static const String _localeKey = 'selected_language';
final prefs = await SharedPreferences.getInstance();
await prefs.setString(_localeKey, locale.languageCode);
```

## Future Enhancements

- Add more languages (e.g., German, Japanese)
- Implement RTL layout support for Arabic
- Add about page
- Implement dark mode
- Add more UI components (forms, lists)

## License

MIT License - feel free to use this project as a template for your own Flutter applications!

## Contributing

Contributions are welcome! Feel free to submit PRs with new features, bug fixes, or additional languages.

