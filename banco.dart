
import 'cuenta.dart';
import 'usuario.dart';

class Banco {
  List<CuentaAhorro> cuentas = [];
  int consecutivo = 0;

  void crearCuenta(Cliente cliente) {
    consecutivo++;
    String codigo = '${DateTime.now().year}-$consecutivo';
    CuentaAhorro nuevaCuenta = CuentaAhorro(codigo, DateTime.now(), 0.0);
    cuentas.add(nuevaCuenta);
    print('Cuenta creada con éxito. Código: $codigo');
  }

  void consignarCuenta(String codigo, double monto) {
    CuentaAhorro? cuenta = consultarCuenta(codigo);
    if (cuenta != null) {
      cuenta.consignar(monto);
    } else {
      print('Cuenta no encontrada.');
    }
  }

  void retirarCuenta(String codigo, double monto) {
    CuentaAhorro? cuenta = consultarCuenta(codigo);
    if (cuenta != null) {
      cuenta.retirar(monto);
    } else {
      print('Cuenta no encontrada.');
    }
  }

  CuentaAhorro? consultarCuenta(String codigo) {
    for (CuentaAhorro cuenta in cuentas) {
      if (cuenta.codigo == codigo) {
        return cuenta;
      }
    }
    return null;
  }

  void listarCuentas() {
    if (cuentas.isEmpty) {
      print('No hay cuentas registradas.');
    } else {
      for (CuentaAhorro cuenta in cuentas) {
        print('Código: ${cuenta.codigo}, Fecha de creación: ${cuenta.fechaCreacion}, Saldo: \${cuenta.saldo}');
      }
    }
  }
}