# doc4RS — Doc for Research Software

Documentation web avec équations mathématiques et références bibliographiques,
générée avec MkDocs et exportable en PDF via pandoc.

Site en ligne : https://louis-heraut.github.io/doc4RS/

---

## Prérequis système

Ces outils s'installent une seule fois sur votre machine.

### Python 3

Vérifiez qu'il est déjà installé :
```bash
python3 --version
```
Si la commande échoue :
```bash
sudo apt install python3 python3-venv
```

### Pandoc et LaTeX (pour l'export PDF)

```bash
sudo apt install pandoc texlive-xetex fonts-dejavu
```

---

## Installation du projet

Clonez ou téléchargez le projet, puis dans le dossier :

```bash
make install
```

Cette commande crée un environnement Python isolé et installe toutes
les dépendances (MkDocs, thème Material, plugin BibTeX). Elle vérifie
aussi que pandoc est bien disponible.

> Cette commande n'est à lancer qu'une seule fois.

---

## Utilisation au quotidien

### Visualiser la documentation dans le navigateur

```bash
make serve
```

Ouvre un serveur local à l'adresse `http://127.0.0.1:8000`.
La page se recharge automatiquement à chaque sauvegarde de fichier.

### Publier sur GitHub Pages

```bash
make deploy
```

Build le site et le publie en ligne en une seule commande.

### Générer le PDF

```bash
make pdf
```

Le PDF est créé dans `site/documentation.pdf`.
Les équations mathématiques et les références bibliographiques
sont correctement rendues.

### Construire le site web statique sans publier

```bash
make build
```

Les fichiers HTML sont générés dans le dossier `site/`.

### Nettoyer les fichiers générés

```bash
make clean
```

Supprime le dossier `site/`. Utile pour repartir d'un build propre.

---

## Structure du projet

```
doc4RS/
├── Makefile               # toutes les commandes
├── mkdocs.yml             # configuration du site
├── README.md              # ce fichier
└── docs/
    ├── index.md           # page d'accueil
    ├── diffusion.md       # exemple de page avec équations
    ├── refs.bib           # bibliographie au format BibTeX
    ├── apa.csl            # style de citation (APA)
    └── javascripts/
        └── mathjax.js     # configuration des équations
```

---

## Écrire une page

### Insérer une équation

Équation dans le texte (inline) :
```
La loi de Fick s'écrit $\mathbf{J} = -D \, \nabla C$.
```

Équation centrée sur sa propre ligne :
```
$$
\frac{\partial C}{\partial t} = D \, \nabla^2 C
$$
```

### Citer une référence

Ajoutez d'abord votre source dans `docs/refs.bib`, puis citez-la dans le texte :
```
Ce résultat a été démontré par [@fick1855].
```

Placez `\bibliography` à la fin de la page pour afficher la liste des références.

### Ajouter une nouvelle page

1. Créez un fichier `docs/ma-page.md`
2. Ajoutez-le dans la navigation dans `mkdocs.yml` :

```yaml
nav:
  - Accueil: index.md
  - Diffusion de Fick: diffusion.md
  - Ma nouvelle page: ma-page.md
```

---

## Configurer GitHub Pages (première fois)

### 1. Pousser le projet sur GitHub

```bash
git init
git remote add origin https://github.com/<votre-pseudo>/doc4RS.git
git add .
git commit -m "initial commit"
git push -u origin main
```

### 2. Autoriser GitHub Actions à écrire sur le dépôt

Dans votre dépôt GitHub : **Settings > Actions > General**,
faites défiler jusqu'à **Workflow permissions** et sélectionnez
**Read and write permissions**, puis sauvegardez.

### 3. Premier déploiement

```bash
make deploy
```

### 4. Activer GitHub Pages

Dans votre dépôt GitHub : **Settings > Pages**,
sélectionnez la branche `gh-pages` comme source et sauvegardez.

Le site est accessible à `https://<votre-pseudo>.github.io/doc4RS/`
en moins d'une minute.

> Les déploiements suivants se font simplement avec `make deploy`,
> sans avoir à retoucher les paramètres GitHub.
