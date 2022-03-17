import 'dart:io';

import 'package:mobile/core/utils/constants/route_constants/dbh_api_route_constants.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../models/dtos/remote/dbh_api/topics/invoice_item/create_invoice_item_dto.dart';
import '../../../../../models/dtos/remote/dbh_api/topics/invoice_item/invoice_query_dto.dart';
import '../../../../../models/dtos/remote/dbh_api/topics/invoice_item/update_invoice_item_dto.dart';
import '../../../../../models/models/api_result.dart';
import '../../../../../models/models/remote/dbh_api/topics/invoice/api_result_of_enumerable_of_invoice.dart';
import '../../../../../models/models/remote/dbh_api/topics/invoice_item/api_result_of_invoice.dart';

part 'invoice_item_service.g.dart';

@RestApi(baseUrl: DbhApiRouteConstants.BASE_URL)
abstract class InvoiceItemService {
  factory InvoiceItemService(Dio dio, {String baseUrl}) = _InvoiceItemService;

  @POST(DbhApiRouteConstants.invoiceItemCreate)
  Future<HttpResponse<ApiResult>> create({
    @Header("Authorization") required String bearerToken,
    @Body() required CreateInvoiceItemDto createInvoiceDto,
  });

  @PUT(DbhApiRouteConstants.invoiceItemUpdate)
  Future<HttpResponse<ApiResult>> update({
    @Header("Authorization") required String bearerToken,
    @Body() required UpdateInvoiceItemDto updateInvoiceDto,
  });

  @DELETE(DbhApiRouteConstants.invoiceItemDelete)
  Future<HttpResponse<ApiResult>> delete({
    @Header("Authorization") required String bearerToken,
    @Path("id") required String id,
  });

  @POST(DbhApiRouteConstants.invoiceItemUploadAttachment)
  @MultiPart()
  Future<HttpResponse<ApiResult>> uploadAttachment({
    @Header("Authorization") required String bearerToken,
    @Part(value: "myFile", contentType: 'multipart/form-data')
        required File file,
  });

  @GET(DbhApiRouteConstants.invoiceItemGetId)
  Future<HttpResponse<ApiResultOfInvoice>> getById({
    @Header("Authorization") required String bearerToken,
    @Path("id") required String id,
  });

  @GET(DbhApiRouteConstants.invoiceItemGetByInvoice)
  Future<HttpResponse<ApiResultOfEnumerableOfInvoice>> getByInvoice({
    @Header("Authorization") required String bearerToken,
    @Query("invoiceId") String? invoiceId,
  });
  @POST(DbhApiRouteConstants.invoiceItemQureyInvoice)
  Future<HttpResponse<ApiResultOfEnumerableOfInvoice>> queryByInvoice({
    @Header("Authorization") required String bearerToken,
    @Body() required InvoiceQueryDto invoiceQueryDto,
  });
}
