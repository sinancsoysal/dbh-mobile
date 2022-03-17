import 'package:mobile/core/utils/constants/route_constants/dbh_api_route_constants.dart';

import '../../../../../models/dtos/remote/dbh_api/topics/main_expense/update_main_expense_dto.dart';
import '../../../../../models/models/remote/dbh_api/topics/main_expense/api_result_of_enumerable_of_main_expense_comparison.dart';
import '../../../../../models/models/remote/dbh_api/topics/main_expense/api_result_of_enumerable_of_main_expense_dto.dart';
import '../../../../../models/models/remote/dbh_api/topics/main_expense/api_result_of_enumerable_of_main_expense.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


import '../../../../../models/dtos/remote/dbh_api/topics/main_expense/create_main_expense_dto.dart';
import '../../../../../models/models/api_result.dart';
import '../../../../../models/models/remote/dbh_api/topics/main_expense/api_result_of_main_expense.dart';
import '../../../../../models/dtos/remote/dbh_api/topics/main_expense/api_result_of_enumerable_of_main_expense_most_used_dto.dart';

part 'main_expense_service.g.dart';

@RestApi(baseUrl: DbhApiRouteConstants.BASE_URL)
abstract class MainExpenseService {
  factory MainExpenseService(Dio dio, {String baseUrl}) = _MainExpenseService;

  @POST(DbhApiRouteConstants.mainExpenseCreate)
  Future<HttpResponse<ApiResult>> create({
    @Header("Authorization") required String bearerToken,
    @Body() required CreateMainExpenseDto updateInvoiceDto,
    @Header("x-area") required String xArea,
  });
  @PUT(DbhApiRouteConstants.mainExpenseUpdate)
  Future<HttpResponse<ApiResult>> update({
    @Header("Authorization") required String bearerToken,
    @Header("x-area") required String xArea,
    @Body() required UpdateMainExpenseDto updateInvoiceDto,
  });
  @DELETE(DbhApiRouteConstants.mainExpenseDelete)
  Future<HttpResponse<ApiResult>> delete({
    @Header("Authorization") required String bearerToken,
    @Path("id") required String id,
  });
  @GET(DbhApiRouteConstants.mainExpenseGetId)
  Future<HttpResponse<ApiResultOfMainExpense>> getById({
    @Header("Authorization") required String bearerToken,
    @Path("id") required String id,
  });
  @GET(DbhApiRouteConstants.mainExpenseGetAll)
  Future<HttpResponse<ApiResultOfEnumerableOfMainExpenseDto>> getAll({
    @Header("x-area") required String xArea,
    @Header("Authorization") required String bearerToken,
  });
  @GET(DbhApiRouteConstants.mainExpenseGetMostUsed)
  Future<HttpResponse<ApiResultOfEnumerableOfMainExpenseMostUsedDto>>
      getMostUsed({
    @Header("x-area") required String xArea,
    @Header("Authorization") required String bearerToken,
  });
  @GET(DbhApiRouteConstants.mainExpenseGetComparison)
  Future<HttpResponse<ApiResultOfEnumerableOfMainExpenseComparison>>
      getComparison({
    @Header("x-area") required String xArea,
    @Header("Authorization") required String bearerToken,
  });
  @GET(DbhApiRouteConstants.mainExpenseGetAllSkipOffset)
  Future<HttpResponse<ApiResultOfEnumerableOfMainExpense>> getAllBySkipOffset({
    @Header("Authorization") required String bearerToken,
    @Path("skip") required int skip,
    @Path("offset") required int offset,
  });
}
