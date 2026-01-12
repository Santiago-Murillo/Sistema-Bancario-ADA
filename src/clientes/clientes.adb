package body Clientes is

   --  Procedimiento privado para copiar un string a un campo de tamaño fijo
   procedure Copiar_Campo (Destino : out String; Origen : String) is
   begin
      --  Inicializar con espacios en blanco
      Destino := (others => ' ');
      --  Copiar el contenido desde el origen
      Destino (Destino'First .. Destino'First + Origen'Length - 1) := Origen;
   end Copiar_Campo;

   --  Función privada: verificar si un campo está vacío o excede el límite
   function Esta_En_Rango (Campo : String; Maximo : Integer) return Boolean is
   begin
      return Campo'Length > 0 and then Campo'Length <= Maximo;
   end Esta_En_Rango;

   function Crear_Cliente (
      C         : out Cliente;
      Cedula    : String;
      Nombre    : String;
      Apellido  : String;
      Direccion : String;
      Correo    : String;
      Telefono  : String
   ) return Boolean is
   begin
      --  Validar que todos los campos sean válidos
      if not Esta_En_Rango (Cedula, MAX_CEDULA) then
         return False;
      end if;

      if not Esta_En_Rango (Nombre, MAX_NOMBRE) then
         return False;
      end if;

      if not Esta_En_Rango (Apellido, MAX_APELLIDO) then
         return False;
      end if;

      if not Esta_En_Rango (Direccion, MAX_DIRECCION) then
         return False;
      end if;

      if not Esta_En_Rango (Correo, MAX_CORREO) then
         return False;
      end if;

      if not Esta_En_Rango (Telefono, MAX_TELEFONO) then
         return False;
      end if;

      --  Copiar los datos validados al record
      Copiar_Campo (C.Cedula, Cedula);
      Copiar_Campo (C.Nombre, Nombre);
      Copiar_Campo (C.Apellido, Apellido);
      Copiar_Campo (C.Direccion, Direccion);
      Copiar_Campo (C.Correo, Correo);
      Copiar_Campo (C.Telefono, Telefono);

      return True;
   end Crear_Cliente;

   function Actualizar_Cliente (
      C         : in out Cliente;
      Nombre    : String;
      Apellido  : String;
      Direccion : String;
      Correo    : String;
      Telefono  : String
   ) return Boolean is
   begin
      --  Validar que todos los campos sean válidos
      if not Esta_En_Rango (Nombre, MAX_NOMBRE) then
         return False;
      end if;

      if not Esta_En_Rango (Apellido, MAX_APELLIDO) then
         return False;
      end if;

      if not Esta_En_Rango (Direccion, MAX_DIRECCION) then
         return False;
      end if;

      if not Esta_En_Rango (Correo, MAX_CORREO) then
         return False;
      end if;

      if not Esta_En_Rango (Telefono, MAX_TELEFONO) then
         return False;
      end if;

      --  Actualizar los campos del cliente
      Copiar_Campo (C.Nombre, Nombre);
      Copiar_Campo (C.Apellido, Apellido);
      Copiar_Campo (C.Direccion, Direccion);
      Copiar_Campo (C.Correo, Correo);
      Copiar_Campo (C.Telefono, Telefono);

      return True;
   end Actualizar_Cliente;

end Clientes;
