import 'package:intl/intl.dart';

class Config {
  // sediakan variable penampung alamat url web services
  static String urlAPI = "https://syntop.poltekbangplg.ac.id/api";

  // sediakan variable penampung alamat url main websites (digunakan untuk ambil path file/gambar dr backend)
  static String urlMain = "https://syntop.poltekbangplg.ac.id/";

  // variable endpoint yang akan dipakai

  // login,register, logiut
  String urlLogin = "$urlAPI/login";
  String urlRegister = "$urlAPI/register";
  String urlLogout = "$urlAPI/logiut";

  // product (burger)
  String urlProductRekomen = "$urlAPI/product-rekomendasi";
  String urlProductAll = "$urlAPI/product-list";
  String urlProductNew = "$urlAPI/product-new";
  String urlProductSearch = "$urlAPI/product-search";

  // keranjang
  String urlKeranjangPost = "$urlAPI/keranjang-post";
  String urlKeranjangList = "$urlAPI/keranjang-list?user_id=s";
  String urlKeranjangDelete = "$urlAPI/keranjang-delete";

  // checkout
  String urlCheckoutPost = "$urlAPI/checkout-post";
  String urlCheckoutPostById = "$urlAPI/checkout-post-id";
  String urlCheckoutListBaru = "$urlAPI/checkout-list-baru?user_id=";
  String urlCheckoutListProses = "$urlAPI/checkout-list-proses?user_id=";
  String urlCheckoutListSelesai = "$urlAPI/checkout-list-selesai?user_id=";

  // upload bukti bayar
  String uploadBuktiBayar = "$urlAPI/upload-bukti-bayar";

  // membuat fungsi currency
  static String convertToIDR(dynamic nominal, int decimalDigits) {
    NumberFormat currencyFormater = NumberFormat.currency(
        locale: 'id', symbol: 'IDR', decimalDigits: decimalDigits);

    return currencyFormater.format(nominal);
  }
}
