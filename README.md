# Technical Assignment for Senior Flutter Developer : Magic Kart

## Project Overview

This project involves the development of a simple mobile application using Flutter, which allows users to browse a list of products, view product details, and mark products as favorites. The app is designed to be responsive, functioning on both Android and iOS platforms, and integrates with a mock API to fetch product data.

## Features & Functionality

### 1. Product List Screen

- **API Integration:**
  - Fetches products from a mock API.
  - Displays products in a list format, showing the product image, name, price & ratings.
  - Implements a search bar to filter products by name.
  - Supports infinite scrolling, loading more products as the user scrolls down.

### 2. Product Details Screen

- **Product Information:**
  - Navigates to the Product Details screen when a product is tapped.
  - Displays the product's image, name, price, and description.
  - Includes a button to mark or unmark the product as a favorite.

## Technical Requirements

### 1. API Integration

- Uses a mock API service ([ Fake Store API ](https://fakestoreapi.com/docs)).
- Handles API errors gracefully, with appropriate error messages.

### 2. State Management

- Use GetX to manage app state efficiently across screens.
- Preserves user actions, such as marking favorites, even after a page reload.

### 3. App Responsiveness

- Ensures the app is responsive across different sizes of mobile.

### 4. Bonus

- Implement to Flutter best practices, including null safety, effective widget use, and separation of concerns.
- Implements a clean architecture using MVC.

## Project Structure

```
lib
|-- app.dart                  # Implement project's foundation
├── main.dart                 # Entry point of the application
├── data/
|   |-- repository/           # API integration and data fetching logic
|   |-- services/             # Structures for different services. i.e API, Notification
├── utils/                    # Different types of utility functions
├── feature/                  # UI components for the app screens
    |-- home/
        ├── controllers/      # Product list screen controllers
        └── models/           # Product list screen models
        └── views/            # Product list screen UI
    |-- product/
        ├── controllers/      # Product detail screen controllers
        └── models/           # Product detail screen models
        └── views/            # Product detail screen UI
```

## Setup Instructions

### 1. Clone the Repository

- git clone https://github.com/s0urav-hald3r/Magic-Kart.git

### 2. Install Dependencies

- flutter pub get

### 3. Run the App

- flutter run

## Conclusion

This project demonstrates a simple yet efficient implementation of a mobile app using Flutter, following best practices and clean architecture principles. It includes features such as API integration, state management, and responsiveness, making it a strong foundation for further development and scaling.
