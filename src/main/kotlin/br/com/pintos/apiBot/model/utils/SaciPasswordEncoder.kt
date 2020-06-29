package br.com.pintos.apiBot.model.utils


import org.springframework.security.crypto.password.PasswordEncoder

class SaciPasswordEncoder: PasswordEncoder {
  override fun encode(rawPassword: CharSequence?): String {
    val pass =rawPassword.toString()
    return pass.trim().toUpperCase()
  }
  
  override fun matches(rawPassword: CharSequence?, encodedPassword: String?): Boolean {
    val passEncode = encode(rawPassword)
    return encodedPassword?.toUpperCase() == passEncode.toUpperCase()
  }
}
