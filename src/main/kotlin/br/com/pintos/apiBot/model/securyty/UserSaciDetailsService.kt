package br.com.pintos.apiBot.model.securyty

import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.springframework.stereotype.Service

@Service
class UserSaciDetailsService(): UserDetailsService {
  override fun loadUserByUsername(username: String?): UserDetails {
    username ?: throw UsernameNotFoundException(username)
    if(username == "USER") return UserSaciPrincipal()
    else throw UsernameNotFoundException(username)
  }
}