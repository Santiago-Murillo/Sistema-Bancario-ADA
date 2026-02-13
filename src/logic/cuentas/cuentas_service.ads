with Cuentas;
with Transaccion;

package Cuentas_Service is

   -- Service: contiene la lógica de negocio relacionada con Cuentas
   -- Separación de responsabilidades: el modelo solo tiene datos,
   -- el service tiene la lógica de negocio

   -- Operaciones de negocio sobre el estado
   procedure Bloquear_Cuenta (C : in out Cuentas.Cuenta_Type'Class);

   procedure Activar_Cuenta (C : in out Cuentas.Cuenta_Type'Class);

   -- Consultas sobre el estado
   function Esta_Bloqueada (C : Cuentas.Cuenta_Type'Class) return Boolean;

   function Esta_Activa (C : Cuentas.Cuenta_Type'Class) return Boolean;

   function Puede_Realizar_Operacion
     (C         : Cuentas.Cuenta_Type'Class;
      Operacion : Transaccion.Tipo_Estrategia) return Boolean;

end Cuentas_Service;
