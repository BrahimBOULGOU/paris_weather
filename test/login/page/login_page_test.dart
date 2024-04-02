import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:paris_weather/login/bloc/login_cubit.dart';
import 'package:paris_weather/login/page/login_page.dart';
import 'package:paris_weather/login/widgets/login_button.dart';


@GenerateNiceMocks([MockSpec<LoginCubit>()])
void main() {
  testWidgets('Should render login page', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    expect(find.byType(LoginButton), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
  });
}
