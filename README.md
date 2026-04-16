# Ma Documentation Scientifique

Documentation web avec équations mathématiques et références bibliographiques,
générée avec MkDocs et exportable en PDF via pandoc.

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

### Générer le PDF

```bash
make pdf
```

Le PDF est créé dans `site/documentation.pdf`.
Les équations mathématiques et les références bibliographiques
sont correctement rendues.

### Construire le site web statique

```bash
make build
```

Les fichiers HTML sont générés dans le dossier `site/`.
Ils peuvent être déposés sur n'importe quel hébergeur web.

### Nettoyer les fichiers générés

```bash
make clean
```

Supprime le dossier `site/`. Utile pour repartir d'un build propre.

---

## Structure du projet

```
mon-projet/
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

## Publier sur GitHub Pages

Poussez votre projet sur GitHub, puis ajoutez ce fichier
`.github/workflows/deploy.yml` :

```yaml
name: Deploy

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.x'
      - run: pip install mkdocs mkdocs-material mkdocs-bibtex
      - run: mkdocs gh-deploy --force
```

Le site sera accessible à l'adresse :
`https://<votre-pseudo-github>.github.io/<nom-du-repo>`
