import 'package:flutter_joke_app/core/dependencies/dependencyConfigurator.dart';
import 'package:flutter_joke_app/main.dart';
import 'package:flutter_joke_app/ui/widgets/loader_button_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart';

void main() {

  setUpAll(() {
      configureDependencies(Environment.test);
  });
  
  testWidgets('Should display Joke', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    final String mockJokeContent = "Someone stole my mood ring. I don't know how I feel about it.";

    // Verify that the joke isn't showing on the UI
    expect(find.text(mockJokeContent), findsNothing);

    // tap the "Get a joke" button
    await tester.tap(find.byType(LoaderButtonWidget));
    await tester.pump();
    // verify that the joke has been found
    expect(find.text(mockJokeContent), findsOneWidget);
  });
}