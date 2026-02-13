with Ada.Calendar;
with Ada.Strings.Bounded;
with Length;

package Movimientos is

   MAX_DESCRIPCION : constant := Length.MAX_TEXTO_LARGO;

   subtype Id_Movimiento_Type is Natural range 1 .. Natural'Last;
   type Dinero_Type is delta 0.01 digits Length.MAX_DINERO;
   package Descripcion_Str is new Ada.Strings.Bounded.Generic_Bounded_Length (Max => Length.MAX_TEXTO_LARGO);
   use Descripcion_Str;

   type Movimiento_Type is private;

   function Crear_Movimiento
     (Id           : Id_Movimiento_Type;
      Monto        : Dinero_Type;
      Descripcion  : String;
      Monto_Maximo : Dinero_Type;
      Cuenta_Origen : Natural := 0;
      Cuenta_Destino : Natural := 0)
      return Movimiento_Type
   with
      Pre =>
        (Descripcion'Length <= Length.MAX_TEXTO_LARGO);

   function Get_Id (M : Movimiento_Type) return Id_Movimiento_Type;
   function Get_Monto (M : Movimiento_Type) return Dinero_Type;
   function Get_Fecha (M : Movimiento_Type) return Ada.Calendar.Time;
   function Get_Descripcion (M : Movimiento_Type) return String;

   function Get_Origen (M : Movimiento_Type) return Natural;
   function Get_Destino (M : Movimiento_Type) return Natural;

private

   type Movimiento_Type is record
      Id           : Id_Movimiento_Type;
      Monto        : Dinero_Type;
      Fecha        : Ada.Calendar.Time;
      Descripcion  : Bounded_String;
      Monto_Maximo : Dinero_Type;
      Cuenta_Origen  : Natural;
      Cuenta_Destino : Natural;
   end record;

end Movimientos;
