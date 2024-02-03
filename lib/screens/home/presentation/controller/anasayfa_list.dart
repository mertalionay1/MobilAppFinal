import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:mertali/product/models/oneri.dart';

part 'anasayfa_list.g.dart';

@riverpod
class AnasayfaList extends _$AnasayfaList {
  final random = Random();
  @override
  Future<List<Oneri>> build() async {
    return getOneriList();
  }

  Future<void> addOneri(Oneri oneri) async {
    oneri.id = random.nextInt(10000);
    state = state..asData!.value.add(oneri);
  }

  Future<List<Oneri>> getOneriList() async {
    String data = await rootBundle.loadString('assets/json/oneriler.json');
    List<dynamic> jsonList = json.decode(data)['data'];
    List<Oneri> oneriler = jsonList.map((e) => Oneri.fromJson(e)).toList();
    oneriler.shuffle();
    return oneriler;
  }
}
