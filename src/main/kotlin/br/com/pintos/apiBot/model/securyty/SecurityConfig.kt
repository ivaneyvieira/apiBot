package br.com.pintos.apiBot.model.securyty

import br.com.pintos.apiBot.model.utils.SaciPasswordEncoder
import org.apache.catalina.Context
import org.apache.catalina.connector.Connector
import org.apache.tomcat.util.descriptor.web.SecurityCollection
import org.apache.tomcat.util.descriptor.web.SecurityConstraint
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory
import org.springframework.boot.web.servlet.server.ServletWebServerFactory
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.security.authentication.dao.DaoAuthenticationProvider
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter
import org.springframework.security.config.http.SessionCreationPolicy
import org.springframework.security.crypto.password.PasswordEncoder

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
class SecurityConfig(val userSaciDetailsService: UserSaciDetailsService): WebSecurityConfigurerAdapter() {
  override fun configure(auth: AuthenticationManagerBuilder?) {
    auth?.authenticationProvider(authenticationProvider())
  }
  
  override fun configure(http: HttpSecurity?) {
    http?.authorizeRequests()
      ?.anyRequest()
      ?.authenticated()
      ?.and()
      ?.httpBasic()
      ?.and()
      ?.sessionManagement()
      ?.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
      ?.and()
      ?.csrf()
      ?.disable()
      ?.requiresChannel()
      ?.anyRequest()
      ?.requiresSecure()
  }
  
  @Bean
  fun authenticationProvider(): DaoAuthenticationProvider {
    val authProvider = DaoAuthenticationProvider()
    authProvider.setUserDetailsService(userSaciDetailsService)
    authProvider.setPasswordEncoder(encoder())
    return authProvider
  }
  
  @Bean
  fun encoder(): PasswordEncoder = SaciPasswordEncoder()
  
  @Bean
  fun servletContainer(): ServletWebServerFactory? {
    val tomcat: TomcatServletWebServerFactory = object: TomcatServletWebServerFactory() {
      override fun postProcessContext(context: Context) {
        val securityConstraint = SecurityConstraint()
        securityConstraint.userConstraint = "CONFIDENTIAL"
        val collection = SecurityCollection()
        collection.addPattern("/*")
        securityConstraint.addCollection(collection)
        context.addConstraint(securityConstraint)
      }
    }
    tomcat.addAdditionalTomcatConnectors(getHttpConnector())
    return tomcat
  }
  
  private fun getHttpConnector(): Connector? {
    val connector = Connector(TomcatServletWebServerFactory.DEFAULT_PROTOCOL)
    connector.scheme = "http"
    connector.port = 8080
    connector.secure = false
    connector.redirectPort = 8443
    return connector
  }
}