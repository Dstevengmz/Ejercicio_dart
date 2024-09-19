class CuentaAhorro {
  String codigo;
  DateTime fechaCreacion;
  double saldo;

  CuentaAhorro(this.codigo, this.fechaCreacion, this.saldo);

  void consignar(double monto) {
    saldo = saldo + monto;
    print("se han completado \$$monto.nuevo saldo.\$$saldo");
  }

  void retirar(double monto) {
    if (monto <= saldo) {
      saldo -= monto;
      print("Se  han retirado\$$monto.nuevo saldo:\$$saldo");
    } else {
      print("saldo isufiente para realizar el retiro .");
    }
  }
}