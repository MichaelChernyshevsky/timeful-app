import 'package:helpers/common/templates/repository.dart';
import 'package:helpers/parts/api/models/base_response.dart';
import 'package:helpers/parts/api/state.dart';
import 'package:helpers/parts/packages/interface.dart';
import 'package:helpers/parts/packages/model.dart';
import 'package:helpers/parts/packages/uri.dart';
import 'package:helpers/parts/user/repo.dart';

class PackagesRepository extends Repository implements PackagesInterface {
  PackagesRepository({required super.httpService});

  @override
  Future<bool> changePackage({required PackageType type, required String userId}) async {
    final BaseResponse resp = await httpService.post(
      changePackageUri,
      data: {"userId": userId, "package": type.toString()},
    );
    return resp.message == MESSAGE_SUCCESS;
  }

  @override
  Future<Packages> getPackages({required String userId}) async {
    final BaseResponse resp = await httpService.post(
      getPackageUri,
      data: {"userId": userId},
    );
    return Packages.fromJson(resp.data);
  }

  @override
  Future<PackagesInfo> infoPackages() async {
    final BaseResponse resp = await httpService.post(infoPackageUri);
    return PackagesInfo.fromJson(resp.data);
  }
}
