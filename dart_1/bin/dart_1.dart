// Import library dart:async untuk menggunakan fitur asynchronous.
import 'dart:async';

// Definisi kelas Book untuk merepresentasikan sebuah buku.
class Book {
  final String title;
  final String author;
  final int pageCount;

  // Konstruktor untuk membuat objek Book dengan menginisialisasi propertinya.
  Book(this.title, this.author, this.pageCount);
}

// Kelas BookSearchService bertanggung jawab atas pencarian buku.
class BookSearch {
  // Daftar buku yang akan digunakan untuk pencarian.
  List<Book> _books = [
    Book("Create Your Own", "Nadia Firly", 189),
    Book("Pemrograman Android Dengan Flutter", "Budi Raharjo", 418),
    Book("Logika Algoritma dan Pemrograman Dasar", "Rosa A. S.", 886),
  ];

  // Metode untuk mencari buku
  Future<List<Book>> searchBooks(String search) {
    // Pencarian buku secara asynchronous dengan menunda eksekusi selama 2 detik.
    return Future.delayed(Duration(seconds: 2), () {
      // Melakukan pencarian buku berdasarkan judul atau penulis yang mengandung search.
      List<Book> results = _books
          .where((book) =>
              book.title.toLowerCase().contains(search.toLowerCase()) ||
              book.author.toLowerCase().contains(search.toLowerCase()))
          .toList();
      return results; // Mengembalikan hasil pencarian.
    });
  }
}

// Fungsi utama
void main() async {
  // Membuat instance dari kelas BookSearch untuk melakukan pencarian buku.
  final bookSearch = BookSearch();

  // search yang akan digunakan untuk mencari buku.
  final search = "Algoritma";

  // Mencetak pencarian buku.
  print("Mencari buku dengan kata kunci: $search");

  try {
    // Melakukan pencarian buku dengan search yang diberikan.
    final results = await bookSearch.searchBooks(search);

    // Jika hasil pencarian tidak kosong, mencetak informasi tentang buku-buku yang ditemukan.
    if (results.isNotEmpty) {
      print("Hasil Pencarian:");
      results.forEach((book) {
        print(
            "Judul: ${book.title}, Penulis: ${book.author}, Jumlah Halaman: ${book.pageCount}");
      });
    } else {
      // Jika tidak ada hasil pencarian, mencetak pesan bahwa tidak ada buku yang ditemukan.
      print("Tidak ditemukan buku dengan kata kunci '$search'");
    }
  } catch (e) {
    // mencetak pesan kesalahan jika terjadi kesalahan selama pencarian.
    print("Terjadi kesalahan: $e");
  }
}
