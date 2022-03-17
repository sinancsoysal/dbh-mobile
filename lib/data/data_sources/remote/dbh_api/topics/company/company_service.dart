import 'dart:io';

import 'package:mobile/core/utils/constants/route_constants/dbh_api_route_constants.dart';

import '../../../../../models/dtos/remote/dbh_api/topics/company/create_company_dto.dart';
import '../../../../../models/dtos/remote/dbh_api/topics/company/update_company_dto.dart';
import '../../../../../models/models/api_result.dart';
import '../../../../../models/models/remote/dbh_api/topics/company/api_result_of_company.dart';
import '../../../../../models/models/remote/dbh_api/topics/company/api_result_of_enumerable_of_company.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:http_parser/http_parser.dart';

part 'company_service.g.dart';

@RestApi(baseUrl: DbhApiRouteConstants.BASE_URL)
abstract class CompanyService {
  factory CompanyService(Dio dio, {String baseUrl}) = _CompanyService;

  @POST(DbhApiRouteConstants.companyCreate)
  Future<HttpResponse<ApiResult>> create({
    @Header("Authorization") required String bearerToken,
    @Header("x-area") required String xArea,
    @Body() required CreateCompanyDto createCompanyDto,
  });

  @POST(DbhApiRouteConstants.companyUpdate)
  Future<HttpResponse<ApiResult>> update({
    @Header("Authorization") required String bearerToken,
    @Header("x-area") required String xArea,
    @Body() required UpdateCompanyDto updateCompanyDto,
  });

  @DELETE(DbhApiRouteConstants.companyDelete)
  Future<HttpResponse<ApiResult>> delete({
    @Header("Authorization") required String bearerToken,
    @Path("id") required String id,
  });

  @GET(DbhApiRouteConstants.companyCheckRepeat)
  Future<HttpResponse<ApiResult>> checkRepeat({
    @Header("Authorization") required String bearerToken,
    @Query("companyName") String? id,
  });

  @POST(DbhApiRouteConstants.companyUploadAttechment)
  @MultiPart()
  Future<HttpResponse<ApiResult>> uploadAttachment({
    @Header("Authorization") required String bearerToken,
    @Part(value: "myFile", contentType: 'multipart/form-data')
        required File file,
  });

  @GET(DbhApiRouteConstants.companyGetId)
  Future<HttpResponse<ApiResultOfCompany>> getById({
    @Header("Authorization") required String bearerToken,
    @Path("id") required String id,
  });

  @GET(DbhApiRouteConstants.companyGetAll)
  Future<HttpResponse<ApiResultOfEnumerableOfCompany>> getAll({
    @Header("Authorization") required String bearerToken,
    @Header("x-area") required String xArea,
  });

  @GET(DbhApiRouteConstants.companyGetAllSkipOffset)
  Future<HttpResponse<ApiResultOfEnumerableOfCompany>> getAllBySkipOffset({
    @Header("Authorization") required String bearerToken,
    @Path("skip") required int skip,
    @Path("offset") required int offset,
  });
}
