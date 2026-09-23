-
# Ticketmaster
## Integrantes

- Andriano Calles Lilian Dayana
- Garcia Cortina Melissa

## Nombre del proyecto

**Ticketmaster**

## Descripción del proyecto

TicketmasterApp es una aplicación iOS desarrollada en SwiftUI que permite explorar eventos musicales, deportivos y artísticos mediante la integración con la API de Ticketmaster, consultar su información detallada y administrar una lista de eventos favoritos guardados localmente.

La aplicación estará desarrollada principalmente con SwiftUI.

## Objetivo

Permitir que el usuario explore y busque eventos, consulte sus datos principales (fecha, hora, lugar, ciudad), acceda a enlaces externos para consultar y gestione una colección personal de favoritos con persistencia local.

## Funcionalidades del MVP

La aplicación incluirá:
Una pantalla principal con una lista de eventos desde Ticketmaster (con imagen, nombre, fecha y lugar).
- Búsqueda de eventos y visualización de resultados.
- Visualización del detalle de cada evento:
  - Nombre e imagen del evento.
  - Fecha y hora.
  - Venue (lugar) y ciudad.
  - Información disponible e imágenes de la API.
- Enlace externo para consultar o comprar entradas cuando el dato esté disponible.
- Opción para agregar eventos a favoritos.
- Opción para quitar eventos de favoritos.
- Una sección o pestaña de "Favoritos".
- Persistencia local de los eventos favoritos.
- Manejo de estados de carga (loading).
- Manejo de búsquedas sin resultados.
- Manejo de estados de favoritos vacíos.
## Flujo de usuario

La aplicación estructurará su navegación principalmente a través de:

- **Inicio** (Exploración, categorías y barra de búsqueda)
- **Favoritos** (Gestión de eventos guardados localmente)

Desde la pantalla principal, el usuario podrá explorar los eventos destacados o recomendaciones, seleccionar un evento directamente para consultar su detalle, o utilizar el buscador integrado.

Al realizar una búsqueda, la aplicación consultará la API de Ticketmaster y mostrará los resultados correspondientes en formato de lista. Al seleccionar un resultado, el usuario accederá a la vista de detalle.

Desde la pantalla de detalle, el usuario podrá interactuar con el estado de favoritos:
- Agregar el evento a favoritos si aún no está guardado.
- Quitar el evento de favoritos si ya se encuentra almacenado.
- Acceder al enlace externo para la compra o consulta de entradas.

Wireframes

Los siguientes elementos representan la estructura visual y los flujos de las principales pantallas de la aplicación:
### Pantalla Inicio de sesión (Login)
Contiene los campos de acceso para nombre y contraseña, junto con los botones para iniciar sesión y la opción de recuperación `¿Olvidaste tu contraseña?`, y botón 'Registrarse'.
<img width="414" height="896" alt="Proyecto" src="https://github.com/user-attachments/assets/ae6c7041-4d15-4cad-9b67-0cb99682269e" />
  

### Pantalla Crear cuenta (Log up)
Muestra la sección para registrarse ingresando nombre, correo electrónico y contraseña, incluyendo un enlace de redirección rápida `¿Ya tienes cuenta? Presiona aqui`.
<img width="414" height="896" alt="Crearcuenta" src="https://github.com/user-attachments/assets/192b7d72-ae69-44da-b851-e326c685ff5e" />
    
  

### Pantalla principal (Home)
Contiene la barra de búsqueda, eventos destacados y recomendaciones.
<img width="414" height="896" alt="Inicio" src="https://github.com/user-attachments/assets/e3e95691-47bc-42f9-a649-3d9c5c282af0" />

      

### Resultados de búsqueda y búsqueda en progreso
Muestra los estados de carga mediante skeletons y la lista filtrada de eventos según el término ingresado.
<img width="414" height="896" alt="EsperaCarga" src="https://github.com/user-attachments/assets/d00677d9-b798-4f70-9293-f71ed65c4159" />

Carga completa
<img width="414" height="896" alt="CargaCompleta" src="https://github.com/user-attachments/assets/a1efc084-c840-4e57-aa25-9d365c37a36b" />

### Detalle de evento
Muestra la información completa del evento (imagen, nombre, fecha/hora, sinopsis) y el botón de enlace externo para entradas.
<img width="414" height="896" alt="DetalleEvento" src="https://github.com/user-attachments/assets/d28a2dab-cf66-4199-a522-8c589166a94a" />

### Favoritos
Muestra los eventos que el usuario ha guardado localmente en la aplicación.
<img width="414" height="896" alt="Favorito" src="https://github.com/user-attachments/assets/2f1323cc-6338-4b7e-a6a4-8595aba2cc1a" />


## Tecnologías previstas

- Swift
- SwiftUI
- Ticketmaster API
- Navegación con SwiftUI
- Programación asíncrona con async/await
- Manejo de Red (Networking) independiente de las vistas
- Persistencia local
- Pruebas unitarias (Unit Tests)
- Git y GitHub

## Estado actual del proyecto

Actualmente se encuentran definidos:

- El objetivo del proyecto.
- El MVP.
- El flujo principal de usuario.
- Los wireframes iniciales.
