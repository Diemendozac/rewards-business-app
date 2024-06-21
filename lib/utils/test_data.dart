

import '../models/merchant_model.dart';
import '../models/product.dart';
import '../models/voucher.dart';
import 'package:uuid/uuid.dart';

class TestData {

  var uuid = const Uuid();

  Voucher voucher1 = Voucher('YHAS4', 'Hamburguesa Doble');
  Voucher voucher2 = Voucher('KGHI2', 'Perro Caliente Suizo');
  Voucher voucher3 = Voucher('0L81A', 'Coca Cola Litro');

  late List<Voucher> vouchers1 = [voucher1, voucher2, voucher3];

  final merchant1 = Merchant(image: 'assets/shapes/Hexagon.svg', name: 'Hexagon', description: 'Hello World', rating: 5);
  final merchant2 = Merchant(image: 'assets/shapes/Hexagon.svg', name: 'Poligon', description: 'Hello World', rating: 5);
  final merchant3 = Merchant(image: 'assets/shapes/Hexagon.svg', name: 'Tetraedrum', description: 'Hello World', rating: 5);
  final merchant4 = Merchant(image: 'assets/shapes/Hexagon.svg', name: 'Fish', description: 'Hello World', rating: 5);

  late List<Product> products = [
    Product(id: uuid.v4(), name: 'Hamburguesa Sencilla', price: 20000, description: 'Hamburguesa', tag: 'Hamburguesa'),
    Product(id: uuid.v4(), name: 'Pizza de Pollo', price: 20000, description: 'Pizza sencilla de pollo', tag: 'Pizza'),
    Product(id: uuid.v4(), name: 'Hot Dog', price: 15000, description: 'Hot dog con salsas', tag: 'Hot Dog'),
    Product(id: uuid.v4(), name: 'Sándwich de Jamón', price: 12000, description: 'Sándwich con jamón y queso', tag: 'Sándwich'),
    Product(id: uuid.v4(), name: 'Tacos de Carne', price: 18000, description: 'Tacos con carne asada', tag: 'Tacos'),
    Product(id: uuid.v4(), name: 'Ensalada César', price: 15000, description: 'Ensalada con pollo y aderezo César', tag: 'Ensalada'),
    Product(id: uuid.v4(), name: 'Burrito', price: 17000, description: 'Burrito con carne y frijoles', tag: 'Burrito'),
    Product(id: uuid.v4(), name: 'Pizza Margarita', price: 20000, description: 'Pizza con tomate y albahaca', tag: 'Pizza'),
    Product(id: uuid.v4(), name: 'Sushi Roll', price: 22000, description: 'Sushi de salmón y aguacate', tag: 'Sushi'),
    Product(id: uuid.v4(), name: 'Pollo a la Brasa', price: 25000, description: 'Pollo a la brasa con papas', tag: 'Pollo'),
    Product(id: uuid.v4(), name: 'Espaguetis con Albóndigas', price: 18000, description: 'Espaguetis con albóndigas y salsa', tag: 'Pasta'),
    Product(id: uuid.v4(), name: 'Nachos', price: 13000, description: 'Nachos con queso y jalapeños', tag: 'Nachos'),
    Product(id: uuid.v4(), name: 'Quesadilla', price: 16000, description: 'Quesadilla con queso y pollo', tag: 'Quesadilla'),
    Product(id: uuid.v4(), name: 'Wrap de Pollo', price: 15000, description: 'Wrap con pollo y vegetales', tag: 'Wrap'),
    Product(id: uuid.v4(), name: 'Arepa Rellena', price: 14000, description: 'Arepa rellena de queso y carne', tag: 'Arepa'),
    Product(id: uuid.v4(), name: 'Panqueques', price: 12000, description: 'Panqueques con miel', tag: 'Panqueques'),
    Product(id: uuid.v4(), name: 'Empanadas', price: 10000, description: 'Empanadas de carne y papa', tag: 'Empanadas'),
    Product(id: uuid.v4(), name: 'Churrasco', price: 28000, description: 'Churrasco con papas y ensalada', tag: 'Churrasco'),
    Product(id: uuid.v4(), name: 'Torta de Chocolate', price: 15000, description: 'Torta de chocolate con relleno', tag: 'Torta'),
    Product(id: uuid.v4(), name: 'Helado', price: 8000, description: 'Helado de vainilla y chocolate', tag: 'Helado'),
  ];

  List<String> filterTags = ['Hamburguesa', 'Pizza', 'Hot Dog', 'Sándwich', 'Ensalada', 'Burrito', 'Sushi', 'Pollo', 'Pasta'];


}