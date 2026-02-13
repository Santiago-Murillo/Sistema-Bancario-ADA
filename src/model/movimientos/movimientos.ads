with Ada.Calendar;
with Ada.Strings.Bounded;
with Length;
with Cuentas; use Cuentas;
with Transaccion;

package Movimientos is

   MAX_DESCRIPCION : constant := Length.MAX_TEXTO_LARGO;

   subtype Id_Movimiento_Type is Natural range 1 .. Natural'Last;
   subtype Dinero_Type is Cuentas.Saldo_Type;
   subtype Numero_Cuenta_Type is String (1 .. Length.MAX_NUMERO_CUENTA);
   package Descripcion_Str is new Ada.Strings.Bounded.Generic_Bounded_Length (Max => Length.MAX_TEXTO_LARGO);
   use Descripcion_Str;

   type Movimiento_Type is private;

   function Crear_Movimiento
     (Id           : Id_Movimiento_Type;
      Monto        : Dinero_Type;
      Descripcion  : String;
      Tipo_Transaccion : Transaccion.Estrategia_Transaccion;
      Cuenta_Origen : Numero_Cuenta_Type;
      Cuenta_Destino : Numero_Cuenta_Type)
      return Movimiento_Type
   with
      Pre =>
        (Monto > 0.0 and Monto <= Length.MAX_TRANSACCION) and
        (Descripcion'Length <= Length.MAX_TEXTO_LARGO);

   function Get_Id (M : Movimiento_Type) return Id_Movimiento_Type;
   function Get_Monto (M : Movimiento_Type) return Dinero_Type;
   function Get_Fecha (M : Movimiento_Type) return Ada.Calendar.Time;
   function Get_Descripcion (M : Movimiento_Type) return String;

   function Get_Origen (M : Movimiento_Type) return Numero_Cuenta_Type;
   function Get_Destino (M : Movimiento_Type) return Numero_Cuenta_Type;
   function Get_Tipo_Transaccion (M : Movimiento_Type) return Transaccion.Estrategia_Transaccion;

private

   type Movimiento_Type is record
      Id           : Id_Movimiento_Type;
      Monto        : Dinero_Type;
      Fecha        : Ada.Calendar.Time;
      Descripcion  : Bounded_String;
      Tipo_Transaccion : Transaccion.Estrategia_Transaccion;
      Cuenta_Origen  : Numero_Cuenta_Type;
      Cuenta_Destino : Numero_Cuenta_Type;
   end record;

end Movimientos;
