import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:mobile_farm/main.dart';
import 'package:mobile_farm/services/auth_service.dart';
import 'package:mobile_farm/services/cart_service.dart';
import 'package:mobile_farm/services/order_service.dart';
import 'package:mobile_farm/services/product_service.dart';

void main() {
  testWidgets('app loads the home screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProductService()),
          ChangeNotifierProvider(create: (_) => AuthService()),
          ChangeNotifierProvider(create: (_) => OrderService()),
          ChangeNotifierProvider(create: (_) => CartService()),
        ],
        child: const MyApp(),
      ),
    );

    expect(find.text('Tulime'), findsOneWidget);
    expect(find.text('Fresh From The Farm'), findsOneWidget);
  });
}
