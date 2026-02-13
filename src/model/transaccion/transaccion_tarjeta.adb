package body Transaccion_Tarjeta is

   -- Compra_Strategy
   overriding
   function Get_Tipo (Self : Compra_Strategy) return Tipo_Estrategia_Tarjeta is
      pragma Unreferenced (Self);
   begin
      return Compra;
   end Get_Tipo;

   overriding
   procedure Ejecutar (Self    : Compra_Strategy;
                       Tarjeta : in out Tarjeta_Credito_Type'Class;
                       Monto   : Saldo_Type)
   is
      pragma Unreferenced (Self);
   begin
      -- La precondición ya verifica que hay crédito disponible
      Incrementar_Deuda (Tarjeta, Monto);
   end Ejecutar;

   -- Pago_Tarjeta_Strategy
   overriding
   function Get_Tipo (Self : Pago_Tarjeta_Strategy) return Tipo_Estrategia_Tarjeta is
      pragma Unreferenced (Self);
   begin
      return Pago_Tarjeta;
   end Get_Tipo;

   overriding
   procedure Ejecutar (Self    : Pago_Tarjeta_Strategy;
                       Tarjeta : in out Tarjeta_Credito_Type'Class;
                       Monto   : Saldo_Type)
   is
      pragma Unreferenced (Self);
   begin
      -- La precondición ya verifica que el monto no excede la deuda
      Reducir_Deuda (Tarjeta, Monto);
   end Ejecutar;

end Transaccion_Tarjeta;
