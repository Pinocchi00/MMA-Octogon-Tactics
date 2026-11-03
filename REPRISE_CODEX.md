# Reprendre Octagon Tactics dans Codex

Export du prototype 0.3, préparé le 3 novembre 2026. Projet distinct de Cage Legacy. Titre provisoire.

## Démarrage

1. Ouvrir ce dossier racine dans Codex, ou dans VS Code avec l’extension Codex.
2. Demander à Codex de lire `AGENTS.md`, ce fichier et `README.md`.
3. Exécuter `npm run check`, puis `npm test`.
4. Exécuter `npm start` et ouvrir `http://127.0.0.1:5173` dans un navigateur avec WebGL.

Sous Windows, `LANCER_WINDOWS.bat` lance le même serveur si Node.js est disponible. Servir le jeu en HTTP ; ne pas ouvrir `dist/index.html` directement comme fichier local.

Les modules sont inclus. Aucun compte de service, clé API ou accès payant à une IA n’est nécessaire pour jouer.

## Intention du créateur

Continuer le jeu existant, améliorer le plaisir de combat et sa présentation, puis construire une carrière pour un combattant. Le créateur veut des décisions de placement, des styles marqués, des réactions physiques exagérées, une interface claire et une ambiance de combat forte. Avancer par prototypes jouables.

Dernière demande, implémentée dans cette version :

- Soigner le HUD.
- Afficher cinq cartes en main courbe en bas, renouvelées à l’usage.
- Présenter le choix des deux combattants chacun de son côté.
- Détailler les coups et exagérer le ragdoll.
- Faire un jet invisible de 1 à 25 ou de 1 à 35 selon le coup, pouvant étourdir ou mettre KO.
- Remplacer les cases carrées par des octogones au sol.
- Ajouter des détails dans l’arène et dans les gestes.

Sur téléphone : une touche pour soulever et lire une carte disponible, une seconde pour la jouer. Sur ordinateur : survol pour lire, clic pour jouer.

## État du prototype

Quatre profils fictifs, styles et coûts distincts, IA simple et duel local sur un écran. Main de cinq cartes par combattant, paquets cycliques propres au style, mains adaptées au sol, ripostes contextuelles. Combat debout, garde, contrôle latéral, montée et soumission. Trois rounds, jugement, jets cachés et états. Scène low poly, caméra réglable, cage, public, éclairages, accessoires et cartes illustrées. Ragdoll de onze parties reliées avec collisions et récupération.

Les règles exactes sont dans `README.md` et dans le code. Les seuils proposés de 24 pour étourdir et 34 pour le KO sont des hypothèses du prototype, pas un équilibrage final validé par le créateur.

## Limites et première priorité

Le navigateur distant précédent désactivait WebGL. Une projection SVG de la même scène 3D a permis de tester les interactions, mais pas les textures et ombres du rendu principal. **Première priorité : lancer sur le PC et vérifier le rendu WebGL, les lumières, les contacts, les performances et les chutes.**

L’IA est simple, les animations sont procédurales, le sol est simplifié. La règle décide du résultat d’un coup ; la physique met en scène la réaction. Les articulations du ragdoll sont simulées physiquement. Les octogones sont des zones régulières espacées sur un graphe à huit voisins, pas une tessellation parfaite. Pas encore de son, de carrière développée ou de sauvegarde de carrière.

Validations déjà réalisées : syntaxe des modules ; 64 combats simulés ; mains, remplacement, D25/D35, protections, durée des états, transitions au sol et jugement ; stabilité du ragdoll, collisions, récupération et nettoyage. Interface vérifiée sur ordinateur et à 390 × 844.

## Références visuelles incluses

- `lowpoly-boxing.jpg`, `lowpoly-fighter.jpg` : volumes et personnages stylisés.
- `arcade-expression.jpg`, `fighter-profile-ui.jpg` : expressivité et présentation sportive.
- `mma-ko-reference.jpg`, `mma-knee-reference.jpg` : cage, impacts, gestes et cadrages.
- `cards-atmosphere.jpg` : cartes physiques, papier vieilli et ambiance sombre.

## Codex sur le web

Créer un nouveau dépôt privé avec le contenu de ce dossier : `dist/`, `tests/`, `scripts/`, `references/` et les fichiers de contexte à la racine. Sélectionner ce dépôt pour préparer l’environnement Codex. Lancer et tester cette version ne nécessite pas de téléchargement de dépendances.

Cet export n’inclut ni historique Git ni accès de publication au site précédent. Les modifications dans ce dossier ou dans un nouveau dépôt ne mettront pas automatiquement à jour ce site. L’export sert à poursuivre le projet dans un environnement de développement autonome.

## Message de première tâche

Lis AGENTS.md, REPRISE_CODEX.md et README.md. Reprends ce prototype existant sans repartir de zéro. Vérifie le lancement, exécute les contrôles et les tests, puis ouvre le jeu pour vérifier le rendu WebGL natif, le HUD, les cinq cartes en éventail et le ragdoll. Fais un bilan court des problèmes observés et corrige les blocages avant d’ajouter des fonctionnalités. Préserve les règles actuelles sauf si je demande un changement.
