import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io' show Platform;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Configuración de pantalla completa edge-to-edge
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BonosPremium Canarias',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Aquí dentro está tu string HTML estático con la función openStore corregida
      home: const HtmlViewerScreen(
        htmlContent: '''
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
    <meta name="theme-color" content="#E30613">
    <title>BonosPremium - Selecciona tu Isla</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            -webkit-tap-highlight-color: transparent;
        }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, sans-serif;
            background: linear-gradient(135deg, #e2e8f0 0%, #cbd5e1 50%, #94a3b8 100%);
            min-height: 100vh;
            -webkit-font-smoothing: antialiased;
            touch-action: manipulation;
            padding: env(safe-area-inset-top) env(safe-area-inset-right) env(safe-area-inset-bottom) env(safe-area-inset-left);
        }
        .background-fix {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, #e2e8f0 0%, #cbd5e1 50%, #94a3b8 100%);
            z-index: -1;
        }
        .header {
            background: white;
            padding: 16px;
            text-align: center;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        .header h1 {
            font-size: 26px;
            font-weight: 900;
            color: #1e293b;
            letter-spacing: -0.5px;
        }
        .header p {
            color: #64748b;
            font-size: 14px;
        }
        .container {
            max-width: 420px;
            margin: 0 auto;
            padding: 24px 16px 40px;
        }
        .card {
            background: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .card-header {
            height: 110px;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
        }
        .card-header.tenerife { background: #00A0E3; }
        .card-header.grancanaria { background: #fee403; }
        .card-header.fuerteventura { background: #C4A77D; }
        .card-header.lanzarote { background: #E30613; }
        .card-logo {
            max-height: 55px;
            max-width: 350px;
            object-fit: contain;
        }
        .card-body { padding: 20px; }
        .card-title { font-size: 18px; font-weight: 700; color: #1e293b; }
        .card-description { color: #475569; font-size: 14px; line-height: 1.5; margin-bottom: 12px; }
        .card-button {
            width: 100%;
            padding: 14px 20px;
            border: none;
            border-radius: 12px;
            color: white;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        .tenerife-btn { background: #00A0E3; }
        .grancanaria-btn { background: #E5C700; color: #1e293b; }
        .fuerteventura-btn { background: #B3976D; }
        .lanzarote-btn { background: #E30613; }
        .features { margin-top: 32px; }
        .features-title { text-align: center; color: #475569; font-size: 15px; font-weight: 600; margin-bottom: 16px; }
        .features-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 12px; }
        .feature-item { background: white; border-radius: 12px; padding: 16px 8px; text-align: center; box-shadow: 0 1px 3px rgba(0,0,0,0.1); }
        .feature-icon { width: 44px; height: 44px; border-radius: 10px; display: flex; align-items: center; justify-content: center; margin: 0 auto 8px; }
        .feature-icon.restaurantes { background: #ffe4e6; }
        .feature-icon.bienestar { background: #fef3c7; }
        .feature-icon.ocio { background: #cffafe; }
        .feature-item p { font-size: 12px; color: #475569; font-weight: 500; }
        .footer { margin-top: 40px; text-align: center; padding-bottom: max(20px, env(safe-area-inset-bottom)); }
        .footer p { color: #000000; font-size: 12px; }
    </style>
</head>
<body>
    <div class="background-fix"></div>
    
    <header class="header">
        <div class="header-logo">
            <h1>BonosPremium</h1>
        </div>
        <p>Selecciona tu isla y empieza a ahorrar</p>
    </header>

    <main class="container">
        <div class="card">
            <div class="card-header tenerife">
                <img src="https://bonospremium.com/wp-content/uploads/2023/09/trans.png" alt="Tenerife" class="card-logo">
            </div>
            <div class="card-body">
                <h3 class="card-title">BonosPremium <span>Tenerife</span></h3>
                <p class="card-description">Descubre los mejores descuentos en Tenerife.</p>
                <button class="card-button tenerife-btn" onclick="openStore('https://bonospremium.com')">
                    Acceder a la tienda
                </button>
            </div>
        </div>

        <div class="card">
            <div class="card-header grancanaria">
                <img src="https://bonospremiumgc.com/wp-content/uploads/2023/05/logo.jpg" alt="Gran Canaria" class="card-logo">
            </div>
            <div class="card-body">
                <h3 class="card-title">BonosPremium <span>Gran Canaria</span></h3>
                <p class="card-description">Ahorra en tus experiencias favoritas en Gran Canaria.</p>
                <button class="card-button grancanaria-btn" onclick="openStore('https://bonospremiumgc.com')">
                    Acceder a la tienda
                </button>
            </div>
        </div>

        <div class="card">
            <div class="card-header fuerteventura">
                <img src="https://bonospremiumfv.com/wp-content/uploads/2023/05/LOGO-BUENO-FUERTEVENTURA-TRANSPARENTE.png" alt="Fuerteventura" class="card-logo">
            </div>
            <div class="card-body">
                <h3 class="card-title">BonosPremium <span>Fuerteventura</span></h3>
                <p class="card-description">Disfruta de descuentos exclusivos en Fuerteventura.</p>
                <button class="card-button fuerteventura-btn" onclick="openStore('https://bonospremiumfv.com')">
                    Acceder a la tienda
                </button>
            </div>
        </div>

        <div class="card">
            <div class="card-header lanzarote">
                <img src="https://bonospremiumlz.com/wp-content/uploads/2023/05/logo-rojo-nuevo-lanzarote-transparente.png" alt="Lanzarote" class="card-logo">
            </div>
            <div class="card-body">
                <h3 class="card-title">BonosPremium <span>Lanzarote</span></h3>
                <p class="card-description">Vive experiencias únicas en Lanzarote.</p>
                <button class="card-button lanzarote-btn" onclick="openStore('https://bonospremiumlz.com')">
                    Acceder a la tienda
                </button>
            </div>
        </div>

        <section class="features">
            <h4 class="features-title">¿Qué encontrarás?</h4>
            <div class="features-grid">
                <div class="feature-item"><p>Restaurantes</p></div>
                <div class="feature-item"><p>Bienestar</p></div>
                <div class="feature-item"><p>Ocio</p></div>
            </div>
        </section>

        <footer class="footer">
            <p>© 2026 - Todos los derechos reservados</p>
        </footer>
    </main>

    <script>
        // ✅ Canal de comunicación nativo corregido
        function openStore(url) {
            if (window.NavegacionApp) {
                window.NavegacionApp.postMessage(url);
            } else {
                window.location.href = url;
            }
        }
    </script>
</body>
</html>
''',
      ),
    );
  }
}

