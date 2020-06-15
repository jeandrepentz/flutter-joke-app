# flutter-joke-app
A simple Flutter Demo app that integrates with a public joke API. This app is just for demo purposes.

When adding a new dependncy, the following command needs to be run flutter pub run build_runner watch --delete-conflicting-outputs to re-generate the dependencyConfigurator.iconfig.dart file


Here are a few things that can be the next step to improve the application (without any new features).
- Move the communication with the API to its own class.
- Update the joke repository with the new class.
- Add caching to the joke repository (probably sqlite)
- Add a user settings repository
- Move the "NSFW" setting to a settings page, that communicates with the settings repository
- Define the Provider consumers to more specific widgets, so less gets redrawn.
- Add error handling, invalid response from API, no connection to the API etc.
- Add more unit testing
