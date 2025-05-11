# Flutter Article App

A beautifully designed Flutter mobile app that fetches and displays articles from the JSONPlaceholder API. Features include a responsive UI, search functionality, article details, and a favorites system with local persistence.

## Features

- **Article List**: Displays articles in a card-based `ListView` with title and body preview, enhanced with shadows and animations.
- **Search Functionality**: Client-side search to filter articles by title or body using a sleek, modern search bar with clear button.
- **Detail View**: Shows full article content (title and body) with a hero-animated title and favorite toggle.
- **Favorites**: Users can mark articles as favorites, persisted via `shared_preferences`, with a dedicated favorites tab.
- **Responsive UI**: Modern design with Google Fonts (Roboto), a cohesive color scheme, fade-in animations, and smooth transitions.
- **Pull-to-Refresh**: Refreshes the article list with a custom-colored indicator.
- **Error Handling**: Gracefully handles API errors with clear, user-friendly messages.

## Setup Instructions

Clone the Repository:
git clone https://github.com/amarjeetpatidar007/flutter-post-assignment.git
cd flutter-post-assignment

Install Dependencies:
flutter pub get

Run the App:
flutter run

## Tech Stack
- Flutter SDK: 3.x
- State Management: Provider
- HTTP Client: http
- Persistence: shared_preferences
- Typography: google_fonts

## State Management Explanation
The app uses Provider for state management due to its lightweight and efficient approach, ideal for managing article data and UI updates. The ArticleProvider handles fetching articles, filtering search results, and managing favorite states, using ChangeNotifier to update the UI via Consumer widgets. Data flows seamlessly from the API to the provider, ensuring responsive and reactive UI updates.

## Known Issues / Limitations
- Search Performance: Client-side search may lag with extremely large datasets; server-side filtering could improve scalability.
- No Offline Mode: Articles require an internet connection as they are not cached locally.
- Static API Data: The JSONPlaceholder API provides mock data, limiting real-world content variety.
- No Pagination: All articles load at once, which could be optimized with lazy loading for larger datasets.

## Screenshots
- Home Screen: Displays the article list with search bar and tabbed navigation.
- Article Detail: Shows full article content with a favorite button.
- Favorites Tab: Lists user-marked favorite articles.

<img src="https://github.com/user-attachments/assets/7b13a440-115a-4efe-8e30-9ef60c76a747" alt="Home Screen" width="300"/>
<img src="https://github.com/user-attachments/assets/db8cb26b-6334-4f28-bed2-6d74a4d95bfc" alt="Article Detail" width="300"/>
<img src="https://github.com/user-attachments/assets/4cd26d2c-16ac-48d3-97b8-f53f3d39e802" alt="Favorites Tab" width="300"/>
