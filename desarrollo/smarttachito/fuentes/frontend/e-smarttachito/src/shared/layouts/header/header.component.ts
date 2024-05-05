import { Component, OnInit } from '@angular/core';
import { LauncherCarritoComponent } from '../../../customer/buyer/carrito-components/launcher-carrito/launcher-carrito.component';
import { AccesoUsuarioComponent } from "../acceso-usuario/acceso-usuario.component";
import { CarritoComponent } from '../../../customer/buyer/carrito-components/carrito/carrito.component';

@Component({
    selector: 'app-header',
    standalone: true,
    templateUrl: './header.component.html',
    styleUrl: './header.component.css',
    imports: [LauncherCarritoComponent, AccesoUsuarioComponent, CarritoComponent]
})
export class HeaderComponent implements OnInit {
    ngOnInit(): void {}

}