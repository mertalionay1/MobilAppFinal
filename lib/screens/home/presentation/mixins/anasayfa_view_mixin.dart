import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mertali/main.dart';
import 'package:mertali/product/cache/product_cache_manager.dart';
import 'package:mertali/product/models/oneri.dart';
import 'package:mertali/screens/home/presentation/anasayfa_view.dart';
import 'package:mertali/screens/home/presentation/controller/anasayfa_list.dart';

mixin AnasayfaViewMixin on ConsumerState<AnasayfaView> {
  ScrollController scrollController = ScrollController();
  bool switchValue = false;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController oneriController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void add(String title, String oneri) {
    ref
        .watch(anasayfaListProvider.notifier)
        .addOneri(
          Oneri(
            id: UniqueKey().hashCode,
            title: title,
            oneri: oneri,
          ),
        )
        .whenComplete(
          () => scrollController.animateTo(
            scrollController.position.maxScrollExtent + 150.0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate,
          ),
        );
  }

  changeTheme() {
    setState(() {
      switchValue = !switchValue;
    });

    ProductStorageManager.setTheme(theme: switchValue ? 'dark' : 'light');
    MyApp.setTheme(context, switchValue);
  }
}
