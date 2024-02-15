# A

This is a Flutter app that allows users to search and view volunteer opportunities and non-governmental organizations (NGOs).

## Features


- View details of each opportunity
- View details of NGOs
- Navigate between Home and NGO pages

## Project Structure

The project follows the Clean Architecture principles and uses the Bloc pattern for state management.

### Domain Layer

The domain layer is responsible for defining the business logic of the application. It contains the following:

- Entities: These are the data objects of the application.
- Use Cases: These are the business rules of the application.

### Data Layer

The data layer is responsible for fetching and storing data. It contains the following:

- Models: These are data objects used for communication with the data sources.
- Repositories: These are the classes that fetch and store data.
- Data Sources: These are the classes that interact with external data sources like APIs.

### Presentation Layer

The presentation layer is responsible for displaying the data to the user and handling user interactions. It contains the following:

- Pages: These are the screens of the application.
- Blocs: These are the classes that manage the state of the application.

## Getting Started

To run this project, you will need to have Flutter and Dart installed on your machine.

1. Clone this repository.
2. Navigate to the project directory.
3. Run `flutter pub get` to install the dependencies.
4. Run `flutter run` to start the app.

