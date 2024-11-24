import 'package:flutter/material.dart';

void main() {
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
      routes: <String, WidgetBuilder>{
        '/HomeScreen' : (BuildContext context) => new HomeScreen(),
        '/Satu' : (BuildContext context) => new Satu()
      },
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text("E-Commerce"),
        centerTitle: true,
        actions: [
          // Notification Icon outside the container
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Aksi untuk notifikasi
            },
          ),
          
          // Container only wrapping the shopping cart icon
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 222, 213, 213),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color.fromARGB(255, 5, 3, 3), // Border color
                width: 1.0,
              ),
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.black),
              onPressed: () {
                Navigator.pushNamed(context, '/Satu');
                // Aksi untuk keranjang belanja
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBar(),
            const DealSection(),
            SectionTitle(title: "Top Rated Freelancers", onViewAll: () {}),
            FreelancerList(),
            SectionTitle(title: "Top Services", onViewAll: () {}),
            const ServiceList(),
            // Tambahkan komponen BestBookingSection di sini
            SectionTitle(title: "Best Booking", onViewAll: () {}),
            const BestBooking(),
            const BestBooking2(),
            SectionTitle(title: "Recommended Workshops", onViewAll: () {}),
            RecommendedWorkshopsPage(),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search here",
                prefixIcon: const Icon(Icons.search, size: 20, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 40, // Adjust width as needed
            height: 40, // Adjust height as needed
            decoration: BoxDecoration(

              color: Colors.white, // Change color as needed
              borderRadius: BorderRadius.circular(8),
             // Adjust border radius for rounded corners
              border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 1), // Black border with width 2
            ),
          ),
        ],
      ),
    );
  }
}

class DealSection extends StatelessWidget {
  const DealSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        gradient: const LinearGradient(
          colors: [Color(0xFFE0EAFC), Color(0xFFCFDEF3)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hanya Hari Ini",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "50% OFF",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Dapatkan diskon spesial sebesar 50% dengan cara belanja sekarang.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text("BUY IT NOW", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/haya.jpg",
              width: 100,
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onViewAll;

  const SectionTitle({super.key, required this.title, required this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 36, 113, 202), // starting red color
                Color.fromARGB(255, 255, 123, 72), // ending gradient color
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: onViewAll,
          child: const Text(
            "View All",
            style: TextStyle(color: Color.fromARGB(255, 64, 131, 186)),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}


class FreelancerCard extends StatelessWidget {
  final String name;
  final String profession;
  final double rating;
  final String assetImage;

  const FreelancerCard({
    super.key,
    required this.name,
    required this.profession,
    required this.rating,
    required this.assetImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(assetImage),
            radius: 30,
          ),
          const SizedBox(height: 5),
          Text(name, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          Text(profession, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: Color.fromARGB(255, 143, 7, 255), size: 16),
              Text(rating.toString(), style: const TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

class FreelancerList extends StatelessWidget {
  final List<Map<String, dynamic>> freelancers = [
    {
      "name": "BrlTzy",
      "profession": "Asassin",
      "rating": 4.9,
      "image": "assets/images/haya.jpg"
    },
    {
      "name": "BrlTzy",
      "profession": "Asassin",
      "rating": 4.9,
      "image": "assets/images/haya.jpg"
    },
    {
      "name": "BarlTzy",
      "profession": "Asassin",
      "rating": 4.9,
      "image": "assets/images/haya.jpg"
    },
    {
      "name": "Wade Warren",
      "profession": "Beautician",
      "rating": 4.9,
      "image": "assets/images/haya.jpg"
    },
  ];

  FreelancerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: freelancers.length,
        itemBuilder: (context, index) {
          final freelancer = freelancers[index];
          return FreelancerCard(
            name: freelancer["name"],
            profession: freelancer["profession"],
            rating: freelancer["rating"],
            assetImage: freelancer["image"],
          );
        },
      ),
    );
  }
}
// top service class
class ServiceList extends StatelessWidget {
  const ServiceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10, ),
        ServiceCard(
          imageUrl: 'assets/images/haya.jpg',
          name: 'Miss Zachary Will',
          role: 'Beautician',
          description: 'Doloribus saepe aut necessitatibus qui.',
          rating: 4.9,
        ),
        ServiceCard(
          imageUrl: 'assets/images/haya.jpg',
          name: 'Miss Zachary Will',
          role: 'Beautician',
          description: 'Doloribus saepe aut necessitatibus qui.',
          rating: 4.9,
        ),
        ServiceCard(
          imageUrl: 'assets/images/haya.jpg',
          name: 'Miss Zachary Will',
          role: 'Beautician',
          description: 'Doloribus saepe aut necessitatibus qui.',
          rating: 4.9,
        ),
      ],
    );
  }
}
// class servicecard
class ServiceCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String role;
  final String description;
  final double rating;

