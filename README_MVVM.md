
# Análisis de MVVM y Arquitectura - Ticketmaster

## 1. ¿Por qué es conveniente separar responsabilidades?
Es conveniente porque si juntamos todo en un solo lugar, el código se vuelve muy difícil de mantener, probar y entender conforme la app va creciendo. Separar las responsabilidades sirve para que cada parte haga una sola cosa y funcione de manera correcta.

## 2. Diferencia entre interfaz, datos y lógica
- **Interfaz (UI):** Es todo lo visual que el usuario ve y toca.
- **Datos (Model):** Estructuras de información que maneja la app.
- **Lógica de la app:** Las reglas de negocio, como hacer peticiones a una API, filtrar resultados, validar campos o manejar los estados de carga.

## 3. ¿Qué problemas ocurren cuando una vista concentra demasiadas responsabilidades?
Se vuelven archivos gigantescos y difíciles de leer. Además, si se quiere cambiar algo del diseño rompe la lógica, y hacer pruebas unitarias se vuelve prácticamente imposible porque todo se llega a mezclar.

## 4. ¿Qué es cada componente de MVVM?
- **Model:** Estructura que guarda los datos.
- **View:** Pantalla visual en SwiftUI que muestra la interfaz y reacciona a las acciones del usuario.
- **ViewModel:** Intermediario que maneja la lógica de negocio y los estados de la pantalla, pasándole los datos limpios a la vista.

El proyecto está organizado de la siguiente manera:

- *Model:* Tenemos Evento.swift, donde guardamos los datos de cada evento.
- *Servicio:* En EventosServicio.swift simulamos la petición a la API de Ticketmaster para obtener los eventos.
- *ViewModel:* Por ahora solo tenemos FavoritosViewModel.swift, donde manejamos la lista de favoritos y la compartimos con las demás pantallas.
- *Vistas:* Tenemos InicioView, DetalleView, FavoritosView y otras vistas pequeñas que utilizamos dentro de ellas.

En el InicioView, realiza multiples cosas Por ejemplo:

- Obtiene los eventos mediante cargarEventos.
- Guarda el estado de carga y la lista de eventos.
- Filtra los eventos por categoría y por lo que el usuario escribe en el buscador, mediante filtrarEventos.

En FavoritosView pasa algo parecido, porque también tenemos la lógica para filtrar los favoritos según la búsqueda.
En InicioView y DetalleView se llega a repetir el código para generar la URL del botón de compra.

## Cosas a mejorar 

1. *Crear un InicioViewModel:* Poner la lista de eventos, el estado de carga y los métodos cargarEventos y filtrarEventos. Así, InicioView ya no tendría que encargarse de toda esa lógica y se concentraría más en mostrar la información.

2. *Mover el filtro de favoritos:* Pasarla lógica de búsqueda de favoritos a FavoritosViewModel, para que esa parte también quede separada de la vista.

3. *Evitar repetir el código de la URL de compra:* Como hacemos esto tanto en InicioView como en DetalleView, proponemos colocar la lógica dentro de Evento para no tener que repetirla en ambas pantallas.

4. *Dejar DetalleView sin un ViewModel propio:* Por el momento, creemos que no hace falta crear otro ViewModel para esta pantalla, porque recibe un evento y utiliza el de favoritos para esa funcionalidad. Así evitamos agregar más componentes si realmente no los necesitamos.

También se podria mejorar la organizacion las carpetas en Modelos, Servicios, ViewModels y Vistas, para tener los archivos mejor distribuidos y encontrar más fácilmente cada parte del proyecto.

## ¿Cómo funcionaría el flujo de información?

El objetivo es que cuando el usuario interactúa con una vista, esta le avisa al ViewModel. Por ejemplo, si hay que cargar los eventos, el ViewModel se encarga de pedírselos al servicio y guardar lo que reciba. Al usar `@Observable`, cualquier cambio en los datos se actualiza solito en la pantalla

Cada parte se queda con lo suyo: el Model guarda la estructura de los datos, el ViewModel maneja toda la lógica y el estado, y las vistas solo se limitan a mostrar la interfaz y reaccionar a lo que hace el usuario.
