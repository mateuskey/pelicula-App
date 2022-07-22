import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Peliculas en cines')
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon( Icons.search_outlined), 
          ),
        ],
      ),
      // SigleChild sirve para hacer scroll cuando hay mas archivos
      body: SingleChildScrollView(
        child: Column(
          children: [

          // Tarjetas principales
          CardSwiper(),

          // Slider peliculas
          MovieSlider(),
          ],
        ),
      ),
    );
  }
}
