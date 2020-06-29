package br.com.pintos.apiBot.model.controlers

import br.com.pintos.apiBot.model.beans.VendedorWhats
import br.com.pintos.apiBot.model.responce.Response
import br.com.pintos.apiBot.model.services.VendedorWhatsService
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/vendedor")
class VendedorWhatsControler(val vendedorWhatsService: VendedorWhatsService) {
  @GetMapping("/circular/{lista}")
  fun circular(@PathVariable("lista") lista : Int) : ResponseEntity<Response<VendedorWhats>> {
    val response = Response<VendedorWhats>()
    val vendedorWhats = vendedorWhatsService.circulaVendedor(lista)
    return if(vendedorWhats == null){
      response.erros.add("Não encontrado")
      ResponseEntity.badRequest().body(response)
    }else{
      response.data = vendedorWhats
      ResponseEntity.ok(response)
    }
  }
}