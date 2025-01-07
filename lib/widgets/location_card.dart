import 'package:codigos_postales/models/postal_codes.dart';
import 'package:codigos_postales/screens/web/web_view.dart';
import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final Place location;

  const LocationCard({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(location.placeName),
        subtitle: Text(location.state),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.map),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebViewScreen(
                      urlString:
                          "https://www.google.com/maps?q=${location.latitude},${location.longitude}",
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.info),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebViewScreen(
                      urlString:
                          "https://en.wikipedia.org/wiki/${location.placeName}",
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
