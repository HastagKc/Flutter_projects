class ImageModel {
  String imageUrl;
  String imageName;
  String imageDis;

  ImageModel({
    required this.imageUrl,
    required this.imageName,
    required this.imageDis,
  });
}

List<ImageModel> images = [
  ImageModel(
    imageUrl: 'https://media.nomadicmatt.com/2022/thailandguide.jpeg',
    imageName: 'Thailand',
    imageDis:
        'Thailand is where it all began for me so it holds a special place in my heart. It is where I decided to quit my job and travel the world. I lived there. I loved there. Thailand is incredible.',
  ),
  ImageModel(
    imageUrl: 'https://media.nomadicmatt.com/2022/centralamericabudget.jpeg',
    imageName: 'Central America',
    imageDis:
        'Want to roam ancient ruins, trek through the jungle, surf, and eat delicious food with few tourists around? Visit the smaller countries in Central America — think El Salvador, Honduras, Nicaragua, and Guatemala. Here you will find most budget hotels for around \$15-30 USD per night, meals for under \$5 USD, most bus journeys for the same price, and beer for as little as a dollar.',
  ),
  ImageModel(
    imageUrl: 'https://media.nomadicmatt.com/2022/cheaptravelnew2.jpeg',
    imageName: 'Cambodia',
    imageDis:
        'While you could put all of Southeast Asia on this list, Cambodia is one of my favorite countries in the region — it’\s affordable and beautiful, and the locals are incredibly hospitable. You can get a private, air-conditioned room for \$25 USD, street food for \$2-5 USD, and transportation across the entire country for \$20-25 USD. If you are spending close to \$50 USD per day, you are living large.',
  ),
  ImageModel(
    imageUrl: 'https://media.nomadicmatt.com/2021/albanianew4.jpg',
    imageName: 'The Balkans',
    imageDis:
        'Located in southeastern Europe, the Balkans is the cheapest region in Europe. Composed of a handful of countries — most of which see very few tourists — it’\s an off-the-radar region that’\s super affordable while also offering incredible value. While places like Dubrovnik have seen an influx of tourists (thanks to the cruise ships that dock there), the majority of the region is ripe for adventurous travel. There’\s cheap wine, incredible hiking and nature, stunning coasts, hearty food, and wild nightlife. It’\s Europe’s best-kept secret.',
  ),
];
