with Cuentas; use Cuentas;
with Transaccion; use Transaccion;
with Movimientos; use Movimientos;
with Length;

package Transaccion_Service is

   function Ejecutar_Transaccion
     (Estrategia    : I_Transaccion_Strategy'Class;
      C_Origen      : in out Cuenta_Type'Class;
      C_Destino     : in out Cuenta_Type'Class;
      Monto         : Saldo_Type;
      Descripcion   : String;
      Id_Movimiento : out Id_Movimiento_Type) return Boolean
     with Pre => (Monto > 0.0 and Monto <= Length.MAX_TRANSACCION) and
                 (Descripcion'Length <= Length.MAX_TEXTO_LARGO);

end Transaccion_Service;
