# Asiel - Modern E-Commerce Mobile App

A sophisticated Flutter-based e-commerce mobile application that provides a seamless shopping experience with a beautiful and modern user interface.

## Features

- 🛍️ **Complete E-commerce Flow**
  - User authentication (Login/Registration)
  - Product browsing and searching
  - Product categories and filtering
  - Shopping cart management
  - Order processing
  - Shipping address management
  
- 🎨 **Modern UI/UX**
  - Clean and intuitive interface
  - Smooth animations and transitions
  - Responsive design
  - Custom app bar and navigation
  
- 🔐 **Security Features**
  - Secure authentication
  - Password recovery
  - Email verification
  - Profile management

## Detailed Features

### 🛍️ Shopping Experience
- Advanced product filtering and search functionality
- Product color and size selection
- Price range filters
- Product ratings and reviews system
- Detailed product descriptions
- Stock tracking
- Wishlist management

### 💳 Payment and Checkout
- Multiple payment methods support
- Coupon code system
- Order summary
- Multiple shipping methods
- Address management

### 👤 User Features
- Profile management
- Order history tracking
- Review and rating submission
- Saved addresses
- Favorite products list

### 🎯 Special Features
- Custom search field with advanced filtering
- Real-time stock updates
- Product recommendations
- Rating analytics with percentage breakdown
- Multi-language support (using GetX translations)

## Tech Stack

- Flutter SDK (>=3.0.5)
- GetX for state management
- Material Design components
- RESTful API integration

## Key Dependencies

- `get: ^4.6.5` - State management and routing
- `flutter_svg: ^2.0.4` - SVG rendering
- `carousel_slider: ^5.0.0` - Image sliders
- `shared_preferences: ^2.0.13` - Local storage
- `pin_code_fields: ^8.0.1` - OTP/PIN input fields
- `flutter_rating_bar: ^4.0.1` - Rating functionality
- `badges: ^3.1.2` - Badge notifications

## UI Components

The app includes several reusable custom components:
- Custom app bars
- Animated search fields
- Rating widgets
- Product cards
- Custom dropdowns
- Bottom sheets for various actions
- Loading indicators
- Custom text fields with phone number support

## Screens

### Main Screens
- Splash Screen
- Onboarding
- Home Screen
- Product List
- Product Details
- Shopping Cart
- Checkout
- Profile

### Authentication Screens
- Login
- Registration
- Password Recovery
- Email Verification

### Shopping Screens
- Product Categories
- Men's Fashion
- Search Results
- Wishlist
- Reviews
- Order History

## Project Structure

```
lib/
├── config/         # App configuration and routes
├── domain/         # Business logic and controllers
├── presentation/   # UI components and screens
└── main.dart       # Entry point
```

## Development Guidelines

### State Management
- Using GetX for state management and routing
- Organized controller structure for each feature
- Reactive state updates

### Styling
- Consistent color scheme defined in `MyColor`
- Reusable text styles
- Responsive layouts using MediaQuery
- Custom themes for light/dark mode

### Best Practices
- Modular widget architecture
- Separation of concerns (UI, Logic, Data)
- Reusable components
- Efficient asset management

## Getting Started

1. **Prerequisites**
   - Flutter SDK (>=3.0.5)
   - Dart SDK
   - Android Studio / VS Code

2. **Installation**
   ```bash
   git clone https://github.com/yourusername/Asiel.git
   cd Asiel
   flutter pub get
   ```

3. **Running the App**
   ```bash
   flutter run
   ```

## Assets

The project includes various asset categories:
- App logos
- Flag icons
- Menu icons
- Onboarding images
- Banner images
- Product images (categorized by type)
- Navigation bar icons
- Category icons

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is proprietary and confidential. All rights reserved.