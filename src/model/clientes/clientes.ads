package Clientes is
   --  Trazabilidad Diccionario de Datos
   MAX_CEDULA    : constant := 10;   --  CHAR(10)
   MAX_NOMBRE    : constant := 52;   --  VARCHAR(52)
   MAX_APELLIDO  : constant := 52;   --  VARCHAR(52)
   MAX_DIRECCION : constant := 152;  --  VARCHAR(152)
   MAX_CORREO    : constant := 52;   --  VARCHAR(52)
   MAX_TELEFONO  : constant := 15;   --  VARCHAR(15)

   --  Record: Estructura que contiene los datos de un cliente
   type Cliente is record
      Cedula    : String (1 .. MAX_CEDULA);
      Nombre    : String (1 .. MAX_NOMBRE);
      Apellido  : String (1 .. MAX_APELLIDO);
      Direccion : String (1 .. MAX_DIRECCION);
      Correo    : String (1 .. MAX_CORREO);
      Telefono  : String (1 .. MAX_TELEFONO);
   end record;

   --  Crear_Cliente: Crea un nuevo cliente con validaciones
   --  Parámetros:
   --    C: Record donde se almacenarán los datos del cliente
   --    Cedula, Nombre, Apellido, etc.: Datos del cliente
   --  Retorna: True si el cliente fue creado exitosamente, False si hay error
   function Crear_Cliente (
      C         : out Cliente;
      Cedula    : String;
      Nombre    : String;
      Apellido  : String;
      Direccion : String;
      Correo    : String;
      Telefono  : String
   ) return Boolean;

   --  Actualizar_Cliente: Modifica los datos de un cliente existente
   --  Parámetros:
   --    C: Record del cliente a actualizar
   --    Nombre, Apellido, etc.: Nuevos datos del cliente
   --  Retorna: True si la actualización fue exitosa, False si hay error
   function Actualizar_Cliente (
      C         : in out Cliente;
      Nombre    : String;
      Apellido  : String;
      Direccion : String;
      Correo    : String;
      Telefono  : String
   ) return Boolean;

end Clientes;
