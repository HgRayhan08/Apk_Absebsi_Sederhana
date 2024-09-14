import 'package:absensi/presentasi/provider/absen_provider/absen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ListAbsenPage extends ConsumerStatefulWidget {
  const ListAbsenPage({super.key});

  @override
  ConsumerState<ListAbsenPage> createState() => _ListAbsenPageState();
}

class _ListAbsenPageState extends ConsumerState<ListAbsenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ref.watch(absenProviderProvider.notifier).getList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(
                    data[index].name,
                    style: GoogleFonts.lato()
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    data[index].alamat,
                    style: GoogleFonts.lato().copyWith(
                      fontSize: 14,
                    ),
                  ),
                  subtitle:
                      Text(data[index].dateTime, style: GoogleFonts.lato()),
                  trailing: Text("Berhasil", style: GoogleFonts.lato()),
                );
              },
            );
          } else {
            return const Center(
              child: Text("data"),
            );
          }
        },
      ),
    );
  }
}
