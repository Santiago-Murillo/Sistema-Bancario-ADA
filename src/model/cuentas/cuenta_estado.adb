package body Cuenta_Estado is

   overriding
   function Puede_Realizar_Operacion
     (Self      : Estado_Activa_Type;
      Operacion : Estrategia_Transaccion) return Boolean
   is
      pragma Unreferenced (Self);
      pragma Unreferenced (Operacion);
   begin
      -- Estado Activa: permite todas las operaciones
      return True;
   end Puede_Realizar_Operacion;

   overriding
   function Puede_Realizar_Operacion
     (Self      : Estado_Bloqueada_Type;
      Operacion : Estrategia_Transaccion) return Boolean
   is
      pragma Unreferenced (Self);
   begin
      -- Estado Bloqueada: solo permite Depósito
      case Operacion is
         when Deposito =>
            return True;
         when Retiro | Transferencia =>
            return False;
      end case;
   end Puede_Realizar_Operacion;

end Cuenta_Estado;
