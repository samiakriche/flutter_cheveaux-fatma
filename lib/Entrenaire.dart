import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Entrenaire extends StatelessWidget {
  const Entrenaire({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomNavigationBar:
          CurvedNavigationBar(backgroundColor: Color(0xff7a5050), items: [
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
            child: Icon(Icons.home)),
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/chek');
            },
            child: Icon(Icons.add)),
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Icon(Icons.chat_bubble_outline)),
      ]),
    
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight * 1.5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.only(
               bottomLeft: Radius.circular(320.0),
                bottomRight: Radius.circular(320.0),
                topLeft: Radius.circular(320.0),
                topRight: Radius.circular(320.0),
            ),
            border: Border.all(
              color: Color.fromARGB(255, 252, 246, 244),
              width: 4.0,
            ),
          ),
          child: AppBar(
            title: Row(children: [
              SizedBox(
                height: 40.0,
                child: Image.asset(
                  'lib/img/logoo.png',
                  width: 150.0,
                  height: 100.0,
                ),
              ),
              SizedBox(
                height: 40.0,
                child: Text(
                  'Entrenaire',
                  style: TextStyle(
                    color: Color.fromARGB(255, 252, 249, 248),
                    fontSize: 25,
                    fontFamily: 'serif',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]),
            elevation: 0.0,
            backgroundColor: Color.fromARGB(0, 235, 244, 245),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                 hintText: 'Nom Prénom',
               
               hintStyle: TextStyle(
                  fontSize: 20.0,
                fontStyle: FontStyle.italic,
                  color: Colors.brown,
                ),
                ),  ),
              SizedBox(height: 30.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey[200],
                ),
child:Card(
  child: ListTile(
    leading: Icon(Icons.access_time),
    title: Text('Heure d\'entrainement:'     '  ''5:00', style: TextStyle(fontSize:12),),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Date : 12 mai 2023'),
        Text('Nom de cheval : Jarray'),
      ],
    ),
    trailing: Text('Groupe 1'),
  ),
)
)   

                  ]),
  
          ),
        ),
      );
  
  }
}


