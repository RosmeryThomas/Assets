import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> imageUrls;

  ImageCarousel({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "El INTECAP, durante más de 50 años de existencia, ha sido una herramienta importante para la productividad laboral y empresarial de Guatemala. En cumplimiento de su misión: formar, capacitar, asistir técnicamente y certificar por competencias laborales, a personas y empresas en todas las actividades económicas y niveles ocupacionales, promoviendo la productividad, la empleabilidad y el desarrollo del país; el INTECAP cuenta con Centros y Delegaciones en toda la República, lo que le permite atender a más de 300 mil participantes y desarrollar más de 100 mil horas de asistencia técnica por año, en todos los sectores económicos. De sus aulas han egresado emprendedores e innovadores, quienes han desarrollado habilidades técnicas a través de su formación, y que a su vez, brindan oportunidades laborales a terceros al implementar nuevos negocios. Desarrolla programas de capacitación para grupos vulnerables, los cuales pueden tener apoyo de otras entidades. Fortalece las capacidades del recurso humano, cerrando brechas de conocimiento, brindando actualización de contenidos o especializando al participante.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      height: 1.5,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Texto sobre las imágenes "val"
                    Column(
                      children: [
                        Text(
                          ' Trabajo en equipo',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                            height: 2,
                          ),
                        ),
                        Image.network('assets/images/val1.png', width: 100, height: 100, fit: BoxFit.cover),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Pasión',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                            height: 2,
                          ),
                        ),
                        Image.network('assets/images/val2.png', width: 100, height: 100, fit: BoxFit.cover),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Resolución de problemas',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                            height: 2,
                          ),
                        ),
                        Image.network('assets/images/val3.png', width: 100, height: 100, fit: BoxFit.cover),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Responsabilidad social',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                            height: 2,
                          ),
                        ),
                        Image.network('assets/images/val4.png', width: 100, height: 100, fit: BoxFit.cover),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "La connotación del color azul es: infinidad, frescura, integridad, estabilidad, formalidad, respeto y majestuosidad. El color azul tiene un efecto tranquilizante para la mente.Al utilizar el azul en el logotipo se transmite la madurez y sabiduría de la institución. Además refleja una imagen dinámica, innovadora, limpia y en constante evolución; enfatizando el anhelo de ser pioneros en la educación para el trabajo y para la vida.Además refleja una imagen dinámica, innovadora, limpia y en constante evolución; enfatizando el anhelo de ser pioneros en la educación para el trabajo y para la vida.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      height: 1.5,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Cuatro imágenes después del segundo texto
                    Image.network('assets/images/A1.png', width: 300, height: 300, fit: BoxFit.cover),
                    Image.network('assets/images/A2.jpeg', width: 300, height: 300, fit: BoxFit.cover),
                    Image.network('assets/images/A3.jpg', width: 300, height: 300, fit: BoxFit.cover),
                    Image.network('assets/images/A4.jpg', width: 300, height: 300, fit: BoxFit.cover),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
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
        ],
      ),
    );
  }
}
