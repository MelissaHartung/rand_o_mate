import 'package:flutter/material.dart';
import 'package:rand_o_mate/model/aktivitaeten.dart';
import 'package:rand_o_mate/model/filme.dart';
import 'package:rand_o_mate/model/rezepte.dart';
import 'package:rand_o_mate/screens/homescreen.dart';
import 'package:rand_o_mate/screens/widgets/aktivitaetencard.dart';
import 'package:rand_o_mate/screens/widgets/filter.dart';
import 'package:rand_o_mate/screens/widgets/filmecard.dart';
import 'package:rand_o_mate/screens/widgets/rezeptcard.dart';
import 'package:rand_o_mate/services/aktivitaeten_services.dart';
import 'package:rand_o_mate/services/filme_services.dart';
import 'package:rand_o_mate/services/rezepte_services.dart';

class Uebersichtspage extends StatefulWidget {
  final String category;

  const Uebersichtspage({super.key, required this.category});

  @override
  State<Uebersichtspage> createState() => _UebersichtspageState();
}

class _UebersichtspageState extends State<Uebersichtspage> {
  final RezepteServices _rezepteServices = RezepteServices();
  final AktivitaetenServices _aktivitaetenServices = AktivitaetenServices();
  final FilmeServices _filmeServices = FilmeServices();

  List<Rezepte> _rezepteList = [];
  List<Aktivitaeten> _aktivitaetenList = [];
  List<Filme> _filmeList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    setState(() {
      _rezepteList = _rezepteServices.getAllRezepte();
      _aktivitaetenList = _aktivitaetenServices.getAllAktivitaeten();
      _filmeList = _filmeServices.getAllFilme();
    });
  }

  String get _pageTitle {
    final category = widget.category.toLowerCase();

    if (category.contains('aktiv')) {
      return 'Aktivitaetenuebersicht';
    }

    if (category.contains('film')) {
      return 'Filmeuebersicht';
    }

    return 'Rezeptuebersicht';
  }

  String get _pageSubtitle {
    final category = widget.category.toLowerCase();

    if (category.contains('aktiv')) {
      return 'Finde spontane Ideen fuer drinnen und draussen';
    }

    if (category.contains('film')) {
      return 'Entdecke Filme fuer deinen naechsten Abend';
    }

    return 'Leckere Ideen fuer deine naechste Mahlzeit';
  }

  Widget _buildBody() {
    final category = widget.category.toLowerCase();

    if (category.contains('aktiv')) {
      return SizedBox(
        height: 260,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _aktivitaetenList.length,
          itemBuilder: (context, index) {
            return AktivitaetenCard(aktivitaet: _aktivitaetenList[index]);
          },
        ),
      );
    }

    if (category.contains('film')) {
      return SizedBox(
        height: 260,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _filmeList.length,
          itemBuilder: (context, index) {
            return FilmeCard(film: _filmeList[index]);
          },
        ),
      );
    }

    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _rezepteList.length,
        itemBuilder: (context, index) {
          return RezeptCard(rezept: _rezepteList[index]);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(248, 220, 186, 240),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Homescreen()));
                    },
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search, color: Colors.black87),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(_pageTitle, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text(_pageSubtitle, style: const TextStyle(fontSize: 15, color: Color(0xFF8D8D8D))),
              const SizedBox(height: 24),
              FilterBar(category: widget.category),
              const SizedBox(height: 24),
              _buildBody(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => const Uebersichtspage(category: 'Rezepte')));
          } else if (index == 1) {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => const Uebersichtspage(category: 'Aktivitäten')));
          } else if (index == 2) {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => const Uebersichtspage(category: 'Filme')));
          }
        },
        backgroundColor: Color.fromARGB(248, 222, 199, 235),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_outlined, color: Color.fromARGB(255, 26, 26, 26)),
            label: "Rezepte",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.catching_pokemon_outlined, color: Color.fromARGB(255, 26, 26, 26)),
            label: "Aktivitäten",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined, color: Color.fromARGB(255, 26, 26, 26)),
            label: "Filme",
          ),
        ],
      ),
    );
  }
}
