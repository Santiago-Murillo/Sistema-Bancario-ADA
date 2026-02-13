with Cuentas;
with Transaccion;
with Cuenta_Estado;

package Cuentas_Service is
   -- Operaciones de negocio sobre el estado
   procedure Bloquear_Cuenta (C : in out Cuentas.Cuenta_Type'Class);

   procedure Activar_Cuenta (C : in out Cuentas.Cuenta_Type'Class);

   -- Consultas sobre el estado
   function Esta_Bloqueada (C : Cuentas.Cuenta_Type'Class) return Boolean;

   function Esta_Activa (C : Cuentas.Cuenta_Type'Class) return Boolean;

   function Puede_Realizar_Operacion
     (C         : Cuentas.Cuenta_Type'Class;
      Operacion : Transaccion.Tipo_Estrategia) return Boolean;

private
   Estado_Activa_Singleton    : constant Cuenta_Estado.Estado_Activa_Type := (null record);
   Estado_Bloqueada_Singleton : constant Cuenta_Estado.Estado_Bloqueada_Type := (null record);

end Cuentas_Service;
