# Proxy interception requests
In this project, we are talking about viewing flutter application requests via HTTPS proxy. In particular, through **mitmproxy**.
Here we consider 2 routes with and without a certificate.


## Creating a project

	cd Desktop
	flutter create my_app
Explanations are unnecessary

## Add native_flutter_proxy
	flutter pub add native_flutter_proxy

## Installing mitmproxy

https://www.mitmproxy.org/


## Getting a mitmproxy certificate (A route with a certificate)

Run mitmproxy: The first time you run mitmproxy, it creates keys for the certificate authority (CA) in the configuration directory (~/.mitmproxy by default).
Add mitmproxy-cacert.pem to the assets folder of your project.

## HTTP client settings (A route with a certificate)

```
import 'dart:developer';  
import 'dart:io';  
import 'dart:typed_data';  
  
import 'package:flutter/services.dart';  
  
class MyHttpOverrides extends HttpOverrides {  
  final String host;  
 final int port;  
 final ByteData certFile;  
  MyHttpOverrides({  
    required this.host,  
 required this.port,  
 required this.certFile,  
  });  
  @override  
  HttpClient createHttpClient(SecurityContext? context) {  
    var cert = certFile.buffer.asUint8List();  
  SecurityContext securityContext = SecurityContext();  
  securityContext.setTrustedCertificatesBytes(cert);  
 return super.createHttpClient(securityContext)  
      ..findProxy = (Uri url) {  
        log(host);  
  log(port.toString());  
 return 'PROXY $host:$port';  
  }  
      ..badCertificateCallback =  
          (X509Certificate cert, String host, int port) => false;  
  }  
}
```
This code defines the **MyHttpOverrides** class, which extends **HttpOverrides** from the dart:io package. Http Overrides is used to configure the HTTP client to be used throughout the application.

This class defines the **createHttpClient** method, which overrides the standard **createHttpClient** method from **HttpOverrides**. This method returns an **HttpClient** instance that is used to send HTTP requests.

**createHttpClient:**
 1.  **ByteData** is converted to Uint8List and used to install trusted certificates in **SecurityContext**. This is done so that the client can securely connect to the server using SSL/TLS.
 2. A new **HttpClient** instance created using **super.createHttpClient(security Context)** is returned. This client will be used for all HTTP requests in the application.
 3. The **findProxy** function is installed, which defines the proxy server that should be used for each request. In this case, the proxy server is set via the **host** and **port** variables.
 4. The **badCertificateCallback** function is installed, which determines what to do when the server certificate cannot be verified. In this case, if the certificate is invalid, the request will be rejected.

*In general, this code allows you to configure the HTTP client so that it uses a specific proxy server, trusted certificates from a file, and rejects invalid certificates.*
 
 
## Redefining global HTTP requests (A route with a certificate)

```
Future<void> main() async {  
  WidgetsFlutterBinding.ensureInitialized();  
 if (!kReleaseMode) {  
    ProxySetting settings = await NativeProxyReader.proxySetting;  
 var certFile = await rootBundle.load(  
      'assets/certificates/mitmproxy-ca-cert',  
  );  
 if (settings.host != null && settings.port != null) {  
      HttpOverrides.global = MyHttpOverrides(  
        host: settings.host!,  
		  port: settings.port!,  
		  certFile: certFile,  
		 );  
	  }  
  }  
...
```

 1. **if (!kReleaseMode) {...}** - This conditional expression checks whether the application is in release mode or not. If the application is not in release mode (that is, in development mode), then the codes inside this block are executed.
 2. **ProxySetting settings = await Native Proxy Reader.proxy Setting;** - Here we get the proxy settings from **NativeProxyReader**. This can be useful if you want to intercept and analyze network traffic in your application.
 3. **var certFile = await rootBundle.load('assets/certificates/mitmproxy-ca-cert');** - Here we download the certificate file from the assets application. This certificate can be used to establish a secure connection.
 4. **HttpOverrides.global = MyHttpOverrides(...);** - Here we redefine global HTTP requests so that they use our own **MyHttpOverrides** class. This allows us to control all HTTP requests that our application makes. In this class, we can specify the host, port, and certificate file that we uploaded earlier.

## Setting up a proxy connection(A route with a certificate)

 1. Make changes to the wi-fi proxy settings
 2. Run mitmproxy
> mitmproxy

or

> mitmweb

 4. Run the application in debug mode or profile
 5. **Track your app's requests**
## HTTP client settings (Route without a certificate)

```
class MyHttpOverrides extends HttpOverrides {  
  final String? host;  
 final int? port;  
  MyHttpOverrides({  
    required this.host,  
 required this.port,  
  });  
  @override  
  HttpClient createHttpClient(SecurityContext? context) {  
    HttpClient httpClient = super.createHttpClient(context);  
  
  httpClient.badCertificateCallback =  
        (X509Certificate cert, String host, int port) => true;  
 if (host != null && port != null) {  
      httpClient.findProxy = (Uri url) {  
        return 'PROXY $host:$port';  
  };  
  }  
    return httpClient;  
  }  
}
```
**httpClient.badCertificateCallback =  (X509Certificate cert, String host, int port) => true;**
This code sets up the **badCertificateCallback** callback for the HttpClient object. The **badCertificateCallback** callback is called when the client tries to connect to the server with a certificate that cannot be verified.

**In this case, the callback always returns true, which means that the client will always trust the certificates, even if they cannot be verified. This can be useful in some situations, for example, when working with self-signed certificates or when testing, but in a real environment it can pose a security risk.**

## Redefining global HTTP requests (A route with a certificate)

```
Future<void> main() async {  
  WidgetsFlutterBinding.ensureInitialized();  
 if (!kReleaseMode) {  
	  ProxySetting settings = await NativeProxyReader.proxySetting;  
	  HttpOverrides.global = MyHttpOverrides(  
	      host: settings.host,  
		  port: settings.port,  
	  );  
  } 
...
```
## Setting up a proxy connection (A route with a certificate)

 1. Run mitmproxy
> mitmweb --ssl-insecure --mode wireguard
 2. Launch WireGuard on the device you want to use
 3. Import the tunnel from the QR code
 4. Run the application in debug mode or profile
 5. **Track your app's requests**
