⚠️ **Nota importante**  
> Questa è la **Versione 1** di DockerDevKit: stabile, minimale e funzionante.  
> Ogni container ha già il suo file `.env-<nomecontainer>` e script autonomi per l'avvio/gestione.  
>  
> Le funzionalità avanzate (multi-rete, path dinamici, validazioni, ecc.) sono previste  
> nelle **versioni V2/V3** e verranno documentate in futuro.  
>  
> Puoi già usare DockerDevKit in progetti reali copiando i container **dentro una directory `containers-ddk/`**  
> nel tuo progetto. Non è più previsto il posizionamento diretto nella root del progetto.

---

🚀 Benvenuto in DockerDevKit
=============================

DockerDevKit è un insieme di container Docker modulari e indipendenti,  
già pronti all’uso e progettati per essere collegati tra loro automaticamente.

## ✅ Come usarlo:

- Crea una directory `containers-ddk/` dentro al tuo progetto (se non esiste già)
- Copia dentro `containers-ddk/` una o più cartelle `<nomeDIRcontainer>` (es php, php-mysql ecc)  
- Se non hai un progetto, puoi usare `DockerDevBase` come base già pronta
- Verifica nel file `.env-<nomecontainer>` se è necessario configurare versioni, percorsi, opzioni

---

## 📂 Cos'è DockerDevBase

DockerDevBase è un progetto base già pronto, utile se non hai ancora un tuo progetto.

- Contiene una struttura minimale su cui puoi costruire
- È già compatibile con tutti i container DockerDevKit
- Puoi iniziare da qui, poi aggiungere i container che ti servono
- 🔧 Usalo solo se non hai già un progetto

⚠️ DockerDevBase non è incluso in questo repository.
Puoi trovarlo qui: https://github.com/SantiFromSicily/DockerDevBase

---

## 📦 Ogni container in DockerDevKit:

- È configurabile tramite il proprio file `.env-<nomecontainer>`
- Include script per avvio, stop, distruzione parziale o completa
- Lavora su volume esterno (nessun codice all’interno del container)
- Si collega automaticamente alla rete `Docker_NET` (rete comune)
- Sono previste fino a 3 reti alternative (`Docker_NET0`, `Docker_NET1`, `Docker_NET2`), una attiva per default (`true`) e le altre disponibili (`false`), configurabili da `.env-<nomecontainer>`

---

## 🧩 Puoi aggiungere container a un sistema multicontainer esistente:

- Basta copiare una nuova cartella `<nomeDIRcontainer>` (es php, php-mysql ecc) nella directory `containers-ddk/`
- Il collegamento alla rete comune avviene automaticamente
- 🧪 Utile anche per test temporanei: avvia → prova → distruggi tutto senza lasciare tracce

---
---
---

🛠️ Comandi utili per gestione DockerDevKit
==============================================

📋 Lista container attivi (in esecuzione):  
Da lanciare da qualsiasi directory  
(comando nativo)  
docker ps

▶️ Avvia container:
Da lanciare dalla directory <nomeDIRcontainer>
(comando DockerDevKit - lancia un file)
start-<nomeDIRcontainer>.sh
oppure
bash start-<nomeDIRcontainer>.sh

🛑 Ferma container:
Da lanciare dalla directory <nomeDIRcontainer>
(comando DockerDevKit - lancia un file)
stop-<nomeDIRcontainer>.sh
oppure
bash stop-<nomeDIRcontainer>.sh

🧼 Rimuovi container e volumi:
Da lanciare dalla directory <nomeDIRcontainer>/container-compose-ddk
(comando DockerDevKit - lancia un file)
destroy-<nomeDIRcontainer>.sh
oppure
bash destroy-<nomeDIRcontainer>.sh

🧹 Rimuovi container, volumi e immagine:
Da lanciare dalla directory <nomeDIRcontainer>/container-compose-ddk
(comando DockerDevKit - lancia un file)
destroy-full-<nomeDIRcontainer>.sh
oppure
bash destroy-full-<nomeDIRcontainer>.sh

📋 Lista immagini Docker:
Da lanciare da qualsiasi directory
(comando nativo)
docker images

🧽 Rimuovi un container specifico creato manualmente:
Da lanciare da qualsiasi directory
(comando nativo)
docker rm <nome_container>

ℹ️ Per rivedere queste istruzioni:
help.sh
oppure
bash help.sh

⚠️ Sostituisci <nomeDIRcontainer> con il nome appropriato della directory/container (es. php, nginx, mysql, php-mysql ecc.).

---
---
---

📦 Scaricare solo una directory container specifica (es. php-mysql)
Se vuoi scaricare solo una specifica directory container (che può contenere uno o più container), puoi farlo utilizzando strumenti o comandi specifici.

- ⚠️ Sezione in sviluppo e verrà aggiornata appena disponibile.


☁️ Fonti alternative per il download
Presto saranno disponibili link diretti per scaricare le directory container da:

- Google Drive

- Dropbox

- ZIP GitHub ready-to-go

- ⚠️ Sezione in sviluppo e verrà aggiornata appena disponibile.


### ❤️ Supporta DockerDevKit (& DockerDevBase)

DockerDevKit e DockerDevBase sono liberi e gratuiti, ma richiedono tempo e cura. Puoi contribuire in questi modi:

### ⭐ Segui i progetti su GitHub:
- [DockerDevKit](https://github.com/SantiFromSicily/DockerDevKit)  
- [DockerDevBase](https://github.com/SantiFromSicily/DockerDevBase)  

### ☕ Donazioni e supporto:
- [Ko-fi](https://ko-fi.com/santifromsicily)  
- [PayPal](https://paypal.me/SantiFromSicily)  


### 📬 Contatti e social:
- [Facebook-SantiFromSicily](https://www.facebook.com/share/1ERqoG2W2L/)  
- [LinkedIn-SantiFromSicily](https://www.linkedin.com/in/santi-sicily-ab0a67353)  
 
- ⚠️ Sezione in sviluppo e verrà aggiornata appena disponibile.