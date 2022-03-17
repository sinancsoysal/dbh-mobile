import 'package:mobile/core/utils/constants/route_constants/dbh_api_route_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../models/dtos/remote/dbh_api/topics/sub_expense_one/create_sub_expense_dto.dart';
import '../../../../../models/dtos/remote/dbh_api/topics/sub_expense_one/update_sub_expense_dto.dart';
import '../../../../../models/models/api_result.dart';
import '../../../../../models/models/remote/dbh_api/topics/sub_expense/api_result_of_enumerable_of_expense_report_dto.dart';
import '../../../../../models/models/remote/dbh_api/topics/sub_expense/api_result_of_enumerable_of_sub_expense.dart';
import '../../../../../models/models/remote/dbh_api/topics/sub_expense/api_result_of_sub_expense.dart';
import '../../../../../models/models/remote/dbh_api/topics/sub_expense/api_result_of_sub_expense_dto.dart';

part 'sub_expense_service.g.dart';

@RestApi(baseUrl: DbhApiRouteConstants.BASE_URL)
abstract class SubExpenseService {
  factory SubExpenseService(Dio dio, {String baseUrl}) = _SubExpenseService;

  @POST(DbhApiRouteConstants.subExpense1Create)
  Future<HttpResponse<ApiResult>> create({
    @Header("Authorization") required String bearerToken,
    @Body() required CreateSubExpenseDto createInvoiceDto,
  });

  @PUT(DbhApiRouteConstants.subExpense1Update)
  Future<HttpResponse<ApiResult>> update({
    @Header("Authorization") required String bearerToken,
    @Body() required UpdateSubExpense1Dto updateInvoiceDto,
  });

  @DELETE(DbhApiRouteConstants.subExpense1Delete)
  Future<HttpResponse<ApiResult>> delete({
    @Header("Authorization") required String bearerToken,
    @Path("id") required String id,
  });

  @GET(DbhApiRouteConstants.subExpense1GetId)
  Future<HttpResponse<ApiResultOfSubExpense>> getById({
    @Header("Authorization") required String bearerToken,
    @Path("id") required String id,
  });

  @GET(DbhApiRouteConstants.subExpense1GetByMainExpenseMainExpenseId)
  Future<HttpResponse<ApiResultOfSubExpenseDto>> getByMainExpenseMainExpensId({
    @Header("Authorization") required String bearerToken,
    @Path("mainExpenseId") required String mainExpenseId,
  });
  @GET(DbhApiRouteConstants.invoiceGetAll)
  Future<HttpResponse<ApiResultOfEnumerableOfSubExpense>> getAll({
    @Header("Authorization") required String bearerToken,
  });

  @GET(DbhApiRouteConstants.subExpense1GetAll)
  Future<HttpResponse<ApiResultOfEnumerableOfSubExpense>> getAllBySkipOffset({
    @Header("Authorization") required String bearerToken,
    @Path("skip") required int skip,
    @Path("offset") required int offset,
  });

  @POST(DbhApiRouteConstants.subExpense1GetAllSkipOffset)
  Future<HttpResponse<ApiResultOfEnumerableOfExpenseReportDto>> getReport({
    @Header("Authorization") required String bearerToken,
  });
}
