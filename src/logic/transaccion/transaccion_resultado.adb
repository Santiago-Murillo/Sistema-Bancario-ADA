package body Transaccion_Resultado is

   function Crear_Error
     (Codigo  : Transaccion_Error_Code;
      Mensaje : String;
      Tipo    : Estado_Operacion := Error_Estado) return Transaccion_Resultado_Type
   is
   begin
      return (Estado  => Tipo,
              Error   => Codigo,
              Mensaje => Crear_Mensaje (Mensaje));
   end Crear_Error;

end Transaccion_Resultado;
