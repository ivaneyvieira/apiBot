package br.com.pintos.apiBot.model.securyty

import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.core.userdetails.UserDetails

class UserSaciPrincipal(): UserDetails {
  override fun getAuthorities(): MutableCollection<out GrantedAuthority> {
    val authorities = mutableListOf<GrantedAuthority>()
    authorities.add(SimpleGrantedAuthority("ADMIN"))
    return authorities
  }
  
  override fun isEnabled(): Boolean = true
  
  override fun getUsername(): String = "USER"
  
  override fun isCredentialsNonExpired(): Boolean = true
  
  override fun getPassword(): String = "f9c3c26897e1f0160f5437dd23ebda17"
  
  override fun isAccountNonExpired(): Boolean = true
  
  override fun isAccountNonLocked(): Boolean = true
}