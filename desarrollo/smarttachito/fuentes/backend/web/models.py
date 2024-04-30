from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager

class Categoria(models.Model):
    nombre = models.CharField("Nombre", max_length=100)
    descripcion = models.CharField("Descripción", max_length=500)
    imagen = models.ImageField("Imagen", upload_to="imagen/")
    def __str__(self):
        return self.nombre
    class Meta:
        verbose_name = "Categoria"
        verbose_name_plural = "Categorias"

class Producto(models.Model):
    nombre = models.CharField("Nombre", max_length=100)
    descripcion_breve = models.CharField("Descripción breve", max_length=100)
    descripcion_extendida = models.CharField("Descripción extendida", max_length=500)
    precio = models.DecimalField("Precio", max_digits=10 , decimal_places=2)
    imagen_principal = models.ImageField("Imagen principal", upload_to="imagen/")
    imagen_secundaria_1 = models.ImageField("Imagen secundaria 1", upload_to="imagen/")
    imagen_secundaria_2 = models.ImageField("Imagen secundaria 2", upload_to="imagen/")
    imagen_secundaria_3 = models.ImageField("Imagen secundaria 3", upload_to="imagen/")
    imagen_3d = models.ImageField("Imagen 3D", upload_to="imagen/")
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE, verbose_name="Categoría")
    def __str__(self):
        return self.nombre
    class Meta:
        verbose_name = "Producto"
        verbose_name_plural = "Productos"

class TipoDocumento(models.Model):
    nombre = models.CharField("Nombre", max_length=100)
    descripcion = models.CharField("Descripción", max_length=500)
    def __str__(self):
        return self.nombre
    class Meta:
        verbose_name = "Tipo de documento"
        verbose_name_plural = "Tipos de documento"

class UsuarioManager(BaseUserManager):

class Usuario(AbstractBaseUser):
    username = models.CharField("Nombre de usuario", max_length = 100, unique = True)
    email = models.EmailField("Correo electrónico", max_length = 254, unique = True)
    nombres = models.CharField("Nombres", max_length = 200)
    apellido_p = models.CharField("Nombres", max_length = 200, blank = True, null = True)
    apellido_m = models.CharField("Nombres", max_length = 200, blank = True, null = True)
    tipo_documento = models.ForeignKey(TipoDocumento, on_delete=models.CASCADE, verbose_name="Tipo de documento", null=True, blank=True)
    numero_documento = models.CharField("Número de documento", max_length=100, null=True, blank=True)
    telefono = models.CharField("Celular", max_length=20, blank = True, null = True)
    
    usuario_activo = models.BooleanField(default = True)
    usuario_administrador = models.BooleanField(default = False)
    objects = UsuarioManager()

    USERNAME_FIELD = "username"
    REQUIRED_FIELDS = ["email", "nombres"]
    
    def __str__(self):
        return f"{self.nombres} {self.apellido_p} {self.apellido_m}"

    def has_perm(self, perm, obj = None):
        return True
    
    def has_module_perms(self, app_label):
        return True

    @property
    def is_staff(self):
        return self.usuario_administrador

    class Meta:
        verbose_name = "Usuario"
        verbose_name_plural = "Usuarios"

class Cliente(models.Model):
    def __str__(self):
        return self.nombre
    class Meta:
        verbose_name = "Cliente"
        verbose_name_plural = "Clientes"

class Cargo(models.Model):
    nombre = models.CharField("Nombre", max_length=100)
    descripcion = models.CharField("Descripción", max_length=500)
    def __str__(self):
        return self.nombre
    class Meta:
        verbose_name = "Cargo"
        verbose_name_plural = "Cargos"

class CargoEmpleado(models.Model):
    def __str__(self):
        return self.nombre
    class Meta:
        verbose_name = "CargoEmpleado"
        verbose_name_plural = "CargoEmpleados"

class Residuo(models.Model):
    nombre = models.CharField("Nombre", max_length=100)
    descripcion = models.CharField("Descripción", max_length=500)
    imagen = models.ImageField("Imagen", upload_to="imagen/")
    def __str__(self):
        return self.nombre
    class Meta:
        verbose_name = "Residuo"
        verbose_name_plural = "Residuos"

class ProductoServicio(models.Model):
    def __str__(self):
        return self.nombre
    class Meta:
        verbose_name = "ProductoServicio"
        verbose_name_plural = "ProductoServicios"

class Pais(models.Model):
    nombre = models.CharField("Nombre", max_length=100)
    def __str__(self):
        return self.nombre
    class Meta:
        verbose_name = "Pais"
        verbose_name_plural = "Paises"

class Ciudad(models.Model):
    pais = models.ForeignKey(Pais, on_delete=models.CASCADE, verbose_name="País")
    nombre = models.CharField("Nombre", max_length=100)
    def __str__(self):
        return self.nombre
    class Meta:
        verbose_name = "Ciudad"
        verbose_name_plural = "Ciudades"

class Direccion(models.Model):
    def __str__(self):
        return self.nombre
    class Meta:
        verbose_name = "Direccion"
        verbose_name_plural = "Direcciones"

class Entrega(models.Model):
    def __str__(self):
        return self.nombre
    class Meta:
        verbose_name = "Entrega"
        verbose_name_plural = "Entregas"

class Pago(models.Model):
    def __str__(self):
        return self.nombre
    class Meta:
        verbose_name = "Pago"
        verbose_name_plural = "Pagos"

class Pedido(models.Model):
    def __str__(self):
        return self.nombre
    class Meta:
        verbose_name = "Pedido"
        verbose_name_plural = "Pedidos"

class DetallePedido(models.Model):
    def __str__(self):
        return self.nombre
    class Meta:
        verbose_name = "DetallePedido"
        verbose_name_plural = "DetallePedidos"