package body Clientes_Service is

   package Cli renames Clientes;

   function Esta_En_Rango (Campo : String; Maximo : Integer) return Boolean is
   begin
      return Campo'Length > 0 and then Campo'Length <= Maximo;
   end Esta_En_Rango;

   procedure Crear_Cliente
     (Resultado : out Cli.Cliente_Type;
      Cedula    : String;
      Nombre    : String;
      Apellido  : String;
      Direccion : String;
      Correo    : String;
      Telefono  : String)
   is
   begin
      if not Esta_En_Rango (Cedula, Cli.MAX_CEDULA) then
         raise Datos_Invalidos with "Cedula fuera de rango";
      end if;

      if not Esta_En_Rango (Nombre, Cli.MAX_NOMBRE) then
         raise Datos_Invalidos with "Nombre fuera de rango";
      end if;

      if not Esta_En_Rango (Apellido, Cli.MAX_APELLIDO) then
         raise Datos_Invalidos with "Apellido fuera de rango";
      end if;

      if not Esta_En_Rango (Direccion, Cli.MAX_DIRECCION) then
         raise Datos_Invalidos with "Direccion fuera de rango";
      end if;

      if not Esta_En_Rango (Correo, Cli.MAX_CORREO) then
         raise Datos_Invalidos with "Correo fuera de rango";
      end if;

      if not Esta_En_Rango (Telefono, Cli.MAX_TELEFONO) then
         raise Datos_Invalidos with "Telefono fuera de rango";
      end if;

      --  Usar la función Crear_Cliente del modelo
      Resultado := Cli.Crear_Cliente
        (Cedula    => Cedula,
         Nombre    => Nombre,
         Apellido  => Apellido,
         Direccion => Direccion,
         Correo    => Correo,
         Telefono  => Telefono,
         Id_Cuenta => 1);  --  ID por defecto
   end Crear_Cliente;

   procedure Actualizar_Cliente
     (Cliente   : in out Cli.Cliente_Type;
      Nombre    : String;
      Apellido  : String;
      Direccion : String;
      Correo    : String;
      Telefono  : String)
   is
      Cedula_Actual : constant String := Cli.Get_Cedula (Cliente);
      Id_Actual     : constant Cli.Id_Cuenta_Type := Cli.Get_Id_Cuenta (Cliente);
   begin
      if not Esta_En_Rango (Nombre, Cli.MAX_NOMBRE) then
         raise Datos_Invalidos with "Nombre fuera de rango";
      end if;

      if not Esta_En_Rango (Apellido, Cli.MAX_APELLIDO) then
         raise Datos_Invalidos with "Apellido fuera de rango";
      end if;

      if not Esta_En_Rango (Direccion, Cli.MAX_DIRECCION) then
         raise Datos_Invalidos with "Direccion fuera de rango";
      end if;

      if not Esta_En_Rango (Correo, Cli.MAX_CORREO) then
         raise Datos_Invalidos with "Correo fuera de rango";
      end if;

      if not Esta_En_Rango (Telefono, Cli.MAX_TELEFONO) then
         raise Datos_Invalidos with "Telefono fuera de rango";
      end if;

      --  Recrear el cliente con los nuevos datos
      Cliente := Cli.Crear_Cliente
        (Cedula    => Cedula_Actual,
         Nombre    => Nombre,
         Apellido  => Apellido,
         Direccion => Direccion,
         Correo    => Correo,
         Telefono  => Telefono,
         Id_Cuenta => Id_Actual);
   end Actualizar_Cliente;

end Clientes_Service;
