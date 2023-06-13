class ImageModel {
  final String imageId;
  final String imageName;
  final String imageUrl;
  final String imageDes;
  final String category;
  final String price;
  final String rating;

  ImageModel({
    required this.imageId,
    required this.imageName,
    required this.imageUrl,
    required this.imageDes,
    required this.category,
    required this.price,
    required this.rating,
  });
}

List<ImageModel> imagesList = [
  ImageModel(
    imageId: '1',
    imageName: 'Nike',
    imageUrl:
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
    imageDes: 'Nike Air VaporMax',
    category: 'Men Shoes',
    price: '\$150',
    rating: '⭐⭐⭐⭐⭐',
  ),
  ImageModel(
    imageId: '2',
    imageName: 'Nike',
    imageUrl:
        'https://images.unsplash.com/photo-1549298916-b41d501d3772?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8c2hvZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
    imageDes: 'Nike Air VaporMax',
    category: 'Men Shoes',
    price: '\$250',
    rating: '⭐⭐⭐⭐⭐',
  ),
  ImageModel(
    imageId: '3',
    imageName: 'Nike',
    imageUrl:
        'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8c2hvZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
    imageDes: 'Nike Air VaporMax',
    category: 'Men Shoes',
    price: '\$150',
    rating: '⭐⭐⭐⭐⭐',
  ),
  ImageModel(
    imageId: '4',
    imageName: 'Nike',
    imageUrl:
        'https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHNob2VzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
    imageDes: 'Nike Air VaporMax',
    category: 'Men Shoes',
    price: '\$250',
    rating: '⭐⭐⭐⭐⭐',
  ),
  ImageModel(
    imageId: '5',
    imageName: 'Nike',
    imageUrl:
        'https://images.unsplash.com/flagged/photo-1556637640-2c80d3201be8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fHNob2VzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
    imageDes: 'Nike Air VaporMax',
    category: 'Men Shoes',
    price: '\$120',
    rating: '⭐⭐⭐⭐⭐',
  ),
  ImageModel(
    imageId: '6',
    imageName: 'Nike',
    imageUrl:
        'https://images.unsplash.com/photo-1603808033192-082d6919d3e1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHNob2VzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
    imageDes: 'Nike Air VaporMax',
    category: 'Men Shoes',
    price: '\$270',
    rating: '⭐⭐⭐⭐⭐',
  ),
  ImageModel(
    imageId: '7',
    imageName: 'Nike',
    imageUrl:
        'https://images.unsplash.com/photo-1551107696-a4b0c5a0d9a2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjl8fHNob2VzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
    imageDes: 'Nike Air VaporMax',
    category: 'Men Shoes',
    price: '\$650',
    rating: '⭐⭐⭐⭐⭐',
  ),
];
