package br.com.pintos.apiBot.model.repositories.impl

import br.com.pintos.apiBot.model.beans.VendedorWhats
import br.com.pintos.apiBot.model.repositories.VendedorWhatsRepository
import br.com.pintos.apiBot.model.saci
import org.springframework.stereotype.Repository

@Repository
class VendedorWhatsRepositoryRepositoryImpl: VendedorWhatsRepository {
  override fun circulaVendedor(lista: Int): VendedorWhats? {
    return saci.circulaVendedor(lista)
  }
}