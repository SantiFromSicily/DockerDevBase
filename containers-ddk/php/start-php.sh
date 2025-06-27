#!/bin/bash
# =======================================================
# VERSIONE 1 - BASE
    # ENV:
        # NOME CONTAINER ddk-php
        # NOME PROGETTO container-compose-ddk
        # DOCKER_NET0=Docker_NET0
        # PERCORSI VOLUME sono relativi e predefiniti 
    # COMPOSE:
        # - Una sola rete usata: Docker_NET0
        # - Montaggio volume singolo, semplice e diretto
    # start-php.sh:
        # - Pulizia container e volumi esistenti
        # - Creazione rete Docker se mancante
        # - Avvio container Docker
        # - vessun controllo avanzato path, directory ecc..
#
# VERSIONE 2 - GIA TESTATA (non inclusa in questo file)
    # ENV:
    # COMPOSE:
        # - Previsto un config.env nella dir container (per path assoluto e/o altro)
    # start-php.sh:
        # - Controlli su directory obbligatorie
        # - Verifica esistenza directory preconfigurate (best pratice) in container
        # - Creazione directory mancanti (su conferma si/no ma vuote)
        # - PATH da config.env (se esistente)
        # - Validazione path automatico
        # - PATH da config.env (se esistente)
#
# VERSIONE 3 - GIA TESTATA (non inclusa in questo file)
    # ENV:
        # V3: nome container configurabile da variabile in .env di ogni container
        # V3: nome progetto configurabile da variabile in .env di ogni container
        # V3: previste più reti
        # V3: previsti dir multipli e path montabili in .env di ogni container

    # COMPOSE:
        # - Nome container configurabile da variabile in .env del container
        # - Previsto un config.env alla base del progetto (per path assoluto e/o altro)
        # - Previsti più volumi (più cartelle da montare)
        # - Previste più reti
    # start-php.sh:
        # - Controlli su directory obbligatorie
        # - Verifica esistenza directory preconfigurate (best pratice) in container
        # - Creazione directory mancanti (su conferma si/no ma vuote)
        # - PATH da config.env (se esistente)
        # - Validazione path automatico
        # - PATH da config.env (se esistente)
# =======================================================#
#
#
# ============================================================================ 
# SET - Opzioni di sicurezza per lo script
# -e : esci se un comando fallisce
# -u : errore se variabile non definita
# -o pipefail : fallisce se uno nella pipe fallisce
# ============================================================================
set -euo pipefail


# ============================================================================ 
# CARICAMENTO .env container
# ============================================================================
echo "📄 Carico configurazione da .env-php..."
set -a
source "./.env-php"
set +a

# ============================================================================ 
# SEZIONE PER V2/3 - CARICAMENTO config-ddk.env (path) in ogni container
# (configurazione in ogni container)
# ============================================================================
# ...

# ============================================================================ 
# SEZIONE PER V2/3 - CARICAMENTO config-ddk.env (path) alla base del progetto (configurazione solo una volta)
# ============================================================================
# ...

# ============================================================================ 
# SEZIONE PER V2/3 - CONTROLLI CONFIGURAZIONE AVANZATA
# ============================================================================
# ...

# ============================================================================ 
# SEZIONE PER V2/3 - BASE_PATH da argomento o dinamico
# ============================================================================
# ...

# ============================================================================ 
# SEZIONE PER V2/3 - VERIFICA DIR_PATH*
# ============================================================================
# ...

# ============================================================================ 
# PULIZIA CONTAINER E VOLUMI del container 
# ============================================================================
echo "🧹 Controllo container 'ddk-php'..."
if docker ps -aq -f name=^/ddk-php$ | grep -q .; then
  docker stop ddk-php >/dev/null 2>&1
  docker rm ddk-php >/dev/null 2>&1
  echo "✔️ Container 'ddk-php' rimosso."
else
  echo "ℹ️ Nessun container 'ddk-php' esistente."
fi


echo "🧹 Rimozione volumi associati..."
VOLUMI=$(docker volume ls -q --filter "name=ddk_php")
if [[ -n "$VOLUMI" ]]; then
  for v in $VOLUMI; do
    docker volume rm "$v" >/dev/null 2>&1 || echo "⚠️ Impossibile rimuovere volume $v"
    echo "✔️ Volume rimosso: $v"
  done
else
  echo "ℹ️ Nessun volume associato trovato."
fi

# ============================================================================ 
# CREAZIONE RETE DOCKER SE NON ESISTENTI
# ============================================================================
echo "🌐 Verifica rete principale: $DOCKER_NET0"
if ! docker network ls --format '{{.Name}}' | grep -q "^${DOCKER_NET0}$"; then
  docker network create "$DOCKER_NET0"
  echo "✔️ Rete creata: $DOCKER_NET0"
fi

# ============================================================================ 
# AVVIO CONTAINER
# ============================================================================
echo "🚀 Avvio container 'ddk-php'..."
docker-compose --env-file ".env-php" -f "./container-compose-ddk/docker-compose.yml" up -d

# ============================================================================ 
# SEZIONE RISERVATA-- DEBUG VOLUMI
# ============================================================================
# ...

echo "✅ Setup completato."
