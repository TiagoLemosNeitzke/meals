import 'package:flutter/material.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';
import '/screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primaryColor: Colors.pink,
        hintColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
          ),
        ),
      ),
      // home: CategoriesScreen(), // só utilizar caso eu não tenha rotas nomeadas
      initialRoute: AppRoutes.HOME, // define a rota inicial da aplicação
      routes: {
        AppRoutes.HOME: (ctx) => const TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => const CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (ctx) => const MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => const SettingsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/alguma-coisa') {
          return null;
        } else if (settings.name == '/outra-coisa') {
          return null;
        } else {
          return MaterialPageRoute(
            builder: (_) {
              return const CategoriesScreen();
            },
          );
        }
      }, // se uma rota não for encontrada, o flutter chama essa função
      onUnknownRoute: (settings) {
        //posso usar direto essa função para redirecionar para a tela inicial
        return MaterialPageRoute(
          builder: (_) {
            return const CategoriesScreen();
          },
        );
      }, // se uma rota não for encontrada, o flutter chama essa função
    );
  }
}
