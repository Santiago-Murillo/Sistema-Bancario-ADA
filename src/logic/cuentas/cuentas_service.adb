with Cuenta_Estado; use Cuenta_Estado;
with Cuentas; use Cuentas;

package body Cuentas_Service is

   -- Lógica de negocio: maneja operaciones sobre el estado de cuentas

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
      Operacion : Transaccion.Tipo_Estrategia) return Boolean
   is
      -- Lógica de negocio: crea el objeto de estado correspondiente
      -- y delega la validación según el patrón State
      Estado_Obj : I_Cuenta_Estado'Class :=
        (if Get_Estado (C) = Activa
         then I_Cuenta_Estado'Class (Estado_Activa_Type'(null record))
         else I_Cuenta_Estado'Class (Estado_Bloqueada_Type'(null record)));
   begin
      return Estado_Obj.Puede_Realizar_Operacion (Operacion);
   end Puede_Realizar_Operacion;

end Cuentas_Service;
