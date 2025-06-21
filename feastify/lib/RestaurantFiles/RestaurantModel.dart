class MenuItem{
  MenuItem({required this.itemName,required this.price,required this.imageName,required this.vegnon});
  final String itemName;
  final double price;
  final String imageName;
  final bool vegnon;
}
// TRUE for veg FALSE for nonveg
class Restaurant{
  Restaurant({required this.resName,required this.resImage,required this.resQuotes,required this.menu});
  final String resName;
  final String resImage;
  final String resQuotes;
  final List<MenuItem> menu;
}