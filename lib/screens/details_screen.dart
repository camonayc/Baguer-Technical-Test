import 'package:flutter/material.dart';
import 'package:technical_test_baguer/models/models.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)?.settings.arguments as User;
    User user = args;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.lightGreen,
          centerTitle: true,
          title: Text(
            "Detalles",
            style: TextStyle(fontSize: size.height * 0.044),
          )),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin:  EdgeInsets.only(
                    top: size.height * 0.03 / 2, bottom: size.height * 0.03 / 2, left: size.height * 0.102, right: size.height * 0.102),
                child: Text(
                  "${user.id.name}: ${user.id.value}",
                  style: TextStyle(
                      fontSize: size.height * 0.03,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: size.height * 0.03 / 4),
                child: Text(
                  "User: ${user.login.username}",
                  style: TextStyle(
                      fontSize: size.height * 0.03,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: size.height * 0.03 / 2, horizontal: size.height * 0.102),
                height: size.height * 0.4,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(user.picture.large, scale: 0.4))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "${user.name.first} ${user.name.last}",
                    style:  TextStyle(
                        fontSize: size.height * 0.0366, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: size.height * 0.03 / 2),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: size.height * 0.03 / 4),
                      child: Text(
                        user.email,
                        style: TextStyle(fontSize: size.height * 0.03),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: size.height * 0.03 / 4),
                      child: Text(
                        "Genero: ${getGender(user.gender)}",
                        style: TextStyle(fontSize: size.height * 0.03),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: size.height * 0.03 / 4),
                      child: Text(
                        "Celular: ${user.cell}",
                        style: TextStyle(fontSize: size.height * 0.03),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: size.height * 0.03 / 4),
                      child: Text(
                        "Telefono: ${user.phone}",
                        style: TextStyle(fontSize: size.height * 0.03),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: size.height * 0.03 / 4),
                      child: Text(
                        "${user.location.street.name} ${user.location.street.number}",
                        style: TextStyle(fontSize: size.height * 0.03),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: size.height * 0.03 / 4),
                      child: Text(
                        user.location.city,
                        style: TextStyle(fontSize: size.height * 0.03),
                      ),
                    ),
                    Container(
                      margin:  EdgeInsets.only(bottom: size.height * 0.03 / 4),
                      child: Text(
                        "${user.location.state} - ${translateCountry(user.location.country)}",
                        style: TextStyle(fontSize: size.height * 0.03),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.015))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

String? getGender(String? gender) {
  switch (gender) {
    case "female":
      return "Mujer";
    case "male":
      return "Hombre";
  }
}

String? translateCountry(String? country) {
  switch (country) {
    case "Spain":
      return "España";
  }
}

String? getAllLocation(Location? location) {
  return "${location?.street.name} ${location?.street.number}, ${location?.city}, ${location?.state} - ${location?.country}";
}
