# Sistema Bancario ADA

Sistema bancario implementado en Ada como proyecto académico.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Ada](https://img.shields.io/badge/Ada-2012-blue.svg)](https://ada-lang.io/)

## Descripción

Este proyecto implementa un sistema bancario básico en el lenguaje de programación Ada. Actualmente incluye la gestión de clientes con operaciones de creación y actualización.

## Autores

- Santiago Murillo
- Bryan Guano

## Estado del proyecto

🚧 **En desarrollo** - Versión 0.1.0-dev

### Módulos implementados

| Módulo | Estado |
|--------|--------|
| Clientes | ✅ Implementado |
| Cuentas | ⏳ Pendiente |
| Cuenta de Ahorros | ⏳ Pendiente |
| Cuenta Corriente | ⏳ Pendiente |
| Tarjetas de Crédito | ⏳ Pendiente |
| Movimientos | ⏳ Pendiente |
| Entidad Financiera | ⏳ Pendiente |

## Requisitos

- [Alire](https://alire.ada.dev/) (gestor de paquetes de Ada)
- GNAT compiler (se instala automáticamente con Alire)

## Instalación

1. Instala Alire desde [https://alire.ada.dev/](https://alire.ada.dev/)

2. Clona este repositorio:
   ```bash
   git clone https://github.com/tu-usuario/Sistema-Bancario-ADA.git
   cd Sistema-Bancario-ADA
   ```

<!--
3. Descarga las dependencias:
   ```bash
   alr build
   ```
-->

## Compilar y ejecutar

```bash
alr build
alr run
```

*Nota:* Si tienes problemas al compilar o ejecutar, consulta la sección [Solución de problemas](#solución-de-problemas).

### Salida esperada

```
Cliente creado correctamente
--- Datos iniciales ---
Nombre   : Juan
Apellido : Perez
Correo   : juan@mail.com
Cliente actualizado correctamente
--- Datos actualizados ---
Nombre   : Juan Carlos
Apellido : Perez Gomez
Correo   : juan.c@mail.com
Validación correcta: No se permitió actualizar con nombre vacío
```

## Estructura del proyecto

```
Sistema-Bancario-ADA/
├── src/
│   ├── main.adb                    # Programa principal
│   ├── clientes/
│   │   ├── clientes.ads            # Especificación de clientes
│   │   └── clientes.adb            # Implementación de clientes
│   ├── cuentas/
│   │   ├── cuentas.ads             # Especificación de cuentas (pendiente)
│   │   ├── cuenta_ahorros.ads      # Cuenta de ahorros (pendiente)
│   │   └── cuenta_corriente.ads    # Cuenta corriente (pendiente)
│   ├── tarjetas/
│   │   └── tarjetas_credito.ads    # Tarjetas de crédito (pendiente)
│   ├── movimientos/
│   │   └── movimientos.ads         # Movimientos (pendiente)
│   └── entidad/
│       └── entidad_financiera.ads  # Entidad financiera (pendiente)
├── config/                         # Configuración del proyecto
├── bin/                            # Ejecutables compilados
├── obj/                            # Archivos objeto
├── alire.toml                      # Configuración de Alire
└── sistema_bancario.gpr            # Archivo de proyecto GNAT
```

## Solución de problemas

### Error: `alr` no se reconoce como comando

#### Para Windows:

Si al ejecutar `alr` obtienes un error indicando que el comando no se reconoce, necesitas añadir Alire a tu PATH.

**Solución:**

1. Abre las variables de entorno de Windows:
   - Presiona `Win + R`, escribe `sysdm.cpl` y presiona Enter
   - Ve a la pestaña "Opciones avanzadas"
   - Haz clic en "Variables de entorno"

2. En "Variables del sistema", selecciona `Path` y haz clic en "Editar"

3. Añade la ruta de instalación de Alire:
   ```
   C:\Program Files\Alire\bin\
   ```

4. Reinicia tu terminal para que los cambios surtan efecto

### Error: `ENCODING_ERROR` en Windows con OneDrive

Si tienes OneDrive configurado con una ruta que contiene caracteres especiales (como tildes), `gprconfig` puede fallar con:

```
Unrecoverable error in GPRconfig: raised ADA.STRINGS.UTF_ENCODING.ENCODING_ERROR
```

**Solución:** Usa el script `alr_fix.bat` incluido en el proyecto:

En **PowerShell**:
```powershell
.\alr_fix clean
.\alr_fix build
.\alr_fix run
```

En **Command Prompt (cmd)**:
```cmd
alr_fix clean
alr_fix build
alr_fix run
```

Este script limpia temporalmente las variables de entorno problemáticas antes de ejecutar Alire.

## Configuración de VS Code

Este proyecto incluye configuraciones de VS Code para facilitar el desarrollo en equipo.

### Extensiones recomendadas

Al abrir el proyecto, VS Code sugerirá instalar:

- **AdaCore.ada** Soporte oficial para Ada (sintaxis, autocompletado, depuración)
- **eamodio.gitlens** Historial de Git integrado

### Configuración del editor

El proyecto incluye ajustes para mantener consistencia en el código:

- Indentación de 3 espacios para archivos Ada
- Finales de línea Unix (LF)
- Eliminación automática de espacios en blanco al final de línea
- Archivos de compilación ocultos en el explorador

## Licencia

Este proyecto está licenciado bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.
