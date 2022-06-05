import 'package:flutter/material.dart';

import '../helpers/helpers.dart';
import '../models/models.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage((category == 'animal')
                    ? animalImages[0]
                    : (category == 'bird')
                        ? birdImages[2]
                        : (category == 'fish')
                            ? fishImages[3]
                            : insectImages[0]),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.center,
            child: const Text(
              "Welcome to \n New Aplanet",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 250),
            height: 600,
            decoration: const BoxDecoration(
                color: Color(0xffC19E82),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Related for you",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FutureBuilder(
                    future: fetchData,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Error:- ${snapshot.error}"),
                        );
                      } else if (snapshot.hasData) {
                        List<Animal> data = snapshot.data;
                        return SizedBox(
                          height: 350,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  height: 250,
                                                  width: 200,
                                                  decoration: BoxDecoration(
                                                    color: Colors.amber,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                      image: AssetImage((category ==
                                                              'animal')
                                                          ? animalImages[index]
                                                          : (category == 'bird')
                                                              ? birdImages[
                                                                  index]
                                                              : (category ==
                                                                      'fish')
                                                                  ? fishImages[
                                                                      index]
                                                                  : insectImages[
                                                                      index]),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  data[index].name,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                SizedBox(
                                                  width: 170,
                                                  child: Text(
                                                    data[index].description,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Quick categories",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          category = "animal";
                          setState(() {
                            fetchData = DBHelper.dbHelper.fetchData();
                          });
                        },
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "🦁",
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          category = "fish";
                          setState(() {
                            fetchData = DBHelper.dbHelper.fetchData();
                          });
                        },
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "🐤",
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          category = "bird";
                          setState(() {
                            fetchData = DBHelper.dbHelper.fetchData();
                          });
                        },
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "🦈",
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          category = "insect";
                          setState(() {
                            fetchData = DBHelper.dbHelper.fetchData();
                          });
                        },
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "🦋",
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  const [
                      SizedBox(
                        width: 70,
                          child:  Text(
                        'ANIMAL',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white),
                              textAlign: TextAlign.center
                      )),
                      SizedBox(
                        width: 70,
                        child: Text(
                          'BIRD',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              letterSpacing: 3,
                              color: Colors.white),
                            textAlign: TextAlign.center
                        ),
                      ),
                      SizedBox(
                        width: 70,
                        child: Text(
                          'FISH',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              letterSpacing: 3,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: 70,
                        child: Text(
                          'INSECT',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              letterSpacing: 3,
                              color: Colors.white),
                            textAlign: TextAlign.center
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
