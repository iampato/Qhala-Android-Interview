# qhala

This is the flutter version of the Qhala android technical interview challenge :stuck_out_tongue_winking_eye: That I saw somewhere.

## Flutter deps

- Navigation - New Flutter 2.0 Navigation
- [Dio](https://pub.dev/packages/dio) - Request/response API
- [Flutter_moor](https://moor.simonbinder.eu/) - To save data if in offline mode.
- [CachedNetworkImage](https://pub.dev/packages/cached_network_image) - For image Loading
- [Flutter_cubit](https://pub.dev/packages/flutter_bloc) - For state management (UI updates with data changes && bind UI components in layouts to data sources.)

## Test
1. UI Tests 
2. Repositories Test - using [mockito](https://pub.dev/packages/mockito)
3. Cubit Tests - using [bloc_test](https://pub.dev/packages/bloc_test)


## Todo
1. ~Setup project file structure~
2. ~Implement the UI mock up~
3. ~Add the HTTP layer~
4. ~Responsive design for flutter web~
5. ~Offline storage with Flutter_moor~
6. Add Tests
7. Setup CI/CD


## Design wireframe
<img src="readme/design.jpg" alt="Movie design" height="500" />

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
