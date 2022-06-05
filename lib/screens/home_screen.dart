import 'package:flutter/material.dart';

import '../helpers/helpers.dart';
import '../models/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  insertData() async {

    for(int i = 0 ; i<animal.length; i++)
    {
      await DBHelper.dbHelper.insertData(data: animal[i]);

    }

  }


  @override
  initState(){
    super.initState();
    insertData();

    fetchData = DBHelper.dbHelper.fetchData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffc19e82),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Choose a Plan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 700,
              child: ListView.separated(
                itemCount: plans.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed('details_screen',arguments: plans[i]);
                    },
                    child: Container(
                      height: 135,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(plans[i].image),
                            opacity: 0.9,
                            fit: BoxFit.cover,
                          )),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width : 200,
                              child: Text(
                                plans[i].subName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25),
                              ),
                            ),
                            Text(
                              "\$${plans[i].prize}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 35),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, i) {
                  return const SizedBox(height: 30);
                },
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child:  Text(
                'Last step to enjoy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
