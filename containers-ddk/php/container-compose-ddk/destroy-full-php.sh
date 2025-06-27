#!/bin/bash
# ==========================================================
# DESTROY-FULL - Rimuove container ddk-php, volumi associati
# e immagine Docker, ma NON la rete!
# ==========================================================

echo "🗑️ Avvio procedura di distruzione COMPLETA ddk-php..."

# Portarsi nella root del container PHP (es. containers-ddk/php)
cd "$(dirname "$0")/.."

# =====================================================
# SE USI config_project/config.env (per BASE_PATH ecc.)
# DECOMMENTA le righe seguenti per caricarlo PRIMA del .env-php
# =====================================================
#set -a
#source ../config_project/config.env
#set +a
# =====================================================

# =====================================================
# SE USI .env-php (per PHP_VERSION, PHP_PORT, ecc.)
# =====================================================
set -a
source .env-php
set +a
# =====================================================

echo "📦 Stato container prima:"
docker ps -a
echo

echo "📷 Stato immagini prima:"
docker images
echo

# =====================================================
# Rimozione container e volumi associati (ma NON rete)
# =====================================================
docker-compose --env-file .env-php -f container-compose-ddk/docker-compose.yml down -v --remove-orphans
echo

echo "📦 Stato container dopo rimozione:"
docker ps -a
echo

# =====================================================
# Rimozione immagine Docker (solo quella PHP definita)
# =====================================================
PHP_IMAGE_TAG="php:${PHP_VERSION}-apache"

echo "🧼 Rimozione immagine Docker: ${PHP_IMAGE_TAG}"
if docker image inspect "$PHP_IMAGE_TAG" >/dev/null 2>&1; then
  docker image rm "$PHP_IMAGE_TAG" >/dev/null 2>&1
  echo "✔️ Immagine rimossa: ${PHP_IMAGE_TAG}"
else
  echo "ℹ️ Immagine non trovata o già rimossa: ${PHP_IMAGE_TAG}"
fi
echo

echo "📷 Stato immagini dopo rimozione:"
docker images
echo

echo "✅ Distruzione completa eseguita con successo."




# === 📘 COMANDI UTILI POST-CLEANUP ===
echo ""
echo "🛠️ Comandi utili per gestione DockerDevKit"
echo "=============================================="
echo ""
echo "📋 Lista container attivi (in esecuzione):"
echo "Da lanciare da qualsiasi directory"
echo "(comando nativo)"
echo "docker ps"
echo ""

# echo "📋 Lista tutti i container:"
# echo "# (inclusi quelli fermi)"
# echo "(comando nativo)"
# echo "   docker ps -a"
# echo ""

echo "▶️ Avvia container:"
echo "Da lanciare dalla directory <nomeDIRcontainer>"
echo "(comando DockerDevKit - lancia un file)"
echo "start-<nomeDIRcontainer>.sh"
echo "oppure"
echo "bash start-<nomeDIRcontainer>.sh"
echo ""

echo "🛑 Ferma container:"
echo "Da lanciare dalla directory <nomeDIRcontainer>"
echo "(comando DockerDevKit - lancia un file)"
echo "stop-<nomeDIRcontainer>.sh"
echo "oppure"
echo "bash stop-<nomeDIRcontainer>.sh"
echo ""

echo "🧼 Rimuovi container e volumi:"
echo "Da lanciare dalla directory <nomeDIRcontainer>/container-compose-ddk"
echo "(comando DockerDevKit - lancia un file)"
echo "destroy-<nomeDIRcontainer>.sh"
echo "oppure"
echo "bash destroy-<nomeDIRcontainer>.sh"
echo ""

echo "🧹 Rimuovi container, volumi e immagine:"
echo "Da lanciare dalla directory <nomeDIRcontainer>/container-compose-ddk"
echo "(comando DockerDevKit - lancia un file)"
echo "destroy-full-<nomeDIRcontainer>.sh"
echo "oppure"
echo "bash destroy-full-<nomeDIRcontainer>.sh"
echo ""

echo "📋 Lista immagini Docker:"
echo "Da lanciare da qualsiasi directory"
echo "(comando nativo)"
echo "docker images"
echo ""

echo "🧽 Rimuovi un container specifico creato manualmente:"
echo "Da lanciare da qualsiasi directory"
echo "(comando nativo)"
echo "docker rm <nome_container>"
echo ""

# echo "🧹 Rimuovi tutti i container non in esecuzione:"
# echo "Da lanciare da qualsiasi directory"
# echo "(comando nativo)"
# echo "   docker container prune"
# echo "⚠️  Attenzione: rimuove TUTTI i container stoppati!"
# echo ""

# echo "🧯 Rimuovi volumi non più utilizzati:"
# echo "Da lanciare da qualsiasi directory"
# echo "(comando nativo)"
# echo "   docker volume prune"
# echo ""

# echo "🐚 Accedi in shell del container:"
# echo "Da lanciare da qualsiasi directory"
# echo "(comando nativo)"
# echo "   docker exec -it <nomeDIRcontainer> bash"
# echo ""

echo "ℹ️ Per rivedere queste istruzioni:"
echo "help.sh"
echo "oppure"
echo "bash help.sh"
echo ""

echo "⚠️ Sostituisci <nomeDIRcontainer> con il nome appropriato della directory/container (es. php, nginx, mysql, php-mysql ecc.)."
