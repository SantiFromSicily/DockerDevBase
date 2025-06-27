# DockerDevBase

DockerDevBase è un progetto base per lo sviluppo, pensato inizialmente per Docker ma facilmente estendibile ad altri stack.  
È una struttura modulare e flessibile, adatta come punto di partenza per container singoli o multipli, e potenzialmente per altri tipi di sistemi in futuro.

---

## 📂 Scopo

⚠️ Al momento DockerDevBase usa container DockerDevKit in versione 1 (v1).  
- Alcune funzionalità evolute arriveranno con le versioni successive.

⚠️ DockerDevKit non è incluso in questo repository.
- Puoi trovarlo qui: https://github.com/SantiFromSicily/DockerDevKit

- DockerDevBase serve come **base di partenza** se non hai un progetto esistente.  
- Puoi copiarlo e personalizzarlo con i container Docker che desideri usare.

---

## ⚙️ Come funziona

- Copia la cartella di un container singolo o multiplo (es. `php/`) dentro `DockerDevBase/containers-ddk/`
- DockerDevBase diventa così un progetto operativo pronto per lanciare quei container
- La cartella `src-php` (nel caso del container PHP) funge da volume convenzionale per il codice o dati montati nei container
- Puoi aggiungere, rimuovere o sostituire i container copiando le relative cartelle

---

## 📂 Cos'è DockerDevBase

DockerDevBase è un progetto base già pronto, utile se non hai ancora un tuo progetto esistente.

- Contiene una struttura minimale su cui puoi costruire.
- È già compatibile con tutti i container **DockerDevKit**
- Puoi iniziare da qui, poi aggiungere i container che ti servono  
- 🔧 Usalo solo se non hai già un progetto

---

## ✅ Come usarlo

- Copia dentro `containers-ddk/` una o più cartelle `<nomeDIRcontainer>` (es. `php`, `php-mysql` ecc.)
- Verifica nel file `.env-<nomecontainer>` se è necessario configurare versioni, percorsi, opzioni

---

## 📦 Ogni container in DockerDevKit

- È configurabile tramite il proprio file `.env-<nomecontainer>`
- Include script per avvio, stop, distruzione parziale o completa
- Lavora su volume esterno (nessun codice all’interno del container)
- Si collega automaticamente alla rete `Docker_NET` (rete comune)
- Sono previste fino a 3 reti alternative (`Docker_NET0`, `Docker_NET1`, `Docker_NET2`), una attiva per default (`true`) e le altre disponibili (`false`), configurabili da `.env-<nomecontainer>`

---

## 🧩 Puoi aggiungere container a un sistema multicontainer esistente

- Basta copiare una nuova cartella `<nomeDIRcontainer>` (es. `php`, `php-mysql` ecc.) nella directory `containers-ddk/`
- Il collegamento alla rete comune avviene automaticamente
- 🧪 Utile anche per test temporanei: avvia → prova → distruggi tutto senza lasciare tracce

---
---
---

📦 Scaricare solo una directory specifica (es. src-php ecc..)
Se vuoi scaricare solo una specifica directory (che continene codice utilizzabile), puoi farlo utilizzando strumenti o comandi specifici.

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