import 'package:codigos_postales/data_source/postal_code_service.dart';
import 'package:codigos_postales/models/postal_codes.dart';
import 'package:codigos_postales/screens/modal/modal_content.dart';
import 'package:codigos_postales/utils/app_styles.dart';
import 'package:codigos_postales/widgets/place_card_widget.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  PostalCodes? postalCodes; //MODEL
  PostalCodeService? postalCode; //API
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            if (postalCodes == null)
              const Center(
                  child: Text("Aun no hay datos, pulsa la lupa para buscar")),
            if (postalCodes != null)
              for (var place in postalCodes!.places)
                PlaceCardWidget(place: place),
          ],
        ),
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
            onSave: (data) {
              setState(() {
                var dataList = data.entries.toList();
                postalCode?.fechData(dataList[0].value, dataList[1].value);
              });
            },
          ),
        );
      },
    );
  }
}
