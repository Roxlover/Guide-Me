import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guide_me/widgets/CategoryButton.dart';
import 'package:guide_me/widgets/PlacesCard.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePageNavigation extends StatefulWidget {
  const HomePageNavigation({super.key});

  @override
  State<HomePageNavigation> createState() => _HomePageNavigationState();
}

class _HomePageNavigationState extends State<HomePageNavigation> {
  final List<PlacesCard> places = [
    PlacesCard(
        title: "Side Antik Kenti",
        image: "assets/images/side.png",
        description:
            "Antalya'nın Manavgat ilçesinde yer alan antik bir kenttir. Helenistik ve Roma dönemlerinde önemli bir ticaret merkezi ve liman şehri olarak bilinir. Günümüzde turistler için popüler bir ziyaret noktasıdır."),
    PlacesCard(
        title: "Perge Anıtsal Çeşme",
        image: "assets/images/anitsalcesme.png",
        description:
            "Side antik kentindeki anıtsal çeşme, Helenistik dönemde yapılmış büyük bir su yapıtıdır. Şehrin merkezinde bulunur ve Roma döneminde değişiklikler geçirmiştir."),
    PlacesCard(
        title: "Side sütunlu Cadde",
        image: "assets/images/sutunlucadde.png",
        description:
            "Side antik kentindeki sütunlu cadde, Helenistik dönemde yapılmış önemli bir cadde yapıtıdır. Şehrin merkezinde uzanır ve Roma döneminde de kullanılmıştır."),
    PlacesCard(
        title: "Bizans Hastanesi",
        image: "assets/images/bizanshastenesi.png",
        description: ""),
    PlacesCard(
        title: "Athena Tapınağı",
        image: "assets/images/athenatapinagi.png",
        description: "")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100.w,
                height: 14.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Kategoriler",
                        style: GoogleFonts.inter(
                            fontSize: 22, fontWeight: FontWeight.w200),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            CategoryButton(
                                text: "Tarihi ve Kültürel Yerler",
                                onPressed: () => {}),
                            CategoryButton(
                                text: "Doğa ve Açık Hava Aktiviteleri",
                                onPressed: () => {}),
                            CategoryButton(
                                text: "Eğlence ve Rekreasyon",
                                onPressed: () => {}),
                            CategoryButton(
                                text: "Sanat ve Mimari", onPressed: () => {}),
                            CategoryButton(
                                text: "Gastronomi ve Yerel Lezzetler",
                                onPressed: () => {}),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 100.w,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Bana en yakın yerler",
                      style: GoogleFonts.inter(
                          fontSize: 22, fontWeight: FontWeight.w200)),
                ),
              ),
              ListView.builder(
                shrinkWrap:
                    true, // This is important to avoid the unbounded height error
                physics:
                    NeverScrollableScrollPhysics(), // Disable ListView's own scrolling
                itemCount: places.length,
                itemBuilder: (context, index) {
                  return places[index];
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
