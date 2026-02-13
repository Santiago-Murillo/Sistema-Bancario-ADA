package body Tarjeta_Resultado is

   function Crear_Error
     (Codigo  : Tarjeta_Error_Code;
      Mensaje : String;
      Tipo    : Estado_Operacion := Error_Negocio) return Tarjeta_Resultado_Type
   is
   begin
      return (Estado  => Tipo,
              Error   => Codigo,
              Mensaje => Crear_Mensaje (Mensaje));
   end Crear_Error;

end Tarjeta_Resultado;
