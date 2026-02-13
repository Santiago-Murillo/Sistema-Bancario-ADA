package body Clientes is

   function Crear_Cliente
     (Cedula        : String;
      Nombre        : String;
      Apellido      : String;
      Direccion     : String;
      Correo        : String;
      Telefono      : String;
      Numero_Cuenta : Numero_Cuenta_Type)
      return Cliente_Type
   is
   begin
      return Cliente_Type'(
         Cedula        => Cedula,
         Nombre        => Nombres_Str.To_Bounded_String (Nombre),
         Apellido      => Nombres_Str.To_Bounded_String (Apellido),
         Direccion     => Direccion_Str.To_Bounded_String (Direccion),
         Correo        => Nombres_Str.To_Bounded_String (Correo),
         Telefono      => Telefono_Str.To_Bounded_String (Telefono),
         Numero_Cuenta => Numero_Cuenta,
         Id_Tarjeta    => 0  -- Sin tarjeta por defecto
      );
   end Crear_Cliente;

   function Get_Cedula (C : Cliente_Type) return String is
   begin
      return C.Cedula;
   end Get_Cedula;

   function Get_Nombre (C : Cliente_Type) return String is
   begin
      return Nombres_Str.To_String (C.Nombre);
   end Get_Nombre;

   function Get_Apellido (C : Cliente_Type) return String is
   begin
      return Nombres_Str.To_String (C.Apellido);
   end Get_Apellido;

   function Get_Direccion (C : Cliente_Type) return String is
   begin
      return Direccion_Str.To_String (C.Direccion);
   end Get_Direccion;

   function Get_Correo (C : Cliente_Type) return String is
   begin
      return Nombres_Str.To_String (C.Correo);
   end Get_Correo;

   function Get_Telefono (C : Cliente_Type) return String is
   begin
      return Telefono_Str.To_String (C.Telefono);
   end Get_Telefono;

   function Get_Numero_Cuenta (C : Cliente_Type) return Numero_Cuenta_Type is
   begin
      return C.Numero_Cuenta;
   end Get_Numero_Cuenta;

   function Get_Id_Tarjeta (C : Cliente_Type) return Natural is
   begin
      return C.Id_Tarjeta;
   end Get_Id_Tarjeta;

   procedure Set_Id_Tarjeta (C : in out Cliente_Type; Id_Tarjeta : Natural) is
   begin
      C.Id_Tarjeta := Id_Tarjeta;
   end Set_Id_Tarjeta;

end Clientes;
