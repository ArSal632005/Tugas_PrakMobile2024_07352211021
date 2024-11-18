class User {
  String name;
  int age;
  late List<Product> products;
  Role? role;

  User(this.name, this.age, this.role) {
    products = [];
  }
}

class Product {
  String productName;
  double price;
  bool inStock;

  Product(this.productName, this.price, this.inStock);
}

enum Role { Admin, Customer }

class AdminUser extends User {
  AdminUser(String name, int age) : super(name, age, Role.Admin);

  void tambahProduk(Product product) {
    print('\n' + '=' * 40);
    print('        INFO LAPORAN TAMBAH PRODUK');
    print('=' * 40);

    if (!product.inStock) {
      print('${product.productName} tidak dapat ditambahkan karena tidak tersedia.');
      return;
    }

    bool sudahAda = products.any((p) => p.productName == product.productName);
    if (sudahAda) {
      print('${product.productName} sudah ada dalam daftar produk.');
    } else {
      products.add(product);
      print('${product.productName} berhasil ditambahkan ke daftar produk.');
    }
  }

  void hapusProduk(Product product) {
    print('\n' + '=' * 40);
    print('        INFO LAPORAN HAPUS PRODUK');
    print('=' * 40);

    if (products.any((p) => p.productName == product.productName)) {
      products.removeWhere((p) => p.productName == product.productName);
      print('${product.productName} berhasil dihapus dari daftar produk.');
    } else {
      print('${product.productName} tidak ditemukan di daftar produk.');
    }
  }
}

class CustomerUser extends User {
  CustomerUser(String name, int age) : super(name, age, Role.Customer);

  void lihatProduk() {
    print('\n' + '=' * 40);
    print('            Daftar Produk');
    print('=' * 40);

    if (products.isEmpty) {
      print('Tidak ada produk yang tersedia saat ini.');
    } else {
      for (var product in products) {
        print('${product.productName} - Rp${product.price} - ${product.inStock ? "Tersedia" : "Habis"}');
      }
    }
  }
}

Future<void> fetchProductDetails() async {
  print('\n' + '=' * 40);
  print('     Sedang mengambil data produk...');
  print('=' * 40);
  await Future.delayed(Duration(milliseconds: 1500)); // Penundaan yang lebih singkat
  print('Data produk berhasil diperbarui.');
}

Future<void> main() async {
  AdminUser admin = AdminUser('Ardi', 20);
  CustomerUser customer = CustomerUser('Salman', 25);

  Product product1 = Product('Buku', 20000.0, false);
  Product product2 = Product('Pensil', 7000.0, true);
  Product product3 = Product('Binder', 19000.0, true);

  try {
    admin.tambahProduk(product1);
    admin.tambahProduk(product2);
    admin.hapusProduk(product1);
    admin.tambahProduk(product3);
  } catch (e) {
    print('Terjadi kesalahan: $e');
  }

  customer.products = List.from(admin.products); // Salin produk dari admin ke customer
  customer.lihatProduk();

  // Pengambilan data produk secara asinkron
  await fetchProductDetails();

  // Koleksi - Menggunakan Map dan Set
  print('\n' + '=' * 40);
  print('         Daftar Produk dari Map');
  print('=' * 40);
  Map<String, Product> productMap = {
    for (var product in [product1, product2, product3]) product.productName: product
  };

  productMap.forEach((key, value) {
    print('$key - Harga: Rp${value.price} - Stok: ${value.inStock ? "Tersedia" : "Habis"}');
  });

  print('\n' + '=' * 40);
  print('         Daftar Produk dari Set');
  print('=' * 40);
  Set<Product> productSet = {product1, product2, product3};
  productSet.forEach((product) {
    print('${product.productName} - Harga: Rp${product.price} - Stok: ${product.inStock ? "Tersedia" : "Habis"}');
  });
}
