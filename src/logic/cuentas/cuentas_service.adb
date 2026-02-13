with Cuenta_Estado; use Cuenta_Estado;
with Cuentas; use Cuentas;

package body Cuentas_Service is

   procedure Bloquear_Cuenta (C : in out Cuentas.Cuenta_Type'Class) is
   begin
      Set_Estado (C, Bloqueada);
   end Bloquear_Cuenta;

   procedure Activar_Cuenta (C : in out Cuentas.Cuenta_Type'Class) is
   begin
      Set_Estado (C, Activa);
   end Activar_Cuenta;

   function Esta_Bloqueada (C : Cuentas.Cuenta_Type'Class) return Boolean is
   begin
      return Get_Estado (C) = Bloqueada;
   end Esta_Bloqueada;

   function Esta_Activa (C : Cuentas.Cuenta_Type'Class) return Boolean is
   begin
      return Get_Estado (C) = Activa;
   end Esta_Activa;

   function Puede_Realizar_Operacion
     (C         : Cuentas.Cuenta_Type'Class;
      Operacion : Transaccion.Estrategia_Transaccion) return Boolean
   is
   begin
      if Get_Estado (C) = Activa then
         return Estado_Activa_Singleton.Puede_Realizar_Operacion (Operacion);
      else
         return Estado_Bloqueada_Singleton.Puede_Realizar_Operacion (Operacion);
      end if;
   end Puede_Realizar_Operacion;

end Cuentas_Service;
