import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'profile.dart';
import 'video/video_recording.dart';
import '/providers/theme_provider.dart';
import 'chat/chatbot_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    const VideoScreen(),
    const MainHomeScreen(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: 32,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blue.withOpacity(0.5),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.video),
            label: 'الفيديو',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.user),
            label: 'الملف',
          ),
        ],
      ),
    );
  }
}

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/logotext.png", height: 40),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/video'),
          child: const Text('بدء تسجيل الفيديو'),
        ),
      ),
    );
  }
}

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/logotext.png", height: 40),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.bell, size: 35),
            onPressed: () => Navigator.pushNamed(context, '/notifications'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildFeatureButton(
              icon: LucideIcons.video,
              label: 'تحليل لغة الإشارة',
              onPressed: () => Navigator.pushNamed(context, '/video'),
              context: context,
            ),
            const SizedBox(height: 30),
            _buildFeatureButton(
              icon: LucideIcons.messageSquare,
              label: 'المساعد سامر',
              onPressed: () => Navigator.pushNamed(context, '/chatbot'),
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    required BuildContext context,
  }) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        backgroundColor: themeProvider.isDarkMode 
            ? Colors.blueGrey[800] 
            : Colors.blue[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: Colors.blue),
          const SizedBox(width: 15),
          Text(label, style: TextStyle(
            fontSize: 18,
            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
          )),
        ],
      ),
    );
  }
}