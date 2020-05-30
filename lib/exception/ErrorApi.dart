class ErrorApi {

 int status;
 String error;
 String message;
 String path;

 ErrorApi (this.status, this.error, this.message, this.path);

 @override
  String toString() {
    return "ErroApi: ${this.status} : ${this.error} : ${this.message} : ${this.path}";
  }
  
}