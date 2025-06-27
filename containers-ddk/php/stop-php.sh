#!/bin/bash
# ===================================================================
# STOP - Ferma il container ddk-php SENZA eliminare rete o immagine
# - Ferma e rimuove il container
# - Può rimuovere i volumi se associati (opzionale, vedi commento)
# - NON rimuove la rete Docker_NET0 (mai!)
# ===================================================================

echo "🛑 Stop container ddk-php..."

# =====================================================
# Carica configurazioni (modificabili)
# =====================================================
set -a
source .env-php
set +a

# =====================================================
# Ferma e rimuove il container (senza eliminare rete!)
# =====================================================
docker-compose --env-file .env-php -f container-compose-ddk/docker-compose.yml down \
  --remove-orphans

# 🔽 FACOLTATIVO: se vuoi rimuovere volumi (sconsigliato qui, ma permesso)
# docker-compose --env-file .env-php -f container-compose-ddk/docker-compose.yml down -v


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
