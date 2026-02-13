package body Movimientos is

   function Crear_Movimiento
     (Id            : Id_Movimiento_Type;
      Monto         : Dinero_Type;
      Descripcion   : String;
      Tipo_Transaccion : Transaccion.Estrategia_Transaccion;
      Cuenta_Origen : Numero_Cuenta_Type;
      Cuenta_Destino : Numero_Cuenta_Type)
      return Movimiento_Type
   is
      Desc_Bounded : constant Bounded_String := To_Bounded_String (Descripcion);
      Ahora        : constant Ada.Calendar.Time := Ada.Calendar.Clock;
   begin
      return (Id               => Id,
              Monto            => Monto,
              Fecha            => Ahora,
              Descripcion      => Desc_Bounded,
              Tipo_Transaccion => Tipo_Transaccion,
              Cuenta_Origen    => Cuenta_Origen,
              Cuenta_Destino   => Cuenta_Destino);
   end Crear_Movimiento;

   function Get_Id (M : Movimiento_Type) return Id_Movimiento_Type is
   begin
      return M.Id;
   end Get_Id;

   function Get_Monto (M : Movimiento_Type) return Dinero_Type is
   begin
      return M.Monto;
   end Get_Monto;

   function Get_Fecha (M : Movimiento_Type) return Ada.Calendar.Time is
   begin
      return M.Fecha;
   end Get_Fecha;

   function Get_Descripcion (M : Movimiento_Type) return String is
   begin
      return To_String (M.Descripcion);
   end Get_Descripcion;

   function Get_Origen (M : Movimiento_Type) return Numero_Cuenta_Type is
   begin
      return M.Cuenta_Origen;
   end Get_Origen;

   function Get_Destino (M : Movimiento_Type) return Numero_Cuenta_Type is
   begin
      return M.Cuenta_Destino;
   end Get_Destino;

   function Get_Tipo_Transaccion (M : Movimiento_Type) return Transaccion.Estrategia_Transaccion is
   begin
      return M.Tipo_Transaccion;
   end Get_Tipo_Transaccion;

end Movimientos;
