import 'RestaurantModel.dart';
import 'RestaurantPage.dart';
class RestaurantData{
  static List<Restaurant> restaurant=[
    Restaurant(
      resName: "TGI Grand",
      resImage: "images/hotelImagesFolder/hotel1.webp",
      resQuotes: "20% offers on all products",
      menu: [
        MenuItem(itemName: 'Burger', price: 150, imageName: "images/IndividualHotel/TGI/ITCburger.jpg", vegnon: true),
        MenuItem(itemName: 'Pizza', price: 163, imageName: 'images/IndividualHotel/TGI/ITCfries.jpg', vegnon: true),
        MenuItem(itemName: 'Pasta', price: 120, imageName: "images/IndividualHotel/TGI/ITCpasta.jpg", vegnon: true),
        MenuItem(itemName: 'Salad', price: 220, imageName: "images/IndividualHotel/TGI/ITCsalad.jpg", vegnon: true),
        MenuItem(itemName: 'Sushi', price: 260, imageName: "images/IndividualHotel/TGI/ITCsushi.jpg", vegnon: false),
        MenuItem(itemName: 'Tacos', price: 130, imageName: "images/IndividualHotel/TGI/ITCtacos.jpg", vegnon: true),
        MenuItem(itemName: 'Steak', price: 335, imageName: "images/IndividualHotel/TGI/ITCsteak.jpg", vegnon: false),
        MenuItem(itemName: 'Ice Cream', price: 70, imageName: "images/IndividualHotel/TGI/ITCicecream.jpg", vegnon: true),
        MenuItem(itemName: 'Fries', price: 110, imageName: "images/IndividualHotel/TGI/ITCfries.jpg", vegnon: true),
        MenuItem(itemName: 'Soup', price: 90, imageName: "images/IndividualHotel/TGI/ITCsoup.jpg", vegnon: true),
      ],
    ),
    Restaurant(
      resName: "The Oberoi",
      resImage: "images/hotelImagesFolder/hotel2.webp",
      resQuotes: "Eat well, laugh often, love much.",
      menu: [
        MenuItem(itemName: 'Butter Chicken', price: 250.0, imageName: 'images/IndividualHotel/OBE/Obebutterchicken.jpg', vegnon: false),
        MenuItem(itemName: 'Paneer Tikka', price: 220.0, imageName: 'images/IndividualHotel/OBE/Obepannertikka.jpg', vegnon: true),
        MenuItem(itemName: 'Biryani', price: 280.0, imageName: 'images/IndividualHotel/OBE/Obebriyani.jpg', vegnon: false),
        MenuItem(itemName: 'Masala Dosa', price: 150.0, imageName: 'images/IndividualHotel/OBE/Obemasala.jpg', vegnon: true),
        MenuItem(itemName: 'Chole Bhature', price: 180.0, imageName: 'images/IndividualHotel/OBE/Obechole.jpg', vegnon: true),
        MenuItem(itemName: 'Pav Bhaji', price: 160.0, imageName: 'images/IndividualHotel/OBE/Obepav.jpg', vegnon: true),
        MenuItem(itemName: 'Aloo Paratha', price: 130.0, imageName: 'images/IndividualHotel/OBE/Obealoo.jpg', vegnon: true),
        MenuItem(itemName: 'Samosa Plate', price: 100.0, imageName: 'images/IndividualHotel/OBE/Obesamosa.jpg', vegnon: true),
        MenuItem(itemName: 'Vada Pav', price: 110.0, imageName: 'images/IndividualHotel/OBE/Obevada.jpg', vegnon: true),
        MenuItem(itemName: 'Rajma Chawal', price: 200.0, imageName: 'images/IndividualHotel/OBE/Oberajma.jpg', vegnon: true),
        MenuItem(itemName: 'Dal Makhani', price: 240.0, imageName: 'images/IndividualHotel/OBE/Obedal.jpg', vegnon: true),
        MenuItem(itemName: 'Tandoori Roti', price: 120.0, imageName: 'images/IndividualHotel/OBE/Obetandoori.jpg', vegnon: true),
        MenuItem(itemName: 'Rasgulla', price: 140.0, imageName:'images/IndividualHotel/OBE/Oberasagulla.jpg', vegnon: true),
      ],
    ),
    Restaurant(
      resName: "Taj Palace",
      resImage: "images/hotelImagesFolder/hotel3.jpg",
      resQuotes: "Experience taste with Taj",
      menu: [
        MenuItem(itemName: 'Biryani', price: 260.0, imageName: 'images/IndividualHotel/TajPalace/briyani.jpg', vegnon: false),
        MenuItem(itemName: 'Pav Bhaji', price: 140.0, imageName: 'images/IndividualHotel/TajPalace/paav.jpg', vegnon: true),
        MenuItem(itemName: 'Dal Makhani', price: 230.0, imageName: 'images/IndividualHotel/TajPalace/daal.jpg', vegnon: true),
        MenuItem(itemName: 'Masala Dosa', price: 170.0, imageName: 'images/IndividualHotel/TajPalace/masala.jpg', vegnon: true),
        MenuItem(itemName: 'Aloo Paratha', price: 120.0, imageName: 'images/IndividualHotel/TajPalace/aloo.jpg', vegnon: true),
        MenuItem(itemName: 'Butter Chicken', price: 280.0, imageName: 'images/IndividualHotel/TajPalace/butterchicken.jpg', vegnon: false),
        MenuItem(itemName: 'Tandoori Roti', price: 130.0, imageName: 'images/IndividualHotel/TajPalace/tandoori.jpg', vegnon: true),
        MenuItem(itemName: 'Paneer Tikka', price: 200.0, imageName: 'images/IndividualHotel/TajPalace/pannertikka.jpg', vegnon: true),
        MenuItem(itemName: 'Rajma Chawal', price: 190.0, imageName: 'images/IndividualHotel/TajPalace/rajma.jpg', vegnon: true),
        MenuItem(itemName: 'Samosa Plate', price: 110.0, imageName: 'images/IndividualHotel/TajPalace/samosa.jpg', vegnon: true),
        MenuItem(itemName: 'Chole Bhature', price: 210.0, imageName: 'images/IndividualHotel/TajPalace/chole.jpg', vegnon: true),
        MenuItem(itemName: 'Vada Pav', price: 100.0, imageName: 'images/IndividualHotel/TajPalace/vada.jpg', vegnon: true),
        MenuItem(itemName: 'Rasgulla', price: 150.0, imageName: 'images/IndividualHotel/TajPalace/rasagulla.jpg', vegnon: true),

      ],
    ),
    Restaurant(
      resName: "Le Meridien",
      resImage: "images/hotelImagesFolder/hotel4.jpg",
      resQuotes: "Exclusive deals on weekend orders",
      menu: [
        MenuItem(itemName: 'Rajma Chawal', price: 250.0, imageName: 'images/IndividualHotel/LE/rajma.jpg', vegnon: true),
        MenuItem(itemName: 'Masala Dosa', price: 380.0, imageName: 'images/IndividualHotel/LE/masala.jpg', vegnon: true),
        MenuItem(itemName: 'Aloo Paratha', price: 220.0, imageName: 'images/IndividualHotel/LE/aloo.jpg', vegnon: true),
        MenuItem(itemName: 'Rasgulla', price: 230.0, imageName: 'images/IndividualHotel/LE/rasagulla.jpg', vegnon: true),
        MenuItem(itemName: 'Butter Chicken', price: 450.0, imageName: 'images/IndividualHotel/LE/butterchicken.jpg', vegnon: false),
        MenuItem(itemName: 'Tandoori Roti', price: 300.0, imageName: 'images/IndividualHotel/LE/tandoori.jpg', vegnon: true),
        MenuItem(itemName: 'Vada Pav', price: 210.0, imageName: 'images/IndividualHotel/LE/vada.jpg', vegnon: true),
        MenuItem(itemName: 'Samosa Plate', price: 260.0, imageName: 'images/IndividualHotel/LE/samosa.jpg', vegnon: true),
        MenuItem(itemName: 'Dal Makhani', price: 280.0, imageName: 'images/IndividualHotel/LE/daal.jpg', vegnon: true),
        MenuItem(itemName: 'Chole Bhature', price: 320.0, imageName: 'images/IndividualHotel/LE/chole.jpg', vegnon: true),
        MenuItem(itemName: 'Pav Bhaji', price: 210.0, imageName: 'images/IndividualHotel/LE/paav.jpg', vegnon: true),
        MenuItem(itemName: 'Biryani', price: 450.0, imageName: 'images/IndividualHotel/LE/briyani.jpg', vegnon: false),
        MenuItem(itemName: 'Pani Puri', price: 220.0, imageName: 'images/IndividualHotel/LE/pani.jpg', vegnon: true),
        MenuItem(itemName: 'Lassi', price: 300.0, imageName: 'images/IndividualHotel/LE/lassi.jpg', vegnon: true),

      ],
    ),
    Restaurant(
      resName: "Radisson Blu",
      resImage: "images/hotelImagesFolder/hotel5.jpg",
      resQuotes: "Enjoy a 15% discount on dining",
      menu: [
        MenuItem(itemName: 'Burger', price: 8.8, imageName: 'imageName1-ishere', vegnon: false),
        MenuItem(itemName: 'Pizza', price: 9.8, imageName: 'imageName2---ishere', vegnon: true),
      ],
    ),
    Restaurant(
      resName: "ITC Grand Chola",
      resImage: "images/hotelImagesFolder/hotel6.jpg",
      resQuotes: "World-class hospitality",
      menu: [
        MenuItem(itemName: 'Burger', price: 8.8, imageName: 'imageName1-ishere', vegnon: false),
        MenuItem(itemName: 'Pizza', price: 9.8, imageName: 'imageName2---ishere', vegnon: true),
      ],
    ),
    Restaurant(
      resName: "Hyatt Regency",
      resImage: "images/hotelImagesFolder/hotel7.jpg",
      resQuotes: "Best family-friendly hotel",
      menu: [
        MenuItem(itemName: 'Burger', price: 8.8, imageName: 'imageName1-ishere', vegnon: false),
        MenuItem(itemName: 'Pizza', price: 9.8, imageName: 'imageName2---ishere', vegnon: true),
      ],
    ),
    Restaurant(
      resName: "Marriott",
      resImage: "images/hotelImagesFolder/hotel8.webp",
      resQuotes: "Enjoy a 10% cashback on bookings",
      menu: [
        MenuItem(itemName: 'Burger', price: 8.8, imageName: 'imageName1-ishere', vegnon: false),
        MenuItem(itemName: 'Pizza', price: 9.8, imageName: 'imageName2---ishere', vegnon: true),
      ],
    ),
    Restaurant(
      resName: "The Lalit",
      resImage: "images/hotelImagesFolder/hotel9.jpg",
      resQuotes: "Special offers for honeymoon couples",
      menu: [
        MenuItem(itemName: 'Burger', price: 8.8, imageName: 'imageName1-ishere', vegnon: false),
        MenuItem(itemName: 'Pizza', price: 9.8, imageName: 'imageName2---ishere', vegnon: true),
      ],
    ),
    Restaurant(
      resName: "Sheraton Grand",
      resImage: "images/hotelImagesFolder/hotel10.jpg",
      resQuotes: "Stay 3 nights, pay for 2",
      menu: [
        MenuItem(itemName: 'Burger', price: 8.8, imageName: 'imageName1-ishere', vegnon: false),
        MenuItem(itemName: 'Pizza', price: 9.8, imageName: 'imageName2---ishere', vegnon: true),
      ],
    ),
    Restaurant(
      resName: "Holiday Inn",
      resImage: "images/hotelImagesFolder/hotel11.jpg",
      resQuotes: "Kids stay and eat free",
      menu: [
        MenuItem(itemName: 'Burger', price: 8.8, imageName: 'imageName1-ishere', vegnon: false),
        MenuItem(itemName: 'Pizza', price: 9.8, imageName: 'imageName2---ishere', vegnon: true),
      ],
    ),
    Restaurant(
      resName: "Park Hyatt",
      resImage: "images/hotelImagesFolder/hotel12.jpg",
      resQuotes: "Book early and save 25%",
      menu: [
        MenuItem(itemName: 'Burger', price: 8.8, imageName: 'imageName1-ishere', vegnon: false),
        MenuItem(itemName: 'Pizza', price: 9.8, imageName: 'imageName2---ishere', vegnon: true),
      ],
    ),
    Restaurant(
      resName: "JW Marriott",
      resImage: "images/hotelImagesFolder/hotel13.jpg",
      resQuotes: "Complimentary spa for premium suites",
      menu: [
        MenuItem(itemName: 'Burger', price: 8.8, imageName: 'imageName1-ishere', vegnon: false),
        MenuItem(itemName: 'Pizza', price: 9.8, imageName: 'imageName2---ishere', vegnon: true),
      ],
    ),
    Restaurant(
      resName: "Novotel",
      resImage: "images/hotelImagesFolder/hotel14.jpg",
      resQuotes: "Business class comfort at its best",
      menu: [
        MenuItem(itemName: 'Burger', price: 8.8, imageName: 'imageName1-ishere', vegnon: false),
        MenuItem(itemName: 'Pizza', price: 9.8, imageName: 'imageName2---ishere', vegnon: true),
      ],
    ),
    Restaurant(
      resName: "The Westin",
      resImage: "images/hotelImagesFolder/hotel15.jpg",
      resQuotes: "Weekend getaway packages available",
      menu: [
        MenuItem(itemName: 'Burger', price: 8.8, imageName: 'imageName1-ishere', vegnon: false),
        MenuItem(itemName: 'Pizza', price: 9.8, imageName: 'imageName2---ishere', vegnon: true),
      ],
    ),
  ];

}