with Tarjeta_Credito_Service;

package body Transaccion_Tarjeta is

   Limite_Credito_Excedido : exception renames
     Tarjeta_Credito_Service.Limite_Credito_Excedido;
   Pago_Invalido : exception renames
     Tarjeta_Credito_Service.Pago_Invalido;

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
      if Monto > Get_Credito_Disponible (Tarjeta) then
         raise Limite_Credito_Excedido with
           "Fondos insuficientes. Crédito disponible: " &
           Get_Credito_Disponible (Tarjeta)'Image;
      end if;

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
      if Monto > Get_Saldo_Utilizado (Tarjeta) then
         raise Pago_Invalido with
           "El monto del pago excede la deuda. Deuda actual: " &
           Get_Saldo_Utilizado (Tarjeta)'Image;
      end if;

      Reducir_Deuda (Tarjeta, Monto);
   end Ejecutar;

end Transaccion_Tarjeta;
