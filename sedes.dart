import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SedeItem {
  final String sedeName;
  final String location;
  final String phoneNumber;

  SedeItem({
    required this.sedeName,
    required this.location,
    required this.phoneNumber,
  });
}

class RegionItem {
  final String regionName;
  final List<SedeItem> sedes;

  RegionItem({required this.regionName, required this.sedes});
}

class SedesTab extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/images/B1.jpg',
    'assets/images/B2.jpg',
    'assets/images/B4.jpeg',
  ];

  final List<RegionItem> regiones = [
    RegionItem(
      regionName: 'REGIÓN CENTRAL',
      sedes: [
        SedeItem(
          sedeName: 'OFICINAS CENTRALES',
          location: 'Calle Doroteo Guamuch Flores 7-51, zona 5. 6º nivel.Guatemala, C.A.',
          phoneNumber: 'PBX: 2410-5555',
        ),
        // Agrega más sedes si es necesario
      ],
    ),
    RegionItem(
      regionName: 'REGIÓN NORTE',
      sedes: [
        SedeItem(
          sedeName: 'OFICINAS CENTRALES',
          location: 'Km 477 Caserío Santa Cruz, San Francisco, Petén.',
          phoneNumber: 'PBX: 7740-2100',
        ),
        // Agrega más sedes si es necesario
      ],
    ),
    RegionItem(
      regionName: 'REGIÓN OCCIDENTE',
      sedes: [
        SedeItem(
          sedeName: 'OFICINAS CENTRALES',
          location: '6ª Calle 29-50, zona 3, Quetzaltenango.',
          phoneNumber: 'PBX: 7873-4000',
        ),
        // Agrega más sedes si es necesario
      ],
    ),
    RegionItem(
      regionName: 'REGIÓN SUR',
      sedes: [
        SedeItem(
          sedeName: 'OFICINAS CENTRALES',
          location: 'Km 93 Carretera CA-2 a Mazatenango, Santa Lucía Cotzumalguapa, Escuintla.',
          phoneNumber: 'PBX: 7828-0100',
        ),
        // Agrega más sedes si es necesario
      ],
    ),
    RegionItem(
      regionName: 'REGIÓN ORIENTE',
      sedes: [
        SedeItem(
          sedeName: 'OFICINAS CENTRALES',
          location: '6ª Calle final, zona 5, Chiquimula.',
          phoneNumber: 'Tel.: 7942-0511',
        ),
        // Agrega más sedes si es necesario
      ],
    ),
    // Agrega más regiones si es necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 500,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
              ),
              items: imageUrls.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: regiones.map((region) {
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: ExpansionTile(
                      title: Text(
                        region.regionName,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      children: region.sedes.map((sede) {
                        return ListTile(
                          title: Text(
                            sede.sedeName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(sede.location),
                              Text(sede.phoneNumber),
                            ],
                          ),
                          leading: Icon(Icons.location_on),
                          onTap: () {
                            // Puedes agregar acciones al hacer clic en cada elemento si lo deseas
                          },
                        );
                      }).toList(),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 75,
                    height: 75,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '© 2023 - Derechos Reservados',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
