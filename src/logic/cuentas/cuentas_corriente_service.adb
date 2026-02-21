with Cuentas; use Cuentas;
with Cuenta_Corriente;

package body Cuentas_Corriente_Service is

   procedure Aplicar_Interes (Cuenta : in out Cuenta_Corriente.Cuenta_Corriente_Type) is
      Saldo_Actual         : constant Saldo_Type := Get_Saldo (Cuenta_Type (Cuenta));
      Tasa_Anual           : constant Cuenta_Corriente.Interes_Sobregiro_Type :=
        Cuenta_Corriente.Get_Interes_Sobregiro (Cuenta);
      Factor_Mensual_Float : constant Float := Float (Tasa_Anual) / 100.0 / 12.0;
      Interes_Float        : Float;
      Interes              : Saldo_Type;
   begin
      if Saldo_Actual < 0.0 then
         -- Calcular en Float para mantener precisión
         Interes_Float := Float (Saldo_Actual) * Factor_Mensual_Float;
         Interes := Saldo_Type (Interes_Float);
         Cuenta_Corriente.Set_Saldo (Cuenta, Saldo_Actual + Interes);
      end if;
   end Aplicar_Interes;

end Cuentas_Corriente_Service;
