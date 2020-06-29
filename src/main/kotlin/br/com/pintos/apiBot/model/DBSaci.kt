package br.com.pintos.apiBot.model

import br.com.pintos.apiBot.model.beans.VendedorWhats
import br.com.pintos.framework.model.DBProperties
import br.com.pintos.framework.model.QueryDB

class QuerySaci: QueryDB(driver, url, username, password) {
  fun circulaVendedor(lista: Int): VendedorWhats? {
    val sql = "/sql/circulaVendedor.sql"
    return query(sql, VendedorWhats::class) {
      addOptionalParameter("lista", lista)
    }.firstOrNull()
  }
  
  companion object {
    private val db = DBProperties("saci")
    internal val driver = db.driver
    internal val url = db.url
    internal val username = db.username
    internal val password = db.password
    internal val test = db.test
    val ipServer
      get() = url.split("/")
                .getOrNull(2) ?: "0.0.0.0"
  }
}

val saci = QuerySaci()