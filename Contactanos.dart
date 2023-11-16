import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ContactanosPage extends StatefulWidget {
  @override
  _ContactanosPageState createState() => _ContactanosPageState();
}

class _ContactanosPageState extends State<ContactanosPage> {
  final List<String> imageUrls = [
    'assets/images/banner4.jpg',
    'assets/images/banner2.jpg',
    'assets/images/banner3.jpg',
  ];

  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_image.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black12.withOpacity(0.6),
                BlendMode.srcOver,
              ),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                'Contáctanos',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              CarouselSlider(
                options: CarouselOptions(
                  height: 250,
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              ContactInfo(
                title: 'Teléfono Sede Central',
                info: '(502) 2410-5555',
              ),
              ContactInfo(
                title: 'Call Center',
                info: '1565',
              ),
              ContactInfo(
                title: 'Ubicación Sede Central',
                info: 'Calle Doroteo Guamuch Flores 7-51 zona 5, Guatemala, C.A.',
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Correo Electrónico',
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, ingrese su correo electrónico';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: messageController,
                          maxLines: 4,
                          decoration: InputDecoration(
                            labelText: 'Mensaje',
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, ingrese su mensaje';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              emailController.clear();
                              messageController.clear();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Información enviada'),
                                    content: Text('Tu mensaje ha sido enviado con éxito.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: Text('Enviar'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.white.withOpacity(0.5),
                        size: 40,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Gmail',
                        style: TextStyle(color: Colors.white.withOpacity(0.5)),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Icon(
                        Icons.facebook_rounded,
                        color: Colors.white.withOpacity(0.5),
                        size: 40,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Facebook',
                        style: TextStyle(color: Colors.white.withOpacity(0.5)),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.white.withOpacity(0.5),
                        size: 40,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'PBX',
                        style: TextStyle(color: Colors.white.withOpacity(0.5)),
                      ),
                    ],
                  ),
                  // Agrega más columnas para otras redes sociales si es necesario
                ],
              ),
              SizedBox(height: 100), // Ajustar este espacio según sea necesario
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
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  final String title;
  final String info;

  ContactInfo({required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      subtitle: Text(info, style: TextStyle(color: Colors.white)),
      leading: Icon(Icons.arrow_right_sharp, color: Colors.white),
    );
  }
}
