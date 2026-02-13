with Cuentas_Service;

package body Transaccion_Service is

   Ultimo_Id_Movimiento : Id_Movimiento_Type := 1;

   function Ejecutar_Transaccion
     (Estrategia    : I_Transaccion_Strategy'Class;
      C_Origen      : in out Cuenta_Type'Class;
      C_Destino     : in out Cuenta_Type'Class;
      Monto         : Saldo_Type;
      Descripcion   : String;
      Id_Movimiento : out Id_Movimiento_Type) return Boolean
   is
      Movimiento : Movimiento_Type;
   begin
      -- Lógica de negocio: validar estado usando Cuentas_Service
      if not Cuentas_Service.Puede_Realizar_Operacion (C_Origen, Estrategia.Get_Tipo) then
         return False;  -- Operación no permitida por estado de cuenta
      end if;

      -- Para transferencias, validar que la cuenta destino pueda recibir depósitos
      if Estrategia.Get_Tipo = Transferencia then
         if not Cuentas_Service.Puede_Realizar_Operacion (C_Destino, Deposito) then
            return False;  -- Cuenta destino no puede recibir depósitos
         end if;
      end if;

      -- Ejecutar la estrategia
      Estrategia.Ejecutar(C_Origen, C_Destino, Monto);

      -- Crear el registro del movimiento
      Movimiento := Crear_Movimiento
        (Id               => Ultimo_Id_Movimiento,
         Monto            => Monto,
         Descripcion      => Descripcion,
         Tipo_Transaccion => Estrategia.Get_Tipo,
         Cuenta_Origen    => Get_Numero_Cuenta (C_Origen),
         Cuenta_Destino   => Get_Numero_Cuenta (C_Destino));

      Id_Movimiento := Ultimo_Id_Movimiento;
      Ultimo_Id_Movimiento := Ultimo_Id_Movimiento + 1;

      return True;  -- Operación ejecutada exitosamente
   end Ejecutar_Transaccion;

end Transaccion_Service;
