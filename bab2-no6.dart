// Enum untuk Status Pemesanan
enum StatusPemesanan { menunggu, diproses, selesai, dibatalkan }

// Abstract class untuk Pengiriman
abstract class Pengiriman {
  void kirimBuku();
}

// Mixin untuk menambah fitur Aktivitas Diskon
mixin AktivitasDiskon {
  void aplikasiDiskon(String kodeDiskon) {
    print('  - Diskon dengan kode: $kodeDiskon diterapkan pada pembelian buku.');
  }
}

// Kelas dasar Pembeli
class Pembeli {
  String nama;
  String _email;
  String alamat;
  StatusPemesanan status;

  // Constructor dengan positional argument untuk nama, email, dan alamat
  Pembeli(this.nama, this._email, this.alamat, this.status);

  // Getter dan Setter untuk Email dengan validasi format
  String get email => _email;
  set email(String value) {
    if (value.contains('@')) {
      _email = value;
    } else {
      throw Exception('Email tidak valid.');
    }
  }

  // Metode untuk memesan buku
  void pesanBuku() {
    print('\n===== Proses Pemesanan Buku =====');
    print('  - Pemesanan buku sedang diproses untuk $nama...');
    Future.delayed(Duration(seconds: 1), () {
      print('  - Pemesanan buku berhasil dilakukan oleh $nama.\n');
    });
  }

  // Metode untuk memeriksa status pemesanan
  void cekStatus() {
    String statusPemesanan = status.toString().split('.').last;
    print('===== Status Pemesanan =====');
    print('  - Pemesanan buku oleh $nama saat ini berstatus: $statusPemesanan.\n');
  }
}

// Kelas turunan PembeliAktif dengan inheritance dari Pembeli dan implementasi Pengiriman serta mixin AktivitasDiskon
class PembeliAktif extends Pembeli with AktivitasDiskon implements Pengiriman {
  String jenisBuku;
  List<Map<String, dynamic>> daftarBuku = [];
  double totalHarga = 0.0;

  // Constructor dengan inheritance dari superclass Pembeli
  PembeliAktif(String nama, String email, String alamat, StatusPemesanan status, this.jenisBuku)
      : super(nama, email, alamat, status);

  // Implementasi metode kirimBuku dari Pengiriman
  @override
  void kirimBuku() {
    String waktu = DateTime.now().toLocal().toString();
    print('===== Pengiriman Buku =====');
    print('  - Buku jenis $jenisBuku dikirim ke $alamat pada waktu: $waktu.\n');
  }

  // Metode khusus untuk melakukan pembayaran
  void lakukanPembayaran(double jumlahPembayaran) {
    print('===== Pembayaran =====');
    print('  - Pembayaran untuk buku $jenisBuku sebesar Rp$jumlahPembayaran telah diterima.\n');
  }

  // Menambah buku ke daftar pemesanan
  void tambahBuku(String judulBuku, double harga) {
    daftarBuku.add({'judul': judulBuku, 'harga': harga});
    totalHarga += harga;
    print('  - Buku "$judulBuku" ditambahkan dengan harga Rp$harga.');
  }

  // Menampilkan list hasil belanja dan total harga
  void tampilkanListBelanja() {
    print('===== Daftar Belanja =====');
    for (var buku in daftarBuku) {
      print('  - ${buku['judul']} | Harga: Rp${buku['harga']}');
    }
    print('===== Total Harga =====');
    print('  - Total belanja: Rp$totalHarga\n');
  }
}

// Fungsi utama untuk menjalankan program
void main() {
  // Membuat objek pembeli aktif
  var pembeli = PembeliAktif('Budi', 'budi@email.com', 'Jl. Merdeka No. 12', StatusPemesanan.menunggu, 'Pemrograman Dart');

  // Memanggil berbagai metode untuk menampilkan informasi
  pembeli.pesanBuku();
  pembeli.tambahBuku('Pemrograman Dart', 100000);
  pembeli.tambahBuku('Belajar Flutter', 150000);
  pembeli.tambahBuku('Flutter untuk Pemula', 120000);
  pembeli.cekStatus();
  pembeli.aplikasiDiskon('DISKON20');
  pembeli.lakukanPembayaran(370000);
  pembeli.kirimBuku();
  pembeli.tampilkanListBelanja(); // Menampilkan daftar belanja
}
