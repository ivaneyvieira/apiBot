package br.com.pintos.apiBot.model.services.impl

import br.com.pintos.apiBot.model.beans.VendedorWhats
import br.com.pintos.apiBot.model.repositories.VendedorWhatsRepository
import br.com.pintos.apiBot.model.services.VendedorWhatsService
import org.springframework.stereotype.Service

@Service
class VendedorWhatsServiceImpl(val vendedorWhatsRepository: VendedorWhatsRepository): VendedorWhatsService {
  override fun circulaVendedor(lista: Int): VendedorWhats? {
    return vendedorWhatsRepository.circulaVendedor(lista)
  }
}