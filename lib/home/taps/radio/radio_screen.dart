import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/taps/radio/radioControllar.dart';
import 'package:islami/shried/remote/remote.dart';

import '../../../model/Radio_Response.dart';

class RadioScreen extends StatefulWidget {
  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
  }

  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 2, child: Image.asset('assets/images/radio_imge.png')),
            SizedBox(
              height: 25,
            ),
            FutureBuilder<RadioResponse>(
                future: ApiManager.getRadio(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("someThing Wrong");
                  }
                  var radio = snapshot.data?.radios ?? [];
                  return Expanded(
                    child: ListView.builder(
                      physics:  PageScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: radio.length,
                      itemBuilder: (context, index) {
                        return RadioControllar(
                          tittel: radio[index].name ?? '',
                          functionPlay: () {
                            play(radio[index].radioUrl ?? "");


                          },
                          functionNext: () {
                          },
                          functionBack: () {
                          },
                        );
                      },
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  void play(String url) async {
    await audioPlayer.play(UrlSource(url));
  }

  void pause() async {
    await audioPlayer.pause();
  }
}
