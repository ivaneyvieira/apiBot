package br.com.pintos.apiBot.model.services

import br.com.pintos.apiBot.model.beans.VendedorWhats

interface VendedorWhatsService {
  fun circulaVendedor(lista : Int) : VendedorWhats?
}

