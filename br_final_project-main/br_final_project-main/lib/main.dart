import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home/home_widget/profile.dart';
import 'providers/theme_provider.dart';
import 'providers/language_provider.dart';
import 'providers/user_provider.dart';
import 'onboarding/splash.dart';
import 'home/home_widget/home.dart';
import 'screens/authentication/login.dart';
import 'screens/authentication/signup.dart';
import 'chat/help_chat.dart';
import 'home/home_widget/video/video_recording.dart';
import 'onboarding/loading_screen.dart';
import 'result/result_screen.dart';
import 'chat/chatbot_screen.dart';
import 'home/home_widget/settings/settings.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/help-chat': (context) => const HelpChatScreen(),
        '/video': (context) => const VideoRecordingScreen(),
        '/loading': (context) => const LoadingScreen(),
        '/result': (context) => const ResultScreen(result: ''),
        '/chatbot': (context) => const ChatbotScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/profile': (context) => const ProfilePage(),
      },
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: Provider.of<ThemeProvider>(context).isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
    );
  }
}