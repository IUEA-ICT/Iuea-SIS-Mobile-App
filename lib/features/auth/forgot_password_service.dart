class ForgotPasswordService {
  // Simule l'envoi d'un code de réinitialisation
  Future<bool> sendResetCode({required String registrationNumber}) async {
    await Future.delayed(const Duration(seconds: 1));
    // Simule la vérification du numéro d'enregistrement
    if (registrationNumber == '24/276/BSCS-S') {
      // Ici, tu pourrais envoyer un email ou un SMS
      return true;
    }
    return false;
  }
}
