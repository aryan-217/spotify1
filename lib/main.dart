import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone1/data.dart';
import 'package:spotify_clone1/widgets/widgets.dart';
import 'package:spotify_clone1/screens/playlist_screen.dart';


import 'models/current_track_model.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DesktopWindow.setWindowSize(const Size(600, 800));
  runApp(  ChangeNotifierProvider  (
      create: (context) => CurrentTrackModel(),
      child: MyApp(),
    ) as Widget);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Spotify UI',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: Colors.black,
        focusColor: const Color(0xFF1DB954),
        // accentColor: const Color(0xFF1DB954),
        iconTheme: const IconThemeData().copyWith(color: Colors.white),
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          displayMedium: const TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            fontSize: 12.0,
            color: Colors.grey[300],
            fontWeight: FontWeight.w500,
            letterSpacing: 2.0,
          ),
          bodyLarge: TextStyle(
            color: Colors.grey[300],
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
          ),
          bodyMedium: TextStyle(
            color: Colors.grey[300],
            letterSpacing: 1.0,
          ),
        ), // colorScheme: ColorScheme(background: const Color(0xFF121212), brightness:null ),
      ),
      home: Shell(),
    );
  }
}

class Shell extends StatelessWidget {
  const Shell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              if (MediaQuery.of(context).size.width > 800) SideMenu(),
             Expanded(child: PlaylistScreen(playlist: lofihiphopPlaylist,)),
            ],
          )),
          CurrentTrack(),
        ],
      ),
    );
  }
}
