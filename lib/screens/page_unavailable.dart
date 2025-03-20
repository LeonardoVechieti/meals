import 'package:flutter/material.dart';

class PageUnavailable extends StatelessWidget {
  const PageUnavailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página não encontrada"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Página não encontrada!", style: TextStyle(fontSize: 20),),
            Divider(),
            Icon(Icons.error),
            Divider(),
            ElevatedButton(
              onPressed : () {
                Navigator.of(context).pushReplacementNamed('/');
              },
              child: Text("Voltar para a tela inicial"),
            ),
          ],
        ),
      ),
    );
  }
}
