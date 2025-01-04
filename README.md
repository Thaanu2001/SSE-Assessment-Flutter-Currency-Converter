# Currency Converter Application

## Overview
This is a Flutter-based Currency Converter application that enables users to convert currencies using live exchange rates. The app supports multiple target currencies, local persistence of preferences, and a user-friendly interface.

## Features
- **Real-time Currency Conversion:** Fetches live exchange rates via an integrated API.
- **Multi-currency Support:** Allows users to add multiple target currencies for conversion.
- **User Preferences:** Saves preferred target currencies locally using SharedPreferences.
- **Delete Functionality:** Users can remove unwanted target currencies.
- **State Management:** Utilizes the GetX package for effective state management.
- **Responsive UI:** Implements a user-friendly and intuitive interface.

## Architecture
This application is built using the **MVC (Model-View-Controller)** architecture pattern to ensure code modularity, readability, and maintainability. 

### Key Components:
1. **Model:**
   - Handles data operations and API calls for fetching exchange rates.
2. **View:**
   - Displays UI elements, capturing user input and showing results.
3. **Controller:**
   - Manages communication between the Model and View, ensuring separation of concerns.

### State Management:
- **GetX:** Used for efficient state management, navigation, and reactive programming.

### Local Persistence:
- **SharedPreferences:** Used to store and retrieve user preferences for target currencies.

## Installation

### Prerequisites:
- Flutter SDK installed ([Download Flutter](https://flutter.dev/docs/get-started/install)).
- An active currency converter API key from [exchangerate-api.com](https://www.exchangerate-api.com).

### Steps:
1. Clone the repository:
   ```bash
   git clone https://github.com/Thaanu2001/SSE-Assessment-Flutter-Currency-Converter.git
   cd SSE-Assessment-Flutter-Currency-Converter
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Add your API key:
   - Open the `lib/constants/api_constants.dart` file.
   - Replace `API_KEY` with your currency API key.
4. Run the application:
   ```bash
   flutter run
   ```

## Usage
1. Enter the amount in the provided text field.
2. Select the input currency from the dropdown menu.
3. Add target currencies by selecting from the list.
4. View converted amounts in the target currencies.
5. Delete any target currency by swiping left.

## Dependencies
- **Flutter SDK**
- **GetX:** For state management and navigation.
- **SharedPreferences:** For local data persistence.
- **HTTP:** For API calls.

## API Integration
This app integrates with a currency converter API to fetch real-time exchange rates. The API is called asynchronously, ensuring efficient network usage and a smooth user experience.

## Evaluation Highlights
- **API Calls:** Efficient implementation with error handling for network failures.
- **Architecture:** MVC pattern ensures modularity and clean separation of concerns.
- **UI/UX:** User-friendly and responsive design.
- **State Management:** Simplified with GetX for scalability.
- **Persistence:** Ensures user preferences are retained across sessions.
