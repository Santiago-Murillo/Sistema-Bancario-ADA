package body Transaccion_Tarjeta is

   -- Compra_Strategy
   overriding
   function Get_Tipo (Self : Compra_Strategy) return Tipo_Estrategia_Tarjeta is
      pragma Unreferenced (Self);
   begin
      return Compra;
   end Get_Tipo;

   overriding
   function Ejecutar (Self    : Compra_Strategy;
                      Tarjeta : in out Tarjeta_Credito_Type'Class;
                      Monto   : Saldo_Type) return Tarjeta_Resultado_Type
   is
      pragma Unreferenced (Self);
   begin
      if Monto > Get_Credito_Disponible (Tarjeta) then
         return Crear_Error (Limite_Excedido,
                             "Fondos insuficientes. Credito disponible: " &
                             Get_Credito_Disponible (Tarjeta)'Image);
      end if;

      Incrementar_Deuda (Tarjeta, Monto);
      return Crear_Exito;
   end Ejecutar;

   -- Pago_Tarjeta_Strategy
   overriding
   function Get_Tipo (Self : Pago_Tarjeta_Strategy) return Tipo_Estrategia_Tarjeta is
      pragma Unreferenced (Self);
   begin
      return Pago_Tarjeta;
   end Get_Tipo;

   overriding
   function Ejecutar (Self    : Pago_Tarjeta_Strategy;
                      Tarjeta : in out Tarjeta_Credito_Type'Class;
                      Monto   : Saldo_Type) return Tarjeta_Resultado_Type
   is
      pragma Unreferenced (Self);
   begin
      if Monto > Get_Saldo_Utilizado (Tarjeta) then
         return Crear_Error (Pago_Excede_Deuda,
                             "El monto del pago excede la deuda. Deuda actual: " &
                             Get_Saldo_Utilizado (Tarjeta)'Image);
      end if;

      Reducir_Deuda (Tarjeta, Monto);
      return Crear_Exito;
   end Ejecutar;

end Transaccion_Tarjeta;
