import 'dart:io';
import 'usuario.dart';
import 'cuenta.dart';
import 'banco.dart';

void main() {
  Banco banco = Banco();
  int opcion = 0;

  while (opcion != 6) {
    print('MENÚ BANCO ADSO 2874057');
    print('1. Crear Cuenta');
    print('2. Consignar Cuenta');
    print('3. Retirar Cuenta');
    print('4. Consultar Cuenta Por Código');
    print('5. Listar Cuentas');
    print('6. Salir');
    stdout.write('Ingrese Opción (1-6): ');
    opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        stdout.write('Ingrese identificación: ');
        String identificacion = stdin.readLineSync()!;
        stdout.write('Ingrese nombre completo: ');
        String nombre = stdin.readLineSync()!;
        stdout.write('Ingrese correo electrónico: ');
        String correo = stdin.readLineSync()!;
        Cliente cliente = Cliente(identificacion, nombre, correo);
        banco.crearCuenta(cliente);
        break;

      case 2:
        stdout.write('Ingrese el código de la cuenta: ');
        String codigo = stdin.readLineSync()!;
        stdout.write('Ingrese monto a consignar: ');
        double monto = double.parse(stdin.readLineSync()!);
        banco.consignarCuenta(codigo, monto);
        break;

      case 3:
        stdout.write('Ingrese el código de la cuenta: ');
        String codigo = stdin.readLineSync()!;
        stdout.write('Ingrese monto a retirar: ');
        double monto = double.parse(stdin.readLineSync()!);
        banco.retirarCuenta(codigo, monto);
        break;

      case 4:
        stdout.write('Ingrese el código de la cuenta: ');
        String codigo = stdin.readLineSync()!;
        CuentaAhorro? cuenta = banco.consultarCuenta(codigo);
        if (cuenta != null) {
          print(
              'Cuenta encontrada. Código: ${cuenta.codigo}, Saldo: \${cuenta.saldo}, Fecha de creación: ${cuenta.fechaCreacion}');
        } else {
          print('Cuenta no encontrada.');
        }
        break;

      case 5:
        banco.listarCuentas();
        break;

      case 6:
        print('Saliendo del sistema...');
        break;

      default:
        print('Opción inválida.');
        break;
    }
  }
}
