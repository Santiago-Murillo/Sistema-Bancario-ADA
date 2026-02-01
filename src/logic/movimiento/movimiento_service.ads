
with Model.Movimiento;
with Model.Cuentas;
with Length;

package Logic.Movimiento_Service is

   -- TODO: Definir excepciones específicas (también en el diccionario)
   Transaccion_Invalida : exception;

   procedure Deposito
     (Id_Mov          : Model.Movimiento.Id_Movimiento_Type;
      Cuenta_Destino : in out Model.Cuentas.Cuenta_Type;
      Monto           : Model.Movimiento.Dinero_Type;
      Descripcion     : String;
      Resultado       : out Model.Movimiento.Movimiento_Type)
   with
      Pre =>
         Monto > 0.0 and
         Descripcion'Length <= Length.MAX_TEXTO_LARGO;

   procedure Retiro
     (Id_Mov       : Model.Movimiento.Id_Movimiento_Type;
      Cuenta_Origen : in out Model.Cuentas.Cuenta_Type;
      Monto        : Model.Movimiento.Dinero_Type;
      Descripcion  : String;
      Resultado    : out Model.Movimiento.Movimiento_Type)
   with
      Pre =>
         Monto > 0.0 and
         Descripcion'Length <= Shared_Types.MAX_TEXTO_LARGO;
         -- Nota: La validación de saldo suficiente se delega al paquete Cuentas

   procedure Transferencia
     (Id_Mov        : Model.Movimiento.Id_Movimiento_Type;
      Cuenta_Origen  : in out Model.Cuentas.Cuenta_Type;
      Cuenta_Destino : in out Model.Cuentas.Cuenta_Type;
      Monto          : Model.Movimiento.Dinero_Type;
      Descripcion    : String;
      Resultado      : out Model.Movimiento.Movimiento_Type)
   with
      Pre =>
         Monto > 0.0 and
         Model.Cuentas.Get_Id(Cuenta_Origen) /= Model.Cuentas.Get_Id(Cuenta_Destino);

end Logic.Transacciones;
