import 'package:mvvm_example/data/response/status.dart';

// ApiResponse<T> : berarti ApiResponse dapat digunakan dengan berbagai jenis data yang berbeda, seperti ApiResponse<int>, ApiResponse<String>, dll.
class ApiResponse<T> {
  // memanggil status.dart
  Status? status;
  T? data;
  String? message;

  // constructor
  ApiResponse(this.status, this.data, this.message);

  // Ini adalah constructor bernama
  // Jika kita memanggil constructor loading maka, data status akan menjadi loading
  ApiResponse.loading() : status = Status.LOADING;
  // Jika kita memanggil constructor completed maka, data status akan menjadi completed
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  // Jika kita memanggil constructor error maka, data status akan menjadi error
  ApiResponse.error(this.message) : status = Status.ERROR;

  // custom pesan pada throw errors
  // Dalam metode ini, status, pesan, dan data dari objek akan digabungkan menjadi satu string dan dikembalikan.
  @override
  String toString() {
    // TODO: implement toString
    return "Status: $status \n Message: $message \n Data: $data";
  }
}
