with Transaccion; use Transaccion;

package Cuenta_Estado is

   -- Modelo puro: solo define los estados y sus comportamientos básicos
   -- La lógica de negocio debe estar en Services

   type I_Cuenta_Estado is interface;

   function Puede_Realizar_Operacion
     (Self      : I_Cuenta_Estado;
      Operacion : Tipo_Estrategia) return Boolean is abstract;

   type Estado_Activa_Type is new I_Cuenta_Estado with null record;

   overriding
   function Puede_Realizar_Operacion
     (Self      : Estado_Activa_Type;
      Operacion : Tipo_Estrategia) return Boolean;

   type Estado_Bloqueada_Type is new I_Cuenta_Estado with null record;

   overriding
   function Puede_Realizar_Operacion
     (Self      : Estado_Bloqueada_Type;
      Operacion : Tipo_Estrategia) return Boolean;

end Cuenta_Estado;