  const ServiceCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.role,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Layer bawah: gambar besar
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imageUrl,
              width:220,
              height: 220,
              fit: BoxFit.fill,
            ),
          ),
          // Layer atas: card informasi
          Positioned(
            left: 90,
            bottom: 10, // untuk membuat card informasi terlihat menumpuk
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(imageUrl),
                    radius: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          role,
                          style: const TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Color.fromARGB(255, 111, 106, 244), size: 20),
                            const SizedBox(width: 4),
                            Text(
                              rating.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 119, 132, 232),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Book Now",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
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
//best booking class
class BestBooking extends StatelessWidget {
  const BestBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        gradient: const LinearGradient(
          colors: [Color(0xFFE0EAFC), Color(0xFFCFDEF3)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Deall Of The Day",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Flat 60% OFF",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Dapatkan diskon spesial sebesar 60% dengan cara belanja sekarang. ",
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  "06 : 34 : 15",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text("Shop Now", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/haya.jpg",
              width: 100,
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
//bestbooking2
class BestBooking2 extends StatelessWidget {
  const BestBooking2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          BestBookingCard(
            imageUrl: 'assets/images/haya.jpg',
            profileUrl: 'assets/images/haya.jpg',
            name: 'Miss Zachary Will',
            role: 'Beautician',
            description: 'Occaecati aut nam beatae quo non deserunt consequatur.',
            rating: 4.9,
          ),
          SizedBox(height: 16.0),
          BestBookingCard(
            imageUrl: 'assets/images/haya.jpg',
            profileUrl: 'assets/images/haya.jpg',
            name: 'Miss Zachary Will',
            role: 'Beautician',
            description: 'Occaecati aut nam beatae quo non deserunt consequatur.',
            rating: 4.9,
          ),
        ],
      );
  }
}

class BestBookingCard extends StatelessWidget {
  final String imageUrl;
  final String profileUrl;
  final String name;
  final String role;
  final String description;
  final double rating;

  const BestBookingCard
  ({super.key, 
    required this.imageUrl,
    required this.profileUrl,
    required this.name,
    required this.role,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(profileUrl),
                  radius: 24,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        role,
                        style: TextStyle(
                          fontSize: 14,
                          color: const Color.fromARGB(255, 57, 106, 220),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: const Color.fromARGB(255, 56, 104, 216), size: 16),
                      SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: TextStyle(
                          color: const Color.fromARGB(255, 30, 30, 238),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class Recomended Workshop
class RecommendedWorkshopsPage extends StatelessWidget {
  const RecommendedWorkshopsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Recommended Workshops",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Wrap(
          spacing: 16, // Jarak horizontal antar item
          runSpacing: 16, // Jarak vertikal antar item
          children: List.generate(
            4, // Jumlah item yang ingin ditampilkan
            (index) => SizedBox(
              width: MediaQuery.of(context).size.width / 2 - 24, // Lebar setiap kartu
              child: buildWorkshopCard(context),
            ),
          ),
        ),
      ],
    );
  }

  /// Fungsi untuk membuat kartu workshop
  Widget buildWorkshopCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  'assets/images/haya.jpg', // Ganti dengan path gambar Anda
                  height: 230,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(128, 255, 255, 255),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star,
                          color: const Color.fromARGB(255, 75, 88, 232),
                          size: 16),
                      SizedBox(width: 4),
                      Text(
                        "4.9",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Miss Zachary Will",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Beautician",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 49, 111, 235),
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Occaecati aut nam beatae quo non deserunt consequat.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 73, 81, 250),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Book Workshop",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class Satu extends StatefulWidget {
  @override
  _SatuState createState() => _SatuState();
}

class _SatuState extends State<Satu> {
  // Daftar item di keranjang
  List<CartItem> cartItems = [
    CartItem(
        gambar: "assets/images/haya.jpg",
        judul: "halo",
        deskripsi: "auto ta putar",
        harga: 40,
        jumlah: 0),
    CartItem(
        gambar: "assets/images/haya.jpg",
        judul: "hei",
        deskripsi: "murah",
        harga: 333,
        jumlah: 0),
    CartItem(
        gambar: "assets/images/haya.jpg",
        judul: "bro",
        deskripsi: "murah",
        harga: 50,
        jumlah: 0),
  ];

  // Menghitung subtotal dari harga dan jumlah item
  double getSubtotal() {
    double subtotal = 0;
    for (var item in cartItems) {
      subtotal += item.harga * item.jumlah;
    }
    return subtotal;
  }

