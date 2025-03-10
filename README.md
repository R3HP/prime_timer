# prime_timer

## Which patterns/libraries did you use and why?
✅ Patterns

    Clean Architecture → Separation of concerns between data, domain, and presentation layers.
    although this design is a complete overkill for this project,it was chosen to showcase 
    my understanding of what a clean architecture is supposed to be.

    

✅ Libraries

    SharedPreferences → Local storage for tracking last mined number.
    Dio → used for sending http requests
    get_it → used for dependency injection and a clean setup
    Dart async & Streams → Used for real-time updates and periodic 

## What assumptions did you make that influenced your design?
    Prime Numbers Should Be Stored Persistently
        Assumed users might close and reopen the app, so the app tracks the last prime number even after restarting.
        Led to SharedPreferences usage for storing timestamps.

    App Must Work Even if Persistence Fails
        Assumed that database failures should not break functionality.
        Led to fallback mechanisms: The app continues, but the user is informed of saving errors.

    API Might Return Non-Prime Numbers
        Assumed that not every number from the API is prime, so filtering is done in the repository.

    Elapsed Time Should be Based on Mined Time, Not Fetch Time
        Assumed that the minedAt property of a number is the correct reference point for elapsed time.


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
