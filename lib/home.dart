import 'package:flutter/material.dart';
import 'package:haupcartest/categories.dart';
import 'package:haupcartest/l10n/app_localizations.dart';

class Homepage extends StatefulWidget {
  final void Function(Locale locale) onLocaleChange;

  const Homepage({super.key, required this.onLocaleChange});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('title')),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context)!.translate('setting'),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text(AppLocalizations.of(context)!.translate('language')),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(AppLocalizations.of(context)!
                        .translate('choose_language')),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text('English'),
                          onTap: () {
                            widget.onLocaleChange(Locale('en'));
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('ไทย'),
                          onTap: () {
                            widget.onLocaleChange(Locale('th'));
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: CategoriesPage(),
    );
  }
}
