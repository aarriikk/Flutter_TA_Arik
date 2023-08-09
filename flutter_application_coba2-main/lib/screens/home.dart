import 'package:flutter/material.dart';
import 'package:my_app/components/hero.dart';
import 'package:my_app/screens/features/data_analytic.dart';
import 'package:my_app/screens/features/data_history.dart';
// import 'package:my_app/screens/features/operate_manual.dart';
import 'package:my_app/screens/menus/bep.dart';
import 'package:my_app/screens/menus/dss.dart';
import 'package:my_app/screens/menus/iot.dart';
import 'package:my_app/screens/menus/kpi.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var listMenus = [
    {
      'title': 'Decision Support System',
      'description':
          'Decision support system (DSS) adalah sistem informasi berbasis komputer yang dirancang untuk membantu manajer dan analis dalam proses pengambilan keputusan',
      'image': 'assets/images/AI.jpg',
      'component': const DssPage()
    },
    // {
    //   'title': 'Break Even Point',
    //   'image': 'assets/images/BEP.jpg',
    //   'description':
    //       'Analisi titik impas atau bisa disebut juga break even point merupakan suatu analisis yang dapat mentukan tingkat penjualan pada titik setimbang diantara untung rugi, dimana pada titik tersebut perusahaan tidak mengalami keuntungan maupun kerugian dengan memperhatikan pengeluaran produksi dan kuantitas produksi',
    //   'component': const BepPage()
    // },
    {
      'title': 'Key Performance Indicator',
      'description':
          'KPI yang merupakan singkatan dari key performance indicator adalah suatu matriks atau nilai terukur yang berfungsi untuk menunjukkan seberapa efektif perusahaan dalam mencapai tujuan bisnis utamanya. Selain itu, kehadiran KPI juga bermanfaat untuk membantu perusahaan merumuskan langkah apa saja yang diperlukan untuk mencapai tujuan tersebut',
      'image': 'assets/images/KPI.jpg',
      'component': const KpiPage()
    },
    {
      'title': 'Internet of Things',
      'description':
          'IoT adalah singkatan dari Internet of Things, istilah tersebut semakin banyak didengar setelah Revolusi Industri 4.0 digaungkan oleh pemerintah. Di dalam Revolusi Industri 4.0 ini adalah penerapan IoT di berbagai bidang tanpa terkecuali di bidang industri. Pertumbuhan Internet of Things (IoT) dengan cepat membentuk dunia yang lebih canggih. Perangkat pintar, koneksi internet, dan analitik data bertanggung jawab atas kemajuan revolusioner dalam bidang perdagangan, pertanian, maupun industri. Teknologi IoT telah memainkan peran penting dalam Industri, memberikan tingkat efisiensi operasional dan ketersediaan sumber daya yang tak terbayangkan. Dalam bidang industri, teknologi IoT didefinisikan sebagai jaringan perangkat, mesin, dan sensor yang terhubung satu sama lain dan ke Internet, dengan tujuan mengumpulkan data dan menganalisisnya untuk menerapkan informasi dalam perbaikan proses yang berkelanjutan.',
      'image': 'assets/images/IOT.jpg',
      'component': const IotPage()
    },
  ];

  var listFeatures = [
    // {
    //   'title': 'Operate Manual Feature',
    //   'description': 'ololololololo',
    //   'image': 'assets/images/MANUAL.png',
    //   'component': const OperateManualPage()
    // },
    {
      'title': 'Data Analytics',
      'description':
          'Pada applikasi ini terdapat beberapa indikator yang dapat menentukan performa mesin dengan indikator yang diambil dari analisis key performance indikator. dengan data-data yang tersedia pihak manajemen dapat melakukan pengambilan keputusan yang lebih cepat dan akurat dikarenakan pengambilan dan pengelolaan data sudah dilakukan oleh sistem, sehingga manajemen dapat melakukan tugas yang lebih kompleks',
      'image': 'assets/images/DATA.png',
      'component': const DataAnalyticPage()
    },
    {
      'title': 'Data History',
      'description':
          'Pada aplikasi ini menampilkan rekaman data-data yang sudah terekam oleh sistem dengan isi data seeprti yang dijelaskan pada halaman data analytics. rekaman data dapat mempermudah pihak manajemen maupun pihak pengambil keputusan untuk mengambil keputusan berdasarkan data yang sudah terekam pada sistem. Pengambilan keputusan akan lebih akurat dikarenakan data dapat dibandingkan secara manual oleh pihak manajemen dan juga data tersebut diambil dari data raspi yang memiliki tingkat akurasi tinggi dan mengurangi resiko error data yang dihasilkan oleh human error',
      'image': 'assets/images/HISTORY.png',
      'component': const DataHistoryPage()
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 211, 211, 211),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const HeroComponent(),
                Row(
                  children: const [
                    Text(
                      'Everything you need to know',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                      scrollDirection: Axis.vertical,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3)),
                  items: listMenus.map((dynamic menu) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => menu['component'],
                        ));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(0, 3),
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ],
                          image: DecorationImage(
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                            image: AssetImage(
                                '${(menu as Map<String, dynamic>)['image']}'),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  (menu)['title'],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                (menu)['description'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Text(
                      'Feature you need to know',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    scrollDirection: Axis.vertical,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                  items: listFeatures.map((dynamic menu) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => menu['component'],
                        ));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(0, 3),
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ],
                          image: DecorationImage(
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                            image: AssetImage(
                                '${(menu as Map<String, dynamic>)['image']}'),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  (menu)['title'],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                (menu)['description'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 9),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            )),
      ),
    );
  }
}
