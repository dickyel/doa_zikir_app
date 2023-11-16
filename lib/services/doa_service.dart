import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:doa_zikir_app/models/doa_models.dart';

class DoaService {
  String baseUrl = 'http://doa-doa-api-ahmadramadhan.fly.dev';


  Future<List<DoaModel>> getDoas() async {

    var url = Uri.parse('$baseUrl/api'); 

    var response = await http.get(url);

    print(response.body);

    if(response.statusCode == 200){
      List data = jsonDecode(response.body)['data']['data'];
      List<DoaModel> doas = [];

      for(var item in data){
        doas.add(DoaModel.fromJson(item));
      }

      return doas;

    } else {
      throw Exception('Gagal Get Data Doa');
    }

  }
}

