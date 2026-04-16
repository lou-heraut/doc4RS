# Équation de diffusion de Fick

## Présentation

La diffusion moléculaire décrit le transport d'espèces chimiques sous l'effet d'un gradient de concentration.
Sa formulation mathématique repose sur les lois de Fick, établies au milieu du XIX^e^ siècle [@fick1855].

## Première loi de Fick

En régime stationnaire, le flux de matière $\mathbf{J}$ est proportionnel au gradient de concentration :

$$
\mathbf{J} = -D \, \nabla C
$$

où :

- $\mathbf{J}$ est le flux molaire (mol m⁻² s⁻¹),
- $D$ est le coefficient de diffusion (m² s⁻¹),
- $C$ est la concentration (mol m⁻³),
- $\nabla C$ est le gradient spatial de concentration.

Le signe négatif traduit le fait que la diffusion se produit **du fort vers le faible** potentiel chimique.

## Deuxième loi de Fick

En régime transitoire, l'évolution temporelle de la concentration obéit à l'équation aux dérivées partielles suivante [@crank1975] :

$$
\frac{\partial C}{\partial t} = \nabla \cdot \left( D \, \nabla C \right)
$$

Pour un coefficient de diffusion $D$ constant et isotrope, cette expression se simplifie en :

$$
\frac{\partial C}{\partial t} = D \, \nabla^2 C
$$

où $\nabla^2 = \Delta$ est l'opérateur laplacien. En coordonnées cartésiennes 1D :

$$
\frac{\partial C}{\partial t} = D \, \frac{\partial^2 C}{\partial x^2}
$$

## Solution analytique (1D, milieu semi-infini)

Pour une condition initiale $C(x, 0) = 0$ et une condition aux limites $C(0, t) = C_0$, la solution exacte fait intervenir la fonction d'erreur complémentaire [@crank1975] :

$$
C(x, t) = C_0 \operatorname{erfc}\!\left( \frac{x}{2\sqrt{D\,t}} \right)
$$

La profondeur de pénétration caractéristique est souvent définie comme :

$$
\delta = 2\sqrt{D\,t}
$$

## Références

\bibliography
