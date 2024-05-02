import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:ma_petite_voiture_mobile/backend/services/api_endpoint.dart';

mixin VoitureApiServices {
  Future listeVoiture() async {
    var url = Uri.parse(ApiEndpoint.listeVoitureURL);
    var res = await http.get(url);

    if(res.statusCode == 200){
      var voitures = convert.jsonDecode(res.body);
      return voitures;
    }else{
       debugPrint('Request failed with status: ${res.statusCode}.');
    }
  }

  Future ajouterVoiture(int id,String marque, String immatriculation, int annee, String equipe, String nom) async{
    Map<String, dynamic> request = {
      'id': id,
      'marque': marque,
      'immatriculation': immatriculation,
      'annee': annee,
      'equipe': equipe,
      'nom': nom
    };
    var url = Uri.parse(ApiEndpoint.ajouteVoitureURL);
    var res = await http.post(url, body: request);

    if(res.statusCode == 201){
      var addVoiture = convert.jsonDecode(res.body);
      return addVoiture;
    }else{
       debugPrint('Request failed load .');
    }
  }


  Future modifierVoiture(int id, String marque, String immatriculation, int annee, String equipe, String nom) async{
    Map<String, dynamic> request = {
      'id': id,
      'marque': marque,
      'immatriculation': immatriculation,
      'annee': annee,
      'equipe': equipe,
      'nom': nom
    };
    var url = Uri.parse(ApiEndpoint.modifierVoitureURL);
    var res = await http.put(url, body: request);

    if(res.statusCode == 200){
      var updateVoiture = convert.jsonDecode(res.body);
      return updateVoiture;
    }else{
       debugPrint('Request failed load .');
    }
  }
}

