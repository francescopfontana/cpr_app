import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const CPRApp());  // Funzione main
}

class CPRApp extends StatelessWidget {
  const CPRApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CPR App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const CPRScreen(category: 'Adulto'),
    const CPRScreen(category: 'Bambino'),
    const CPRScreen(category: 'Lattante'),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CPR App'),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Adulto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.child_care),
            label: 'Bambino',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.baby_changing_station),
            label: 'Lattante',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Impostazioni',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CPRScreen extends StatelessWidget {
  final String category;
  const CPRScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Categoria selezionata: $category',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Azione per iniziare la CPR (da implementare)
            },
            child: const Text('INIZIA CPR'),
          ),
          const SizedBox(height: 20),
          Text(
            getAgeDescription(category), // Mostra la descrizione della fascia d'età
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Metodo per ottenere la descrizione della fascia d'età
  String getAgeDescription(String category) {
    switch (category) {
      case 'Adulto':
        return 'Per Adulto si intende una persona di età pari o superiore ai 10 anni.';
      case 'Bambino':
        return 'Per Bambino si intende una persona con età compresa tra 1 e 10 anni.';
      case 'Lattante':
        return 'Per Lattante si intende un neonato di età inferiore a 1 anno.';
      default:
        return 'Categoria non riconosciuta.';
    }
  }
}

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final Uri _url = Uri.parse('https://www.cri.it');

  Future<void> _launchURL() async {
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'CPR APP Beta 1.0 made by Francesco Pio Fontana',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _launchURL,
            child: const Text('Scopri di più sulla Croce Rossa Italiana'),
          ),
        ],
      ),
    );
  }
}
