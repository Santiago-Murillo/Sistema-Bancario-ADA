with Ada.Text_IO; use Ada.Text_IO;
with Clientes;

procedure Main is
   C : Clientes.Cliente;
   Ok : Boolean;
begin
   --  Prueba de creación de cliente
   Ok := Clientes.Crear_Cliente (
      C,
      "0102030405",
      "Armando",
      "Paredes",
      "Av. Central",
      "juan@mail.com",
      "0999999999"
   );

   if Ok then
      Put_Line ("Cliente creado correctamente");
   else
      Put_Line ("Error al crear cliente");
      return;
   end if;

   --  Mostrar datos iniciales
   Put_Line ("--- Datos iniciales ---");
   Put_Line ("Nombre   : " & C.Nombre);
   Put_Line ("Apellido : " & C.Apellido);
   Put_Line ("Correo   : " & C.Correo);

   --  Prueba de actualización de cliente
   Ok := Clientes.Actualizar_Cliente (
      C,
      "Juan Carlos",
      "Perez Gomez",
      "Av. Siempre Viva 123",
      "juan.c@mail.com",
      "0988888888"
   );

   if Ok then
      Put_Line ("Cliente actualizado correctamente");
   else
      Put_Line ("Error al actualizar cliente");
      return;
   end if;

   --  Mostrar datos actualizados
   Put_Line ("--- Datos actualizados ---");
   Put_Line ("Nombre   : " & C.Nombre);
   Put_Line ("Apellido : " & C.Apellido);
   Put_Line ("Correo   : " & C.Correo);

   Ok := Clientes.Actualizar_Cliente (
      C,
      "",
      "Perez",
      "Av. Central",
      "mail@test.com",
      "0999999999"
   );

   if not Ok then
      Put_Line (
         "Validación correcta: " &
         "No se permitió actualizar con nombre vacío"
      );
   else
      Put_Line (
         "Error en validación: " &
         "Se permitió actualizar con nombre vacío"
      );
   end if;

end Main;
