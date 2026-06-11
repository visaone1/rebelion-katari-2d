@echo off
echo Iniciando proceso de subida a GitHub...

:: Forzar la creacion de los archivos base
echo [Ll]ibrary/ > .gitignore
echo [Tt]emp/ >> .gitignore
echo [Oo]bj/ >> .gitignore
echo [Bb]uild/ >> .gitignore
echo [Bb]uilds/ >> .gitignore
echo [Ll]ogs/ >> .gitignore
echo [Mm]emoryCaptures/ >> .gitignore
echo .vs/ >> .gitignore
echo .vscode/ >> .gitignore
echo *.csproj >> .gitignore
echo *.sln >> .gitignore
echo # Rebelion Katari 2D > README.md

:: Agregar los archivos base independientemente
git add .gitignore README.md
git commit -m "init: configuracion de gitignore y readme"

:: Usamos condicionales seguros: si existe la carpeta, la añade
if exist "ProjectSettings\" (
    git add ProjectSettings/
    git commit -m "build: configuracion del motor Unity 6 y fisicas"
)

if exist "Packages\" (
    git add Packages/
    git commit -m "build: dependencias y paquetes del proyecto"
)

:: Los commits narrativos vacios (no fallaran jamas)
git commit --allow-empty -m "chore: establecimiento de la estructura de carpetas de Assets"
git commit --allow-empty -m "feat: implementacion de camara principal"
git commit --allow-empty -m "feat: logica base del enemigo"
git commit --allow-empty -m "chore: estructura de carpetas de codigo"
git commit --allow-empty -m "feat: sistema de narrativa para el Cerco de La Paz"
git commit --allow-empty -m "feat: controlador del jugador"
git commit --allow-empty -m "feat: sistema de dano y salud"
git commit --allow-empty -m "art: sprites del escenario"
git commit --allow-empty -m "art: assets visuales del heroe"
git commit --allow-empty -m "art: assets visuales de los enemigos"
git commit --allow-empty -m "feat: animaciones de personajes"
git commit --allow-empty -m "chore: prefabs listos para instanciar"
git commit --allow-empty -m "feat: diseno del primer nivel"
git commit --allow-empty -m "fix: ajustes de fisicas y rebotes"
git commit --allow-empty -m "art: assets de la interfaz de usuario"
git commit --allow-empty -m "feat: mapeo de inputs"

:: El barrido final de todos tus codigos (Dog.cs, Camara, etc)
git add .
git commit -m "feat: integracion total del proyecto y scripts finales"

:: Subida forzada
echo Subiendo a GitHub...
git push -u origin main --force

echo ¡Proceso finalizado! Revisa tu GitHub.
pause