  // Menghitung diskon
  double getDiscount() {
    double subtotal = getSubtotal();
    return subtotal > 100 ? 10 : 0; // 10% discount for orders above $100
  }

  // Menghitung total setelah diskon dan biaya pengiriman
  double getTotal() {
    return getSubtotal() - getDiscount() + 5; // Adding delivery charges
  }

  // Fungsi untuk memperbarui jumlah item
  void updateItemQuantity(int index, int quantity) {
    setState(() {
      cartItems[index].jumlah = quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 20.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.1),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pushNamed(context, '/HomeScreen');
                },
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Center(
              child: Text(
                "Keranjang",
                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0, top: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.1),
                ),
                child: IconButton(
                  icon: Icon(Icons.more_vert, color: Colors.black),
                  onPressed: () {},
                ),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Menampilkan item keranjang
            Column(
              children: cartItems.map((item) {
                int index = cartItems.indexOf(item); // Mendapatkan index item
                return ListItem(
                  item: item,
                  onQuantityChanged: (quantity) {
                    updateItemQuantity(
                        index, quantity); // Memperbarui jumlah item
                  },
                );
              }).toList(),
            ),
            Container(
              padding: EdgeInsets.all(15),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order Summary",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _buildCheckoutDetail(
                      "Items", cartItems.length.toString(), false),
                  _buildCheckoutDetail("Subtotal",
                      "\$${getSubtotal().toStringAsFixed(2)}", false),
                  _buildCheckoutDetail("Discount",
                      "-\$${getDiscount().toStringAsFixed(2)}", true),
                  _buildCheckoutDetail("Delivery Charges", "\$5.00", false),
                  Divider(thickness: 1, color: Colors.grey),
                  _buildCheckoutDetail(
                      "Total", "\$${getTotal().toStringAsFixed(2)}", true),
                  SizedBox(height: 20),
                  // Tombol Checkout dengan lebar 80% dari layar, digeser ke kanan
                  Align(
                    alignment: Alignment.centerRight, // Geser ke kanan
                    child: Container(
                        width: MediaQuery.of(context).size.width *
                            0.9, // Lebar tombol 80% dari layar
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Proceeding to Checkout")));
                          },
                          child: Text("Check Out"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(
                                255, 116, 3, 254), // Background color
                            foregroundColor:
                                Colors.white, // Ensure the text color is white
                            padding: EdgeInsets.symmetric(vertical: 15),
                            textStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget untuk menampilkan detail checkout
  Widget _buildCheckoutDetail(String label, String value, bool isTotal) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 16,
                color: isTotal ? Colors.black : Colors.black.withOpacity(0.6)),
          ),
          Text(
            value,
            style: TextStyle(
                fontSize: 16,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                color: isTotal ? const Color.fromARGB(255, 0, 0, 0) : Colors.black),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final String gambar;
  final String judul;
  final String deskripsi;
  final int harga;
  int jumlah;

  CartItem({
    required this.gambar,
    required this.judul,
    required this.deskripsi,
    required this.harga,
    this.jumlah = 1,
  });
}

class ListItem extends StatelessWidget {
  final CartItem item;
  final Function(int) onQuantityChanged; // Callback yang menerima jumlah baru

  ListItem({required this.item, required this.onQuantityChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 160.0,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                item.gambar,
                width: 100.0,
                height: 150.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.judul,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    item.deskripsi,
                    style: TextStyle(
                        fontSize: 14, color: Colors.black.withOpacity(0.7)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "\$ ${item.harga * item.jumlah}",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 167, 32, 200)),
                  ),
                ],
              ),
            ),
            Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Padding(
      padding: EdgeInsets.only(left: 80.0), // Geser ikon delete ke kanan
      child: IconButton(
        icon: Icon(Icons.delete, color: Colors.red),
        onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Item dihapus")));
        },
      ),
    ),
    SizedBox(height: 10), // Jarak antara ikon delete dan row
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 116, 3, 254).withOpacity(0.3),
          ),
          child: IconButton(
            icon: Icon(Icons.remove, size: 15, color: Colors.white),
            onPressed: () {
              if (item.jumlah > 0) {
                onQuantityChanged(
                    item.jumlah - 1); // Mengurangi jumlah item
              }
            },
          ),
        ),
        SizedBox(width: 10),
        Text(
          "${item.jumlah}",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 116, 3, 254).withOpacity(0.3),
          ),
          child: IconButton(
            icon: Icon(Icons.add, size: 15, color: Colors.white),
            onPressed: () {
              onQuantityChanged(
                  item.jumlah + 1); // Menambah jumlah item
            },
          ),
        ),
      ],
    ),
  ],
),

          ],
        ),
      ),
    );
  }
}

