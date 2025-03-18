import 'package:flutter/material.dart'; // Importa il pacchetto base di Flutter per la UI.
import 'package:url_launcher/url_launcher.dart';  // Importa il pacchetto per aprire URL esterni.

void main() {
  runApp(CPRApp());  // Punto di ingresso dell'app: esegue CPRApp.
}

class CPRApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CPR App',  // Titolo dell'applicazione.
      theme: ThemeData(
        primarySwatch: Colors.red,  // Imposta il tema principale con il colore rosso.
      ),
      home: HomeScreen(), // Definisce la schermata iniziale dell'app.
    );
  }
}

// Schermata principale dell'app, che gestisce la navigazione tra le categorie e le impostazioni.
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// Stato associato a HomeScreen, mantiene la selezione della scheda attuale.
class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;  // Indice della scheda attualmente selezionata.


// Lista di widget corrispondenti alle schermate disponibili.
  static final List<Widget> _widgetOptions = <Widget>[
    CPRScreen(category: 'Adulto'),    // Schermata CPR per adulti.
    CPRScreen(category: 'Bambino'),   // Schermata CPR per bambini.
    CPRScreen(category: 'Lattante'),  // Schermata CPR per lattanti.
    SettingsScreen(),                 // Schermata delle impostazioni.
  ];

// Aggiorna l'indice selezionato quando un'icona nella barra di navigazione viene premuta.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CPR App'), // Titolo della barra superiore.
      ),
      body: _widgetOptions[_selectedIndex], // Mostra la schermata corrispondente alla selezione.
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Icona per gli adulti.
            label: 'Adulto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.child_care),  // Icona per i bambini.
            label: 'Bambino',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.baby_changing_station),  // Icona per i lattanti.
            label: 'Lattante',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),  // Icona per le impostazioni.
            label: 'Impostazioni',
          ),
        ],
        currentIndex: _selectedIndex,  // Indica la scheda attualmente selezionata.
        selectedItemColor: Colors.red,  // Colore dell'icona selezionata.
        unselectedItemColor: Colors.grey,  // Colore delle icone non selezionate.
        onTap: _onItemTapped,  // Gestisce il cambio di scheda.
      ),
    );
  }
}

// Schermata che mostra le istruzioni per la CPR in base alla categoria selezionata.
class CPRScreen extends StatelessWidget {
  final String category;
  const CPRScreen({Key? key, required this.category}) : super(key: key);

  // Mappa con le descrizioni delle fasce d'età per ogni categoria
  static const Map<String, List<TextSpan>> categoryDescriptions = {
    'Adulto': [
      TextSpan(text: 'Per '),
      TextSpan(text: 'Adulto', style: TextStyle(fontWeight: FontWeight.bold)),
      TextSpan(text: ' si intende una persona dai '),
      TextSpan(text: '14 anni in su', style: TextStyle(fontWeight: FontWeight.bold)),
      TextSpan(text: ', a cui si applicano le tecniche di rianimazione per adulti.'),
    ],
    'Bambino': [
      TextSpan(text: 'Per '),
      TextSpan(text: 'Bambino', style: TextStyle(fontWeight: FontWeight.bold)),
      TextSpan(text: ' si intende una persona di età compresa tra '),
      TextSpan(text: '1 anno e la pubertà', style: TextStyle(fontWeight: FontWeight.bold)),
      TextSpan(text: ' (circa 12-14 anni), a cui si applicano tecniche di rianimazione pediatriche.'),
    ],
    'Lattante': [
      TextSpan(text: 'Per '),
      TextSpan(text: 'Lattante', style: TextStyle(fontWeight: FontWeight.bold)),
      TextSpan(text: ' si intende un bambino dalla '),
      TextSpan(text: 'nascita fino a 12 mesi di età', style: TextStyle(fontWeight: FontWeight.bold)),
      TextSpan(text: ', per il quale le manovre di soccorso prevedono tecniche specifiche per neonati.'),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Categoria selezionata: $category',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Azione per iniziare la CPR (da implementare)
            },
            child: Text('INIZIA CPR'),
          ),
          SizedBox(height: 20), // Spazio tra il bottone e la descrizione
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black),
                children: categoryDescriptions[category] ?? [TextSpan(text: 'Descrizione non disponibile.')],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Schermata delle impostazioni, fornisce informazioni sull'app e un link alla Croce Rossa Italiana.
class SettingsScreen extends StatelessWidget {
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
        crossAxisAlignment: CrossAxisAlignment.center, // Centra gli elementi
        children: [
          // Logo della Croce Rossa Italiana
          Image.asset(
            'assets/Logo_CRI-removebg-preview.png', // Percorso del file
            width: 150, // Regola la dimensione
          ),
          SizedBox(height: 20),

          // Testo informativo
          Text(
            'CPR APP Beta 1.0 made by Francesco Pio Fontana',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),

          // Pulsante per aprire il sito della Croce Rossa
          ElevatedButton(
            onPressed: _launchURL,
            child: Text('Scopri di più sulla Croce Rossa Italiana'),
          ),
        ],
      ),
    );
  }
}