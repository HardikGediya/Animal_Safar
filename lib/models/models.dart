import 'dart:typed_data';
import 'package:flutter/services.dart';

class Plans {

  final String subName;
  final double prize;
  final String image;

  Plans({
    required this.subName,
    required this.prize,
    required this.image,
  });

}

List<Plans> plans = <Plans>[

  Plans(subName: 'Week Subscription',
      prize: 1.99,
      image: 'https://images.unsplash.com/photo-1561109573-d2d121be6be9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YmFieSUyMGxpb258ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
  Plans(subName: '1 Month Subscription',
      prize: 4.39,
      image: 'https://images.unsplash.com/photo-1518709594023-6eab9bab7b23?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHplYnJhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
  Plans(subName: '3 Month Subscription',
      prize: 9.99,
      image: 'https://images.unsplash.com/photo-1615824996195-f780bba7cfab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8dGlnZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
  Plans(subName: '6 Month Subscription',
      prize: 13,
      image: 'https://images.unsplash.com/photo-1600521675573-6947b3dfd106?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZWxlcGhhbnRzJTIwd2lsZGxpZmV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),

];

class Animal {

  int? id;
  final String name;
  final String description;
  final String category;
  // final Uint8List image;

  Animal({
    this.id,
    required this.name,
    required this.description,
    required this.category,
    // required this.image,
  });

  factory Animal.fromMap(Map<String, dynamic> data){
    return Animal(
      id: data['id'],
      name: data['name'],
      description: data['description'],
      category: data['category'],
      // image: data['image'],
    );
  }
}

loadImage({required String? image})async {
  final ByteData bytes = await rootBundle.load('$image');
  final Uint8List myImg = bytes.buffer.asUint8List();
  return myImg;
}

List imageData = [

  loadImage(image: 'assets/images/animal1.jpg'),
  loadImage(image: 'assets/images/animal2.jpg'),
  loadImage(image: 'assets/images/animal3.jpg'),
  loadImage(image: 'assets/images/animal4.jpg'),
  loadImage(image: 'assets/images/animal5.jpg'),
  loadImage(image: 'assets/images/bird1.jpg'),
  loadImage(image: 'assets/images/bird2.jpg'),
  loadImage(image: 'assets/images/bird3.jpg'),
  loadImage(image: 'assets/images/bird4.jpg'),
  loadImage(image: 'assets/images/bird5.jpg'),
  loadImage(image: 'assets/images/fish1.jpg'),
  loadImage(image: 'assets/images/fish2.jpg'),
  loadImage(image: 'assets/images/fish3.jpg'),
  loadImage(image: 'assets/images/fish4.jpg'),
  loadImage(image: 'assets/images/fish5.jpg'),
  loadImage(image: 'assets/images/insect1.jpg'),
  loadImage(image: 'assets/images/insect2.jpg'),
  loadImage(image: 'assets/images/insect3.jpg'),
  loadImage(image: 'assets/images/insect4.jpg'),
  loadImage(image: 'assets/images/insect5.jpg'),


];

String des = 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.';

List<Animal> animal = <Animal>[

  Animal(name: 'Tiger', description: des, category: 'animal',),
  Animal(name: 'Lion', description: des, category: 'animal', ),
  Animal(name: 'Panda', description: des, category: 'animal',),
  Animal(name: 'Elephant', description: des, category: 'animal',),
  Animal(name: 'Horse', description: des, category: 'animal'),

  Animal(name: 'Pigeon', description: des, category: 'bird',),
  Animal(name: 'Peacock', description: des, category: 'bird',),
  Animal(name: 'Parrot', description: des, category: 'bird'),
  Animal(name: 'Swan', description: des, category: 'bird',),
  Animal(name: 'Penguin', description: des, category: 'bird',),

  Animal(name: 'Calypso', description: des, category: 'fish',),
  Animal(name: 'Drake', description: des, category: 'fish', ),
  Animal(name: 'Hunter', description: des, category: 'fish', ),
  Animal(name: 'Juliet', description: des, category: 'fish'),
  Animal(name: 'Leilani', description: des, category: 'fish', ),

  Animal(name: 'Butterfly', description: des, category: 'insect', ),
  Animal(name: 'Snail', description: des, category: 'insect',),
  Animal(name: 'Spider', description: des, category: 'insect', ),
  Animal(name: 'Cicada', description: des, category: 'insect', ),
  Animal(name: 'Ladybug', description: des, category: 'insect'),

];

String category = 'animal';

late Future<List<Animal>> fetchData;


List animalImages = [
  'assets/images/animal1.jpg',
  'assets/images/animal2.jpg',
  'assets/images/animal3.jpeg',
  'assets/images/animal4.jpg',
  'assets/images/animal5.jpg',
  'assets/images/animal1.jpg',
  'assets/images/animal2.jpg',
  'assets/images/animal3.jpeg',
  'assets/images/animal4.jpg',
  'assets/images/animal5.jpg',
  'assets/images/animal1.jpg',
  'assets/images/animal2.jpg',
  'assets/images/animal3.jpeg',
  'assets/images/animal4.jpg',
  'assets/images/animal5.jpg',
  'assets/images/animal1.jpg',
  'assets/images/animal2.jpg',
  'assets/images/animal3.jpeg',
  'assets/images/animal4.jpg',
  'assets/images/animal5.jpg',

];

List birdImages = [
  'assets/images/bird1.jpg',
  'assets/images/bird2.jpg',
  'assets/images/bird3.jpg',
  'assets/images/bird4.jpg',
  'assets/images/bird5.jpeg',
  'assets/images/bird1.jpg',
  'assets/images/bird2.jpg',
  'assets/images/bird3.jpg',
  'assets/images/bird4.jpg',
  'assets/images/bird5.jpeg',
  'assets/images/bird1.jpg',
  'assets/images/bird2.jpg',
  'assets/images/bird3.jpg',
  'assets/images/bird4.jpg',
  'assets/images/bird5.jpeg',
  'assets/images/bird1.jpg',
  'assets/images/bird2.jpg',
  'assets/images/bird3.jpg',
  'assets/images/bird4.jpg',
  'assets/images/bird5.jpeg',
];

List fishImages = [
  'assets/images/fish1.jpg',
  'assets/images/fish2.jpg',
  'assets/images/fish3.jpg',
  'assets/images/fish4.jpg',
  'assets/images/fish5.jpg',
  'assets/images/fish1.jpg',
  'assets/images/fish2.jpg',
  'assets/images/fish3.jpg',
  'assets/images/fish4.jpg',
  'assets/images/fish5.jpg',
  'assets/images/fish1.jpg',
  'assets/images/fish2.jpg',
  'assets/images/fish3.jpg',
  'assets/images/fish4.jpg',
  'assets/images/fish5.jpg',
  'assets/images/fish1.jpg',
  'assets/images/fish2.jpg',
  'assets/images/fish3.jpg',
  'assets/images/fish4.jpg',
  'assets/images/fish5.jpg',
];

List insectImages = [
  'assets/images/insect1.jpg',
  'assets/images/insect2.jpg',
  'assets/images/insect3.jpg',
  'assets/images/insect4.jpg',
  'assets/images/insect5.jpg',
  'assets/images/insect1.jpg',
  'assets/images/insect2.jpg',
  'assets/images/insect3.jpg',
  'assets/images/insect4.jpg',
  'assets/images/insect5.jpg',
  'assets/images/insect1.jpg',
  'assets/images/insect2.jpg',
  'assets/images/insect3.jpg',
  'assets/images/insect4.jpg',
  'assets/images/insect5.jpg',
  'assets/images/insect1.jpg',
  'assets/images/insect2.jpg',
  'assets/images/insect3.jpg',
  'assets/images/insect4.jpg',
  'assets/images/insect5.jpg',
];