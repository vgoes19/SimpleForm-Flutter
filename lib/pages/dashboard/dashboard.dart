import 'package:flutter/material.dart';
import 'package:simple_form_flutter/components/dashboard/item_dashboard.dart';
import 'package:simple_form_flutter/pages/contatos/lista.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFE5EBFD),
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset('lib/images/dashboard.jpg')
            ),
          ),
          ItemDashboard(
            icone: Icons.people, 
            titulo: 'Contatos',
            navigateTo: () => {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ListaContatos())
              ) 
            }
          )
        ],
      ),
    );
  }
}

