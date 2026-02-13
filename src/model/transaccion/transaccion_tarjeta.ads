with Tarjeta_Credito;
with Length;

package Transaccion_Tarjeta is

   use Tarjeta_Credito;

   -- Interfaz para estrategias de tarjeta (separada de I_Transaccion_Strategy)
   type I_Transaccion_Tarjeta_Strategy is interface;

   type Tipo_Estrategia_Tarjeta is (Compra, Pago_Tarjeta);

   function Get_Tipo (Self : I_Transaccion_Tarjeta_Strategy)
      return Tipo_Estrategia_Tarjeta is abstract;

   procedure Ejecutar (Self    : I_Transaccion_Tarjeta_Strategy;
                       Tarjeta : in out Tarjeta_Credito_Type'Class;
                       Monto   : Saldo_Type) is abstract
     with
       Pre'Class => Monto > 0.0 and Monto <= Length.MAX_TRANSACCION;

   -- Estrategia de Compra
   type Compra_Strategy is new I_Transaccion_Tarjeta_Strategy with null record;

   overriding
   function Get_Tipo (Self : Compra_Strategy) return Tipo_Estrategia_Tarjeta;

   overriding
   procedure Ejecutar (Self    : Compra_Strategy;
                       Tarjeta : in out Tarjeta_Credito_Type'Class;
                       Monto   : Saldo_Type)
     with
       Pre => Monto <= Get_Credito_Disponible (Tarjeta),
       Post => Get_Saldo_Utilizado (Tarjeta) = Get_Saldo_Utilizado (Tarjeta)'Old + Monto;

   -- Estrategia de Pago
   type Pago_Tarjeta_Strategy is new I_Transaccion_Tarjeta_Strategy with null record;

   overriding
   function Get_Tipo (Self : Pago_Tarjeta_Strategy) return Tipo_Estrategia_Tarjeta;

   overriding
   procedure Ejecutar (Self    : Pago_Tarjeta_Strategy;
                       Tarjeta : in out Tarjeta_Credito_Type'Class;
                       Monto   : Saldo_Type)
     with
       Pre => Monto <= Get_Saldo_Utilizado (Tarjeta),
       Post => Get_Saldo_Utilizado (Tarjeta) = Get_Saldo_Utilizado (Tarjeta)'Old - Monto;

end Transaccion_Tarjeta;
