with Ada.Text_IO;
with Ada.Containers.Vectors;

package body Tarjeta_Credito_Service is

   use Ada.Text_IO;

   -- Almacenamiento en memoria de tarjetas
   package Tarjeta_Vectors is new Ada.Containers.Vectors
     (Index_Type   => Positive,
      Element_Type => Tarjeta_Credito_Access);

   Tarjetas_Store : Tarjeta_Vectors.Vector;

   -- === OPERACIONES CRUD ===

   function Crear_Tarjeta
     (Cedula_Cliente        : String;
      Tasa_Interes_Mensual  : Tasa_Interes_Type := Length.DEFAULT_TASA_INTERES_TARJETA)
      return Tarjeta_Credito_Access
   is
      Nueva_Tarjeta : constant Tarjeta_Credito_Access :=
        new Tarjeta_Credito_Type'(Crear_Tarjeta_Credito (Cedula_Cliente, Tasa_Interes_Mensual));
   begin
      Tarjetas_Store.Append (Nueva_Tarjeta);
      return Nueva_Tarjeta;
   end Crear_Tarjeta;

   function Obtener_Tarjeta (Id_Tarjeta : Natural) return Tarjeta_Credito_Access is
   begin
      for Tarjeta of Tarjetas_Store loop
         if Get_Id (Tarjeta.all) = Id_Tarjeta then
            return Tarjeta;
         end if;
      end loop;
      raise Tarjeta_No_Encontrada with "Tarjeta con ID" & Id_Tarjeta'Image & " no encontrada";
   end Obtener_Tarjeta;

   function Obtener_Tarjeta_Por_Cliente (Cedula_Cliente : String) return Tarjeta_Credito_Access is
   begin
      for Tarjeta of Tarjetas_Store loop
         if Get_Cedula_Cliente (Tarjeta.all) = Cedula_Cliente then
            return Tarjeta;
         end if;
      end loop;
      raise Tarjeta_No_Encontrada with "Cliente con cedula " & Cedula_Cliente & " no tiene tarjeta";
   end Obtener_Tarjeta_Por_Cliente;

   procedure Actualizar_Limite_Credito
     (Id_Tarjeta    : Natural;
      Nuevo_Limite  : Limite_Credito_Type)
   is
      Tarjeta : constant Tarjeta_Credito_Access := Obtener_Tarjeta (Id_Tarjeta);
   begin
      -- Validar que el nuevo límite no sea menor que el saldo utilizado
      if Nuevo_Limite < Limite_Credito_Type (Get_Saldo_Utilizado (Tarjeta.all)) then
         raise Limite_Credito_Excedido with
           "El nuevo límite no puede ser menor que el saldo utilizado actual";
      end if;

      Set_Limite_Credito (Tarjeta.all, Nuevo_Limite);
   end Actualizar_Limite_Credito;

   procedure Eliminar_Tarjeta (Id_Tarjeta : Natural) is
      Tarjeta : constant Tarjeta_Credito_Access := Obtener_Tarjeta (Id_Tarjeta);
   begin
      -- Validar que no tenga deuda pendiente
      if Get_Saldo_Utilizado (Tarjeta.all) > 0.0 then
         raise Tarjeta_Con_Deuda with "No se puede eliminar una tarjeta con deuda pendiente";
      end if;

      -- Buscar y eliminar de la colección
      for I in Tarjetas_Store.First_Index .. Tarjetas_Store.Last_Index loop
         if Get_Id (Tarjetas_Store.Element (I).all) = Id_Tarjeta then
            Tarjetas_Store.Delete (I);
            return;
         end if;
      end loop;
   end Eliminar_Tarjeta;

   -- === OPERACIONES DE NEGOCIO ===

   procedure Realizar_Compra
     (Id_Tarjeta  : Natural;
      Monto       : Saldo_Type;
      Descripcion : String)
   is
      Tarjeta   : constant Tarjeta_Credito_Access := Obtener_Tarjeta (Id_Tarjeta);
      Estrategia : constant Transaccion_Tarjeta.Compra_Strategy :=
        Transaccion_Tarjeta.Compra_Strategy'(null record);
   begin
      -- Validar que la tarjeta no esté vencida
      if Esta_Vencida (Tarjeta.all) then
         raise Tarjeta_Vencida with "La tarjeta ha vencido";
      end if;

      -- Validar que hay crédito disponible
      if Monto > Get_Credito_Disponible (Tarjeta.all) then
         raise Limite_Credito_Excedido with
           "Fondos insuficientes. Crédito disponible: " &
           Get_Credito_Disponible (Tarjeta.all)'Image;
      end if;

      -- Ejecutar la compra
      Transaccion_Tarjeta.Ejecutar (Estrategia, Tarjeta.all, Monto);

      Put_Line ("Compra realizada: " & Descripcion & " - Monto: " & Monto'Image);
   end Realizar_Compra;

   procedure Realizar_Pago
     (Id_Tarjeta : Natural;
      Monto      : Saldo_Type)
   is
      Tarjeta   : constant Tarjeta_Credito_Access := Obtener_Tarjeta (Id_Tarjeta);
      Estrategia : constant Transaccion_Tarjeta.Pago_Tarjeta_Strategy :=
        Transaccion_Tarjeta.Pago_Tarjeta_Strategy'(null record);
   begin
      -- Validar que el monto no exceda la deuda
      if Monto > Get_Saldo_Utilizado (Tarjeta.all) then
         raise Pago_Invalido with
           "El monto del pago excede la deuda. Deuda actual: " &
           Get_Saldo_Utilizado (Tarjeta.all)'Image;
      end if;

      -- Ejecutar el pago
      Transaccion_Tarjeta.Ejecutar (Estrategia, Tarjeta.all, Monto);

      Put_Line ("Pago realizado - Monto: " & Monto'Image);
   end Realizar_Pago;

   procedure Calcular_Aplicar_Interes (Id_Tarjeta : Natural) is
      Tarjeta : constant Tarjeta_Credito_Access := Obtener_Tarjeta (Id_Tarjeta);
   begin
      if Get_Saldo_Utilizado (Tarjeta.all) > 0.0 then
         Aplicar_Interes (Tarjeta.all);
         Put_Line ("Intereses aplicados a tarjeta" & Id_Tarjeta'Image);
      end if;
   end Calcular_Aplicar_Interes;

   function Consultar_Estado_Tarjeta (Id_Tarjeta : Natural) return String is
      Tarjeta : constant Tarjeta_Credito_Access := Obtener_Tarjeta (Id_Tarjeta);
   begin
      return "=== Estado de Tarjeta ===" & ASCII.LF &
             "Numero: " & Get_Numero_Tarjeta (Tarjeta.all) & ASCII.LF &
             "Limite Credito: " & Get_Limite_Credito (Tarjeta.all)'Image & ASCII.LF &
             "Saldo Utilizado: " & Get_Saldo_Utilizado (Tarjeta.all)'Image & ASCII.LF &
             "Credito Disponible: " & Get_Credito_Disponible (Tarjeta.all)'Image & ASCII.LF &
             "Pago Minimo: " & Get_Pago_Minimo (Tarjeta.all)'Image & ASCII.LF &
             "Tasa Interes Mensual: " & Get_Tasa_Interes_Mensual (Tarjeta.all)'Image & "%" & ASCII.LF &
             "Vencida: " & (if Esta_Vencida (Tarjeta.all) then "SI" else "NO");
   end Consultar_Estado_Tarjeta;

   function Tiene_Tarjeta (Cedula_Cliente : String) return Boolean is
   begin
      for Tarjeta of Tarjetas_Store loop
         if Get_Cedula_Cliente (Tarjeta.all) = Cedula_Cliente then
            return True;
         end if;
      end loop;
      return False;
   end Tiene_Tarjeta;

end Tarjeta_Credito_Service;
