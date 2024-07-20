# flutter_challenge

Flutter Article List Application

Overview:

The Expense Tracker App allows users to manage their expenses efficiently. It provides functionality for adding, viewing, editing, and deleting expenses. Additionally, it offers summaries categorized by type and supports reminder notifications to help users record their daily expenses. The app uses Hive for local storage and Bloc for state management.


Features:

> Clean and modern UI for listing expenses and displaying other details.

> Uses `hive_flutter` for local storage and other database operations.

> Uses `flutter_bloc` for state management.

> Uses `auto_route` for navigation.

> Integrates local notifications using `flutter_local_notifications` and `timezone`.

> Modular project structure following the Single Responsibility Principle.


Getting Started
Prerequisites:

Flutter SDK: Install Flutter
Dart SDK: Included with Flutter

Installation

Clone the repository:
git clone https://github.com/MUHAMMEDHISHAMCP/flutter_challenge.git

cd expense_tracker_app


Install dependencies:
flutter pub get

Run the app:
flutter run

Project Structure:

> lib/application: State management, listeners, and data loading.

> lib/core: Helper code, error handling, constants, extensions, validation rules for forms.

> lib/data: Data models, Datasources, and network code.

> lib/data/model: Data model mappings with auto-generation tags.

> lib/data/datasources: Local database services and API services.

> lib/presentation: All UI components, including screens, views, and modals.

> lib/repository: Requesting and processing data from the data sources.

> lib/resources: Styles, themes, and flavors.

> lib/routes: App routing code and auto-generated code.

> lib/main.dart: Application entry point.


dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  intl: ^0.19.0
  flutter_bloc: ^8.1.6
  hive_flutter: ^1.1.0
  gap: ^3.0.1
  equatable: ^2.0.5
  get_it: ^7.7.0
  syncfusion_flutter_charts: ^26.1.42
  flutter_local_notifications: ^17.2.1+2
  rxdart: ^0.28.0
  timezone: ^0.9.4
  shared_preferences: ^2.2.3
  auto_route: ^8.3.0
  auto_route_generator: ^8.1.0


dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
  hive_generator: ^2.0.0
  build_runner: ^2.0.0


Additional Features:

Page Transition and Animation
Smooth page transitions and animations to enhance user experience



Design:

The user interface of the Expense Tracker App is designed to be intuitive and user-friendly


Workflow:

> `Add Transaction` : Users can add a transaction using the 'Add' button on the home screen.

> `Update or Delete` : Users can view all added expenses on the home screen. Pressing an expense tile navigates to the update screen. Users can delete an expense by swiping the item to the left or right.

> `Summary` : At the top of the home screen, there is a card showing the total expense and a button for viewing the summary.

> `Notification` : In the app settings screen, there is an option to schedule notifications.



Submission:

The complete source code is available in this public GitHub repository. Follow the instructions in this README to set up and run the project. The project is well-structured and follows best practices in Flutter development.
