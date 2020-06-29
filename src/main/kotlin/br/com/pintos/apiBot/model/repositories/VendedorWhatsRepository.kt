package br.com.pintos.apiBot.model.repositories

import br.com.pintos.apiBot.model.beans.VendedorWhats
import org.springframework.data.repository.Repository

interface VendedorWhatsRepository : Repository<VendedorWhats, Int> {
  fun circulaVendedor(lista : Int) : VendedorWhats?
}