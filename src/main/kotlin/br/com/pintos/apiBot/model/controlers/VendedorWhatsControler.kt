package br.com.pintos.apiBot.model.controlers

import br.com.pintos.apiBot.model.beans.VendedorWhats
import br.com.pintos.apiBot.model.services.VendedorWhatsService
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/vendedor")
class VendedorWhatsControler(val vendedorWhatsService: VendedorWhatsService) {
  @GetMapping("/circular/{lista}")
  fun circular(@PathVariable("lista")
               lista: Int): ResponseEntity<VendedorWhats?> {
    val vendedorWhats = vendedorWhatsService.circulaVendedor(lista)
    return if(vendedorWhats == null) ResponseEntity(HttpStatus.NOT_ACCEPTABLE)
    else return ResponseEntity.ok(vendedorWhats)
  }
}