import 'package:buburger/models/Product_model.dart';
import 'package:buburger/services/Product_services.dart';
import 'package:buburger/themes/themes.dart';
import 'package:buburger/widgets/productWidget.dart';
import 'package:flutter/material.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 22,
        ),
        child: ListView(
          children: [
            // kolom search
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.search),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: borderColor),
                ),
                hintText: "Cari burger favoritmu...",
                hintStyle: greyTextStyle,
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // banner
            Stack(
              children: [
                Image.asset(
                  "assets/Rectangle 6.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Container(
                  margin: EdgeInsets.only(left: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 29,
                      ),
                      Text(
                        "KHUSUS PENGGUNA BARU!",
                        style: secondaryTextStyle.copyWith(
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Dapetin 1 Burger\nbayar dengan COD!",
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: secondaryColor),
                        onPressed: null,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                            bottom: 5,
                            left: 19,
                            right: 19,
                          ),
                          child: Text(
                            "Beli Sekarang!",
                            style: whiteTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),

            // text
            Text(
              "Mungkin kamu suka!",
              style: blackTextStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            // list product, loading data menggunakan widget FutureBuilder
            FutureBuilder<List<ProductModel>>(
                future: ProductSevices.getProductList(),
                builder: (context, snapshot) {
                  // saat loading...
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      ),
                    );
                  }
                  // setelah data didapatkan
                  else if (snapshot.hasData) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        crossAxisSpacing: 12,
                        childAspectRatio: 5 / 7,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          ...snapshot.data!.map((data) {
                            return ProductWidget(
                              dataProduct: data,
                            );
                          })
                        ],
                      ),
                    );
                  }
                  // defautl agar future builder bisa berfungsi
                  return Container();
                }),
          ],
        ),
      ),
    );
  }
}
