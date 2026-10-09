# Análisis de Navegación y Estado - Ticketmaster

## 1. Mapa de navegación del MVP

La aplicación se va a mover principalmente a través de un menú de pestañas abajo (`TabView`), separando lo más importante en dos secciones:

- **Inicio (Home):** Es la pantalla principal donde buscas eventos y ves recomendaciones.
Si se le da clic a cualquier evento, la app lleva a la vista de **Detalle** (haciendo un "push" o navegación hacia adelante). 
- **Favoritos:** Es la pantalla donde se muestran todos los eventos que se guardaron localmente. Si se toca uno, también se puede ver su detalle o quitarlo de la lista.

---

## 2. Información por pantalla


### Pantalla Principal (Home)
- **Qué muestra:** La cabecera, la barra de búsqueda, los eventos destacados y las recomendaciones.
- **Qué recibe:** La lista de eventos que vienen de la API de Ticketmaster.
- **Qué modifica:** El texto que escribes en el buscador y la categoría que seleccionas.
- **Qué necesita conservar:** La categoría activa para no perder el filtro mientras buscas.

### Resultados de Búsqueda
- **Qué muestra:** Los estados de carga (skeletons) y la lista con los eventos que coinciden con tu búsqueda.
- **Qué recibe:** Lo que el usuario escribió y los datos que responde la API.
- **Qué modifica:** Los elementos que aparecen en la lista de resultados.
- **Qué necesita conservar:** El texto de la búsqueda actual por si hay que reintentar la conexión.

### Detalle de Evento
- **Qué muestra:** La foto del evento, el título, fecha, hora, lugar, ciudad y la descripción completa.
- **Qué recibe:** Toda la información del evento seleccionado.
- **Qué modifica:** Si el evento está guardado en favoritos o no (al presionar el botón).
- **Qué necesita conservar:** El identificador del evento para saber si ya estaba guardado localmente.

### Favoritos
- **Qué muestra:** La lista de eventos que guardaste o un mensaje de que está vacío si no hay nada.
- **Qué recibe:** Los eventos almacenados en el teléfono.
- **Qué modifica:** La lista cuando decides borrar un favorito.
- **Qué necesita conservar:** Que los datos no se borren aunque se cierre la app (persistencia local).

---

## 3. Organización del estado

- **Estado local (`@State`):** 
  - *Dónde vive:* En cada vista individual.
  - *Por qué:* Lo usaremos para cosas sencillas de esa pantalla que no afectan al resto, como lo que escribe en la barra de búsqueda o los estados de carga.
- **Estado de Favoritos (Persistencia local):**
  - *Dónde vive:* En un servicio o modelo separado del resto de las vistas.
  - *Por qué:* Como la lista de favoritos se tiene que ver y modificar tanto desde el inicio/detalle como desde la pestaña de favoritos, lo mejor es aislar esa lógica para que no se pierdan los datos al navegar entre pantallas.

---

## 4. Estrategia de navegación en SwiftUI


- **`TabView` (Pestañas):** Sirve para tener separadas las dos secciones principales (Inicio/Búsqueda y Favoritos).
- **`NavigationStack` (Navegación en profundidad):** Dentro de las pestañas para cuando se pase de la lista principal al detalle del evento.
- **`Link` / `OpenURLAction`:** Para abrir de forma nativa las páginas externas de Ticketmaster cuando el usuario quiera consultar o comprar entradas.