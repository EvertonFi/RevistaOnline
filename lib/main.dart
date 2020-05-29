import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Page(),
    );
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              //pinned: true,
              floating: false,
              expandedHeight: MediaQuery.of(context).size.height / 12,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text('Edições'),
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      const url =
                          'https://americalatina.dint.fgv.br/sites/americalatina.dint.fgv.br/files/teste33.pdf';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('Item Numero $index'),
                      color: Colors.redAccent,
                    ),
                  );
                },
                childCount: 5,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 1.0,
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/youtube.png',
                    scale: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'YouTube',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () async {
                const url = 'https://youtube.com';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            ListTile(
              title: Center(
                child: Text(
                  'Entre em Contato',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/WhatsApp.png',
                    scale: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('WhatsApp'),
                  ),
                ],
              ),
              onTap: () async {
                const url = 'https://api.whatsapp.com/send?phone=5581998682810';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/facebook.png',
                    scale: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13.0),
                    child: Text('Facebook'),
                  ),
                ],
              ),
              onTap: () async {
                const url = 'https://facebook.com';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/Instagram.png',
                    scale: 45,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13.0),
                    child: Text('Instagram'),
                  ),
                ],
              ),
              onTap: () async {
                const url = 'https://instagram.com';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/email.png',
                    scale: 23,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text('E-mail'),
                  ),
                ],
              ),
              onTap: () async {
                final Uri params = Uri(
                  scheme: 'mailto',
                  path: 'my.mail@example.com',
                );
                String url = params.toString();
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  print('Could not launch $url');
                }
              },
            ),
            Divider(),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(
                    Icons.accessibility,
                    size: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text("Acessibilidade"),
                  ),
                ],
              ),
              onTap: () {
                // Navigator.pop(),
              },
            )
          ],
        ),
      ),
    );
  }
}
