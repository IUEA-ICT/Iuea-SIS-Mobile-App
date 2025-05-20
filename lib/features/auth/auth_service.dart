import 'package:flutter/material.dart';

class AuthService {
  // Singleton pattern (optionnel)
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  // Méthode de connexion simulée
  Future<bool> login({
    required String registrationNumber,
    required String password,
  }) async {
    // Simuler un délai réseau
    await Future.delayed(const Duration(seconds: 1));

    // Exemple de logique d'authentification (à remplacer par une vraie logique)
    if (registrationNumber == '24/276/BSCS-S' && password == '1234') {
      return true;
    }
    return false;
  }

  // Ajoutez ici d'autres méthodes (logout, register, etc.) si besoin
}
