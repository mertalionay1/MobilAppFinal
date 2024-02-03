// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mertali/product/funcs.dart';
import 'package:mertali/product/models/oneri.dart';
import 'package:mertali/product/navigator.dart';
import 'package:mertali/screens/auth/presentation/login_view.dart';
import 'package:mertali/screens/home/presentation/controller/anasayfa_list.dart';
import 'package:mertali/screens/home/presentation/mixins/anasayfa_view_mixin.dart';

import 'profile_view.dart';

class AnasayfaView extends ConsumerStatefulWidget {
  const AnasayfaView({Key? key}) : super(key: key);

  @override
  _AnasayfaViewState createState() => _AnasayfaViewState();
}

class _AnasayfaViewState extends ConsumerState<AnasayfaView>
    with AnasayfaViewMixin {
  @override
  Widget build(BuildContext context) {
    final list = ref.watch(anasayfaListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anasayfa'),
        actions: [
          Switch(
            value: switchValue,
            onChanged: (value) {
              switchValue = value;
              changeTheme();
              setState(() {
                switchValue = value;
              });
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  children: [
                    ClipRect(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: 50,
                          child: Image.network(
                              "https://www.iprcenter.gov/image-repository/blank-profile-picture.png/@@images/image.png"),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Mertali',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        PNavigator.nextPageAndRemoveUntil(
                            context, const LoginView());
                      },
                      child: const Text(
                        'Çıkış Yap',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    )
                  ],
                )),
            ListTile(
              title: const Text('Profil'),
              onTap: () {
                PNavigator.nextPage(context, const ProfileView());
              },
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Merhaba, Hoş Geldiniz!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Güzel bir gün geçirmeniz dileğiyle. İşte size özel öneriler:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: list.when(
                  data: (data) {
                    return ListView.builder(
                      controller: scrollController,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return _buildListItem(
                          data[index],
                          context,
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) => Center(
                    child: Text(error.toString()),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Title:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: TextField(
                    controller: titleController,
                    onChanged: (value) =>
                        titleController.text = value.toString(),
                    decoration: InputDecoration(
                      hintText: 'Title ı buraya yazın...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  'Öneri:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: TextField(
                    controller: oneriController,
                    onChanged: (value) =>
                        oneriController.text = value.toString(),
                    decoration: InputDecoration(
                      hintText: 'Önerinizi buraya yazın...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  add(titleController.text, oneriController.text);
                  titleController.clear();
                  oneriController.clear();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Buton rengi
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Ekle',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildListItem(Oneri oneri, BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(oneri.title.toString()),
        subtitle: Text(oneri.oneri.toString()),
        leading: const Icon(Icons.lightbulb),
        onTap: () {
          Funcs.showSnackBar(context, 'Öneriye tıklandı: ${oneri.id}');
        },
      ),
    );
  }
}
