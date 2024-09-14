import 'package:absensi/presentasi/misc/build_context_alert_information.dart';
import 'package:absensi/presentasi/provider/absen_provider/absen_provider.dart';
import 'package:absensi/presentasi/provider/login_provider/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAbsenPage extends ConsumerStatefulWidget {
  const HomeAbsenPage({super.key});

  @override
  ConsumerState<HomeAbsenPage> createState() => _HomeAbsenPageState();
}

class _HomeAbsenPageState extends ConsumerState<HomeAbsenPage> {
  // double latitudeKantor = -6.8957473;
  double latitudeKantor = -7.620608;
  // double longitudeKantor = 107.6337669;
  double longitudeKantor = 112.198521;
  String message = "Periksa jarak";
  bool? jarak;

  Future<bool> checkDistance(
      {required double lat, required double long}) async {
    double distanceInMeters = Geolocator.distanceBetween(
      lat,
      long,
      latitudeKantor,
      longitudeKantor,
    );
    double jarak = double.parse(distanceInMeters.toStringAsFixed(2));
    if (jarak < 100) {
      setState(() {
        message = "Berhasil: Jarak kurang dari atau sama dengan 100 meter";
      });
      return true;
    } else {
      setState(() {
        message = "Error: Jarak lebih dari 100 meter";
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: FutureBuilder(
        future: ref.watch(userDataProvider.notifier).getLocal(),
        builder: (context, local) {
          if (local.hasData) {
            var dataLocal = local.data!;
            return ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.06,
                    horizontal: width * 0.1,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                    vertical: height * 0.02,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.all(
                      Radius.circular(width * 0.05),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dataLocal.email,
                        style: GoogleFonts.notoSans().copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        dataLocal.name,
                        style: GoogleFonts.notoSans().copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.18),
                FutureBuilder(
                  future: ref
                      .watch(absenProviderProvider.notifier)
                      .getCurrentLocation(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data!;
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.3),
                        child: ElevatedButton(
                          onPressed: () async {
                            bool chek = await checkDistance(
                                lat: data.latitude, long: data.longitude);
                            if (chek == true) {
                              await ref
                                  .read(absenProviderProvider.notifier)
                                  .createAbsen(
                                    lat: data.latitude,
                                    long: data.longitude,
                                  );
                            } else {
                              context.buildAlertInformation(
                                  title: "Pesan",
                                  subTitle:
                                      "Tidak Dapat Absen Karena Jarak Lebih Dari 100 Meter");
                            }
                            setState(() {});
                          },
                          child: const Text("Absen"),
                        ),
                      );
                    } else {
                      return const Center();
                    }
                  },
                ),
              ],
            );
          } else {
            return const Center(
              child: Text("Data user Kosong"),
            );
          }
        },
      ),
    );
  }
}
