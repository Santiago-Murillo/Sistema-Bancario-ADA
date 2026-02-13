package body Cliente_Resultado is

   function Crear_Error
     (Codigo  : Cliente_Error_Code;
      Mensaje : String) return Cliente_Resultado_Type
   is
   begin
      return (Estado  => Error_Validacion,
              Error   => Codigo,
              Mensaje => Crear_Mensaje (Mensaje));
   end Crear_Error;

end Cliente_Resultado;
