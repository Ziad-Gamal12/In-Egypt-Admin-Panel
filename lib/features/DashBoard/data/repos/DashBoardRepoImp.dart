import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/errors/Exceptioons.dart';
import 'package:in_egypt_admin_panel/core/errors/Failures.dart';
import 'package:in_egypt_admin_panel/core/services/DataBaseService.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/data/models/DashBoardInfoModels/dash_board_info.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntities/dash_board_infoEntity.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/repos/DashBoardRepo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DashBoardRepoImp implements DashBoardRepo {
  final Databaseservice databaseservice;
  DashBoardRepoImp({required this.databaseservice});
  SupabaseClient supabaseClient = Supabase.instance.client;
  @override
  Future<Either<Failure, DashBoardInfoEntity>> getDashBoardInfo() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://bnhhxkelcpnuneupdddw.supabase.co/functions/v1/checkWeeklyTrends',
        ),
        headers: {
          'Authorization': 'Bearer $supaBaseAnonKey',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode != 200) {
        log(response.body.toString());
        throw CustomException(message: response.statusCode.toString());
      }
      final Map<String, dynamic> data = json.decode(response.body);
      DashBoardInfoEntity result = DashBoardInfo.fromJson(data).toEntity();
      return Right(result);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    } catch (e, s) {
      log("${e.toString()} ${s.toString()}");
      return Left(ServerFailure(message: "حدث خطأ ما"));
    }
  }
}