class HtmlViewerScreen extends StatefulWidget {
  final String htmlContent;
  final String? baseUrl;

  const HtmlViewerScreen({super.key, required this.htmlContent, this.baseUrl});

  @override
  State<HtmlViewerScreen> createState() => _HtmlViewerScreenState();
}

class _HtmlViewerScreenState extends State<HtmlViewerScreen> {
  late final WebViewController _controller;
  bool isLoading = true;
  bool canGoBack = false;
  bool canGoForward = false;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      // 1. Escucha los clicks del listado inicial de islas
      ..addJavaScriptChannel(
        'NavegacionApp',
        onMessageReceived: (JavaScriptMessage message) {
          _cargarUrlConNotch(message.message);
        },
      )
      // 2. Intercepta cualquier navegación interna de WooCommerce
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            final String url = request.url;

            // Filtro para saber si es un dominio tuyo
            final bool esMiTienda =
                url.contains('bonospremium.com') ||
                url.contains('bonospremiumgc.com') ||
                url.contains('bonospremiumfv.com') ||
                url.contains('bonospremiumlz.com');

            // Si navega por tus webs y no lleva el parámetro del notch, frenamos e inyectamos
            if (esMiTienda && !url.contains('notch=')) {
              _cargarUrlConNotch(url);
              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) async {
            setState(() {
              isLoading = false;
            });
            _updateNavigationState();
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('Error cargando página: ${error.description}');
          },
        ),
      )
      ..loadHtmlString(widget.htmlContent, baseUrl: widget.baseUrl);
  }

  // Métodos auxiliares de la vista
  void _cargarUrlConNotch(String urlBase) {
    final double topPadding = MediaQuery.of(context).padding.top;
    final int notchHeight = topPadding > 0 ? topPadding.round() : 0;

    final String urlFinal = urlBase.contains('?')
        ? '$urlBase&notch=$notchHeight'
        : '$urlBase?notch=$notchHeight';

    _controller.loadRequest(Uri.parse(urlFinal));
  }

  Future<void> _updateNavigationState() async {
    final canBack = await _controller.canGoBack();
    final canForward = await _controller.canGoForward();
    setState(() {
      canGoBack = canBack;
      canGoForward = canForward;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (isLoading) const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
