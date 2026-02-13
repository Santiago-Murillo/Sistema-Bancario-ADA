package body Cuenta_Resultado is

   function Crear_Error
     (Codigo  : Cuenta_Error_Code;
      Mensaje : String;
      Tipo    : Estado_Operacion := Error_Negocio) return Cuenta_Resultado_Type
   is
   begin
      return (Estado  => Tipo,
              Error   => Codigo,
              Mensaje => Crear_Mensaje (Mensaje));
   end Crear_Error;

end Cuenta_Resultado;
