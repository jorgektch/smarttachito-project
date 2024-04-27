import { Component, OnInit } from '@angular/core';
import { NgIf, NgFor, AsyncPipe } from '@angular/common';
import { RouterModule } from '@angular/router';
import { Productos } from '../interfaces/interface';
import { Observable } from 'rxjs';
import { ApiPruebaService } from '../services/api-prueba.service';

@Component({
  selector: 'app-catalogo',
  standalone: true,
  imports: [NgIf, NgFor, RouterModule, AsyncPipe],
  templateUrl: './catalogo.component.html',
  styleUrl: './catalogo.component.css'
})
export class CatalogoComponent implements OnInit {

  //Define productos$ de tipo Observable<Productos[]> para recuperar la data del producto
  public productos$!: Observable<Productos[]>; 

  //Inyectar el ApiPrueba Service en el constructor
  constructor(private service: ApiPruebaService) { }
  
  //Siempre al iniciar se va a realizar getApiProductos
  ngOnInit(): void {
    this.productos$ = this.service.getApiProductos();
  }

  //Obtener la imagen compuesta del path y la extension
  getImagen(img: { path: string; extension: string }): string {
    return `${img.path}.${img.extension}`;
  }

  agregarAlCarrito() {
    // código para agregar producto al carrito
  }

}
