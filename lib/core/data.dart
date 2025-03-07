import 'package:shoes_app/core/shoes_model.dart';

final List<ShoesModel> sampleShoeList = [
  ShoesModel(
    id: "1",
    name: "Nike Jordan",
    brand: "Nike",
    category: "Best Seller",
    price: 493.00,
    imageUrl:
        "assets/images/1.png", // Replace with actual image URL or asset path later
    offer: null,
    gender: "Men",
    availableSizes: ["UK 4.4", "US 5.5", "UK 6.5", "EU 11.5"],
    inStock: true,
  ),
  ShoesModel(
    id: "2",
    name: "Nike Air Max",
    brand: "Nike",
    category: "Best Seller",
    price: 897.99,
    imageUrl:
        "assets/images/2.png", // Replace with actual image URL or asset path later
    offer: null,
    gender: "Unisex",
    availableSizes: ["US 5.5", "UK 6.5", "EU 11.5"],
    inStock: true,
  ),
  // New Arrivals
  ShoesModel(
    id: "3",
    name: "Nike Air Jordan",
    brand: "Nike",
    category: "Best Choice",
    price: 849.69,
    imageUrl:
        "assets/images/3.png", // Replace with actual image URL or asset path later
    offer: "Grab the best offer in this 30%",
    gender: "Women",
    availableSizes: ["UK 4.4", "US 5.5", "UK 6.5"],
    inStock: true,
  ),
  // Additional Samples for Variety
  ShoesModel(
    id: "4",
    name: "Adidas Ultraboost",
    brand: "Adidas",
    category: "Best Seller",
    price: 179.99,
    imageUrl:
        "assets/images/4.png", // Replace with actual image URL or asset path later
    offer: null,
    gender: "Men",
    availableSizes: ["UK 5.0", "US 6.0", "EU 38"],
    inStock: true,
  ),
  ShoesModel(
    id: "5",
    name: "Puma RS-X",
    brand: "Puma",
    category: "Best Choice",
    price: 129.50,
    imageUrl:
        "assets/images/7.png", // Replace with actual image URL or asset path later
    offer: "Grab the best offer in this 20%",
    gender: "Unisex",
    availableSizes: ["UK 4.0", "US 5.0", "EU 37"],
    inStock: false, // Out of stock example
  ),
  ShoesModel(
    id: "6",
    name: "Converse All Star",
    brand: "Converse",
    category: "Best Seller",
    price: 89.99,
    imageUrl:
        "assets/images/6.png", // Replace with actual image URL or asset path later
    offer: null,
    gender: "Women",
    availableSizes: ["UK 6.0", "US 7.0", "EU 39"],
    inStock: true,
  ),
];
