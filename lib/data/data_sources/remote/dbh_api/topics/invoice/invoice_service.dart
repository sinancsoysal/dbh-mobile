import 'dart:io';

import 'package:mobile/core/utils/constants/route_constants/dbh_api_route_constants.dart';

import '../../../../../models/dtos/remote/dbh_api/topics/invoice/create_invoice_dto.dart';
import '../../../../../models/dtos/remote/dbh_api/topics/invoice/update_invoice_dto.dart';
import '../../../../../models/models/api_result.dart';
import '../../../../../models/models/remote/dbh_api/topics/invoice/api_result_of_enumerable_of_invoice.dart';
import '../../../../../models/models/api_result_of_string.dart';
import '../../../../../models/models/remote/dbh_api/topics/invoice_item/api_result_of_invoice.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:http_parser/http_parser.dart';
import '../../../../../models/dtos/remote/dbh_api/topics/invoice/api_result_of_enumerable_of_invoice_with_items_dto.dart';

part 'invoice_service.g.dart';

@RestApi(baseUrl: DbhApiRouteConstants.BASE_URL)
abstract class InvoiceService {
  factory InvoiceService(Dio dio, {String baseUrl}) = _InvoiceService;

  @POST(DbhApiRouteConstants.invoiceCreate)
  Future<HttpResponse<ApiResultOfString>> create({
    @Header("Authorization") required String bearerToken,
    @Header("x-area") required String xArea,
    @Body() required CreateInvoiceDto createInvoiceDto,
  });

  @PUT(DbhApiRouteConstants.invoiceUpdate)
  Future<HttpResponse<ApiResult>> update({
    @Header("Authorization") required String bearerToken,
    @Header("x-area") required String xArea,
    @Body() required UpdateInvoiceDto updateInvoiceDto,
  });

  @DELETE(DbhApiRouteConstants.invoiceDelete)
  Future<HttpResponse<ApiResult>> delete({
    @Header("Authorization") required String bearerToken,
    @Path("id") required String id,
  });

  @GET(DbhApiRouteConstants.invoiceGetId)
  Future<HttpResponse<ApiResultOfInvoice>> getById({
    @Header("Authorization") required String bearerToken,
    @Path("id") required String id,
  });

  @GET(DbhApiRouteConstants.invoiceGetAll)
  Future<HttpResponse<ApiResultOfEnumerableOfInvoice>> getAll({
    @Header("Authorization") required String bearerToken,
    @Header("x-area") required String xArea,
  });

  @GET(DbhApiRouteConstants.invoiceGetAllSkipOffset)
  Future<HttpResponse<ApiResultOfEnumerableOfInvoice>> getAllBySkipOffset({
    @Header("Authorization") required String bearerToken,
    @Path("skip") required int skip,
    @Path("offset") required int offset,
  });

  @POST(DbhApiRouteConstants.invoiceImportExcel)
  @MultiPart()
  Future<HttpResponse<ApiResultOfString>> importExcel({
    @Header("Authorization") required String bearerToken,
    @Part(value: "myFile", contentType: 'multipart/form-data')
        required File file,
  });

  @GET(DbhApiRouteConstants.invoiceExportExcel)
  Future<HttpResponse<ApiResultOfEnumerableOfInvoice>> exportExcel({
    @Header("Authorization") required String bearerToken,
    @Query("startDate") String? startDate,
    @Query("endDate") String? endDate,
  });

  @GET(DbhApiRouteConstants.invoiceGetAllWithItems)
  Future<HttpResponse<ApiResultOfEnumerableOfInvoiceWithItemsDto>>
      getAllWithItems({
    @Header("Authorization") required String bearerToken,
    @Header("x-area") required String xArea,
  });
}
