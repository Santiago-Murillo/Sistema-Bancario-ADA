with Tarjeta_Credito;
with Transaccion_Tarjeta;
with Length;

package Tarjeta_Credito_Service is

   use Tarjeta_Credito;
   use Length;

   -- Excepciones
   Limite_Credito_Excedido : exception;
   Pago_Invalido : exception;
   Tarjeta_Vencida : exception;
   Tarjeta_No_Encontrada : exception;
   Tarjeta_Con_Deuda : exception;

   -- === OPERACIONES CRUD ===

   function Crear_Tarjeta
     (Tasa_Interes_Mensual  : Tasa_Interes_Type := Length.DEFAULT_TASA_INTERES_TARJETA)
      return Tarjeta_Credito_Access;

   function Obtener_Tarjeta (Id_Tarjeta : Natural) return Tarjeta_Credito_Access
   with
      Pre => Id_Tarjeta > 0;

   procedure Actualizar_Limite_Credito
     (Id_Tarjeta    : Natural;
      Nuevo_Limite  : Limite_Credito_Type)
   with
      Pre => Id_Tarjeta > 0 and Nuevo_Limite > 0.0;

   procedure Eliminar_Tarjeta (Id_Tarjeta : Natural)
   with
      Pre => Id_Tarjeta > 0;

   -- === OPERACIONES DE NEGOCIO ===

   procedure Realizar_Compra
     (Id_Tarjeta  : Natural;
      Monto       : Saldo_Type;
      Descripcion : String)
   with
      Pre => Id_Tarjeta > 0 and Monto > 0.0;

   procedure Realizar_Pago
     (Id_Tarjeta : Natural;
      Monto      : Saldo_Type)
   with
      Pre => Id_Tarjeta > 0 and Monto > 0.0;

   procedure Calcular_Aplicar_Interes (Id_Tarjeta : Natural)
   with
      Pre => Id_Tarjeta > 0;

   function Consultar_Estado_Tarjeta (Id_Tarjeta : Natural) return String
   with
      Pre => Id_Tarjeta > 0;

end Tarjeta_Credito_Service;
