import "package:ensemble_camera/camera_manager.dart";

import 'package:ensemble/framework/stub/camera_manager.dart';
import 'package:ensemble/framework/stub/ensemble_chat.dart';
import 'package:ensemble/framework/stub/file_manager.dart';
import 'package:ensemble/framework/stub/contacts_manager.dart';
import 'package:ensemble/framework/stub/plaid_link_manager.dart';
import 'package:ensemble/module/location_module.dart';
import 'package:ensemble/framework/stub/deferred_link_manager.dart';
import 'package:ensemble/module/auth_module.dart';
import 'package:get_it/get_it.dart';

class EnsembleModules {
  static final EnsembleModules _instance = EnsembleModules._internal();
  EnsembleModules._internal();
  factory EnsembleModules() {
    return _instance;
  }

  void init() {
    GetIt.I.registerSingleton<EnsembleChat>(const EnsembleChatStub());
    GetIt.I.registerSingleton<AuthModule>(AuthModuleStub());
    GetIt.I.registerSingleton<ContactManager>(ContactManagerStub());
    GetIt.I.registerSingleton<PlaidLinkManager>(PlaidLinkManagerStub());
    GetIt.I.registerSingleton<CameraManager>(CameraManagerImpl());
    GetIt.I.registerSingleton<FileManager>(FileManagerStub());
    GetIt.I.registerSingleton<LocationModule>(LocationModuleStub());
    GetIt.I.registerSingleton<DeferredLinkManager>(DeferredLinkManagerStub());
  }
}