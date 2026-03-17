import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebView HTML',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HtmlViewerScreen(
        // Aquí puedes pasar tu HTML
        htmlContent: '''
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
    <meta name="theme-color" content="#E30613">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="default">
    <meta name="apple-mobile-web-app-title" content="BonosPremium">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="description" content="Descuentos exclusivos en restaurantes, ocio y bienestar en las Islas Canarias">
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
        }
        
        /* Header */
        .header {
            background: white;
            padding: 24px 16px;
            text-align: center;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        
        .header-logo {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            margin-bottom: 4px;
        }
        
        .header-logo svg {
            width: 28px;
            height: 28px;
            color: #E30613;
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
        
        /* Main Content */
        .container {
            max-width: 420px;
            margin: 0 auto;
            padding: 24px 16px 40px;
        }
        
        /* Cards */
        .card {
            background: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1), 0 2px 4px -1px rgba(0,0,0,0.06);
            margin-bottom: 20px;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        
        .card:active {
            transform: scale(0.98);
        }
        
        .card-header {
            height: 110px;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }
        
        .card-header::before,
        .card-header::after {
            content: '';
            position: absolute;
            border-radius: 50%;
            background: rgba(255,255,255,0.1);
        }
        
        .card-header::before {
            width: 100px;
            height: 100px;
            top: -50px;
            right: -30px;
        }
        
        .card-header::after {
            width: 70px;
            height: 70px;
            bottom: -35px;
            left: -20px;
        }
        
        .card-header.tenerife { background: #00A0E3; }
        .card-header.grancanaria { background: #fee403; }
        .card-header.fuerteventura { background: #C4A77D; }
        .card-header.lanzarote { background: #E30613; }
        
        .card-logo {
            max-height: 55px;
            max-width: 350px;
            object-fit: contain;
            position: relative;
            z-index: 1;
        }
        
        .card-body {
            padding: 20px;
        }
        
        .card-title {
            font-size: 18px;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 8px;
        }
        
        .card-title span {
            color: #64748b;
            font-weight: 600;
        }
        
        .card-description {
            color: #475569;
            font-size: 14px;
            line-height: 1.5;
            margin-bottom: 12px;
        }
        
        .card-stats {
            display: flex;
            align-items: center;
            gap: 6px;
            margin-bottom: 16px;
            color: #64748b;
            font-size: 13px;
            font-weight: 500;
        }
        
        .card-stats svg {
            width: 14px;
            height: 14px;
        }
        
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
            transition: opacity 0.2s, transform 0.1s;
        }
        
        .card-button:active {
            opacity: 0.9;
            transform: scale(0.98);
        }
        
        .card-button svg {
            width: 18px;
            height: 18px;
        }
        
        .tenerife-btn { background: #00A0E3; }
        .grancanaria-btn { background: #E5C700; color: #1e293b; }
        .fuerteventura-btn { background: #B3976D; }
        .lanzarote-btn { background: #E30613; }
        
        /* Features Section */
        .features {
            margin-top: 32px;
        }
        
        .features-title {
            text-align: center;
            color: #475569;
            font-size: 15px;
            font-weight: 600;
            margin-bottom: 16px;
        }
        
        .features-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 12px;
        }
        
        .feature-item {
            background: white;
            border-radius: 12px;
            padding: 16px 8px;
            text-align: center;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        
        .feature-icon {
            width: 44px;
            height: 44px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 8px;
        }
        
        .feature-icon.restaurantes { background: #ffe4e6; }
        .feature-icon.restaurantes svg { color: #f43f5e; }
        
        .feature-icon.bienestar { background: #fef3c7; }
        .feature-icon.bienestar svg { color: #f59e0b; }
        
        .feature-icon.ocio { background: #cffafe; }
        .feature-icon.ocio svg { color: #06b6d4; }
        
        .feature-icon svg {
            width: 22px;
            height: 22px;
        }
        
        .feature-item p {
            font-size: 12px;
            color: #475569;
            font-weight: 500;
        }
        
        /* Footer */
        .footer {
            margin-top: 40px;
            text-align: center;
        }
        
        .footer-logo {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            margin-bottom: 8px;
        }
        
        .footer-logo svg {
            width: 18px;
            height: 18px;
            color: #E30613;
        }
        
        .footer-logo span {
            font-weight: 700;
            color: #475569;
        }
        
        .footer p {
            color: #000000;
            font-size: 12px;
        }
        
        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .card {
            animation: fadeInUp 0.5s ease forwards;
        }
        
        .card:nth-child(1) { animation-delay: 0.1s; }
        .card:nth-child(2) { animation-delay: 0.2s; }
        .card:nth-child(3) { animation-delay: 0.3s; }
        .card:nth-child(4) { animation-delay: 0.4s; }
    </style>
<base target="_blank">
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-logo">
            <h1>BonosPremium</h1>
        </div>
        <p>Selecciona tu isla y empieza a ahorrar</p>
    </header>

    <!-- Main Content -->
    <main class="container">
        <!-- Tenerife Card -->
        <div class="card">
            <div class="card-header tenerife">
                <img src="https://bonospremium.com/wp-content/uploads/2023/09/trans.png" alt="BonosPremium Tenerife" class="card-logo">
            </div>
            <div class="card-body">
                <h3 class="card-title">BonosPremium <span>Tenerife</span></h3>
                <p class="card-description">Descubre los mejores descuentos en restaurantes, ocio, bienestar y mucho más en Tenerife.</p>
                <button class="card-button tenerife-btn" onclick="openStore('https://bonospremium.com')">
                    Acceder a la tienda
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="5" y1="12" x2="19" y2="12"/>
                        <polyline points="12 5 19 12 12 19"/>
                    </svg>
                </button>
            </div>
        </div>

        <!-- Gran Canaria Card -->
        <div class="card">
            <div class="card-header grancanaria">
                <img src="https://bonospremiumgc.com/wp-content/uploads/2023/05/logo.jpg" alt="BonosPremium Gran Canaria" class="card-logo">
            </div>
            <div class="card-body">
                <h3 class="card-title">BonosPremium <span>Gran Canaria</span></h3>
                <p class="card-description">Ahorra en tus experiencias favoritas con las mejores ofertas de Gran Canaria.</p>
                <button class="card-button grancanaria-btn" onclick="openStore('https://bonospremiumgc.com')">
                    Acceder a la tienda
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="5" y1="12" x2="19" y2="12"/>
                        <polyline points="12 5 19 12 12 19"/>
                    </svg>
                </button>
            </div>
        </div>

        <!-- Fuerteventura Card -->
        <div class="card">
            <div class="card-header fuerteventura">
                <img src="https://bonospremiumfv.com/wp-content/uploads/2023/05/LOGO-BUENO-FUERTEVENTURA-TRANSPARENTE.png" alt="BonosPremium Fuerteventura" class="card-logo">
            </div>
            <div class="card-body">
                <h3 class="card-title">BonosPremium <span>Fuerteventura</span></h3>
                <p class="card-description">Disfruta del paraíso canario con descuentos exclusivos en Fuerteventura.</p>
                <button class="card-button fuerteventura-btn" onclick="openStore('https://bonospremiumfv.com')">
                    Acceder a la tienda
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="5" y1="12" x2="19" y2="12"/>
                        <polyline points="12 5 19 12 12 19"/>
                    </svg>
                </button>
            </div>
        </div>

        <!-- Lanzarote Card -->
        <div class="card">
            <div class="card-header lanzarote">
                <img src="https://bonospremiumlz.com/wp-content/uploads/2023/05/logo-rojo-nuevo-lanzarote-transparente.png" alt="BonosPremium Lanzarote" class="card-logo">
            </div>
            <div class="card-body">
                <h3 class="card-title">BonosPremium <span>Lanzarote</span></h3>
                <p class="card-description">Vive experiencias únicas en la isla volcánica con los mejores precios.</p>
                <button class="card-button lanzarote-btn" onclick="openStore('https://bonospremiumlz.com')">
                    Acceder a la tienda
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="5" y1="12" x2="19" y2="12"/>
                        <polyline points="12 5 19 12 12 19"/>
                    </svg>
                </button>
            </div>
        </div>

        <!-- Features Section -->
        <section class="features">
            <h4 class="features-title">¿Qué encontrarás?</h4>
            <div class="features-grid">
                <div class="feature-item">
                    <div class="feature-icon restaurantes">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M3 2v7c0 1.1.9 2 2 2h4a2 2 0 0 0 2-2V2"/>
                            <path d="M7 2v20"/>
                            <path d="M21 15V2v0a5 5 0 0 0-5 5v6c0 1.1.9 2 2 2h3Zm0 0v7"/>
                        </svg>
                    </div>
                    <p>Restaurantes</p>
                </div>
                <div class="feature-item">
                    <div class="feature-icon bienestar">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M18 8h1a4 4 0 0 1 0 8h-1"/>
                            <path d="M2 8h16v9a4 4 0 0 1-4 4H6a4 4 0 0 1-4-4V8z"/>
                            <line x1="6" y1="1" x2="6" y2="4"/>
                            <line x1="10" y1="1" x2="10" y2="4"/>
                            <line x1="14" y1="1" x2="14" y2="4"/>
                        </svg>
                    </div>
                    <p>Bienestar</p>
                </div>
                <div class="feature-item">
                    <div class="feature-icon ocio">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M12 22v-5"/>
                            <path d="M9 8V2"/>
                            <path d="M15 8V2"/>
                            <path d="M18 8v5a4 4 0 0 1-4 4h-4a4 4 0 0 1-4-4V8z"/>
                            <path d="M6 8h12"/>
                        </svg>
                    </div>
                    <p>Ocio</p>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="footer">
            <div class="footer-logo">
                <span>BonosPremium</span>
            </div>
            <p>© 2026 - Todos los derechos reservados</p>
            <p>Descuentos exclusivos en Canarias</p>
        </footer>
    </main>

    <script>
        function openStore(url) {
            window.open(url, '_blank');
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

  const HtmlViewerScreen({
    super.key,
    required this.htmlContent,
    this.baseUrl,
  });

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
      ..setNavigationDelegate(
        NavigationDelegate(
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
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border(
            top: BorderSide(
              color: Theme.of(context).dividerColor,
            ),
          ),
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: canGoBack
                    ? () {
                        _controller.goBack();
                        _updateNavigationState();
                      }
                    : null,
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: canGoForward
                    ? () {
                        _controller.goForward();
                        _updateNavigationState();
                      }
                    : null,
              ),
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () => _controller.reload(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
