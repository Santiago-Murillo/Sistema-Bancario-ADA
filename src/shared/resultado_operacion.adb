pragma SPARK_Mode (On);

package body Resultado_Operacion is

   function Crear_Mensaje (Texto : String) return Mensaje_Error is
      Resultado : Mensaje_Error := (others => ' ');
      Longitud : constant Natural := Natural'Min (Texto'Length, Mensaje_Error'Length);
   begin
      if Longitud > 0 then
         Resultado (1 .. Longitud) := Texto (Texto'First .. Texto'First + Longitud - 1);
      end if;
      return Resultado;
   end Crear_Mensaje;

end Resultado_Operacion;
