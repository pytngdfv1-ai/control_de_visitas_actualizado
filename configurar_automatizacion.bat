@echo off
title Configurar Proyecto para GitHub
echo ===================================================
echo  CONFIGURADOR DE PROYECTO PARA GITHUB ACTIONS (v2.7)
echo ===================================================
echo.

if not exist icon.png goto NO_ICON
echo [OK] Archivo 'icon.png' detectado en la raiz. Se generaran los iconos nativos automaticamente en la nube.
goto CONTINUE_CONFIG

:NO_ICON
echo [ALERTA] No se encontro el archivo 'icon.png' en esta carpeta.
echo Para que tu aplicacion movil tenga un icono personalizado en su instalacion,
echo debes colocar un archivo de imagen cuadrado (ej. 512x512 o 1024x1024 px)
echo llamado exactamente 'icon.png' en esta misma carpeta antes de subirlo a GitHub.
echo.
set /p continuar=¿Deseas continuar con la configuracion de carpetas de todos modos? (S/N): 
if /i "%continuar%"=="S" goto CONTINUE_CONFIG
if /i "%continuar%"=="s" goto CONTINUE_CONFIG
echo Operacion cancelada por el usuario.
pause
exit /b

:CONTINUE_CONFIG
echo.
echo Creando estructura de carpetas para GitHub Actions...
if not exist .github\workflows mkdir .github\workflows
if exist android-compile.yml (
    echo Moviendo archivo YML a .github/workflows/...
    move /y android-compile.yml .github\workflows\android-compile.yml
) else (
    echo [ALERTA] No se encontro android-compile.yml en esta carpeta. Asegurate de descargarlo aqui.
)
echo.
echo [OK] Estructura completada. Recuerda dejar tus archivos HTML, CSS y JS en la raiz.
pause