// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:io';
import 'package:jaguar/jaguar.dart';
import 'package:jaguar_martini/jaguar_martini.dart';
import 'package:jaguar_martini/collectors/dir.dart';
import 'package:jaguar_hotreload/jaguar_hotreload.dart';

import 'package:minimal/minimal.dart';

const siteMeta = const SiteMetaData(
    title: 'Jaguar',
    description: 'Batteries included, production ready server framework',
    baseURL: 'http://localhost:8000', copyright: '&copy; All rights reserved.');

main(List<String> arguments) async {
  final reloader = new HotReloader();
  reloader.addPath('lib/');
  reloader.addPath('bin/main.dart');
  await reloader.go();

  final postCollector = new DirPostCollector(new Directory('./content'));
  final processor =
      new Processor(siteMeta, new DefaultWriter(), siteWriter: new SiteLayout())
        ..addShortcode(const GistShortCode())
        ..addShortcode(const AsciinemaShortCode())
        ..add(postCollector)
        ..start();

  final server = new Jaguar(port: 8000);
  server.addApi(new GeneratedHandler(processor));
  server.staticFiles('/static/*', new Directory('./static'));
  await server.serve();
}
