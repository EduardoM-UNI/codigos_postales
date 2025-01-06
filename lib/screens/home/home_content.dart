import 'package:codigos_postales/data_source/postal_code_service.dart';
import 'package:codigos_postales/models/postal_codes.dart';
import 'package:codigos_postales/screens/modal/modal_content.dart';
import 'package:codigos_postales/utils/app_styles.dart';
import 'package:codigos_postales/widgets/location_card.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<Place> _places = [];
  PostalCodes? postalCodes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Códigos Postales"),
        leading: const Icon(
          Icons.menu,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _openModal(context),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                AppStyles.raspberryColor,
                AppStyles.kleinBlueColor
              ])),
        ),
      ),
      backgroundColor: AppStyles.thistileColor,
      body: _places.isEmpty
          ? const Center(child: Text("Pulsa el botón lupa para buscar"))
          : ListView.builder(
              itemCount: _places.length,
              itemBuilder: (context, index) =>
                  LocationCard(location: _places[index]),
            ),
    );
  }

  void _openModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 16.0,
          ),
          child: ModalContent(
            onSave: (data) async {
              final postalCode = PostalCodeService();
              var dataList = data.entries.toList();
              final response = await postalCode.fechData(
                  dataList[0].value, dataList[1].value);
              setState(() {
                _places = response.places;
              });
            },
          ),
        );
      },
    );
  }
}
