# Reprise — Octagon Tactics

Répondre en français. Le projet existe et est jouable : poursuivre à partir des fichiers actuels.

## Lire au début

1. `REPRISE_CODEX.md` : intention du créateur, état, limites, premières actions.
2. `README.md` : règles détaillées, architecture, tests.
3. Les modules utiles à la tâche en cours.

## Intention à préserver

Jeu de carrière d’un combattant MMA dont les combats sont tactiques au tour par tour, dans un octogone 3D. Projet distinct de Cage Legacy. Style low poly expressif, caméra rapprochée de trois quarts, salle sombre sous les projecteurs, main courbe de cinq cartes en papier vieilli. Les images de `references/` sont les références visuelles fournies, pas les assets actuellement intégrés au jeu.

- Trois rounds de cinq tours : bleu puis rouge dans un tour.
- PA maximum 10, puis 8, puis 6 ; récupération de 2 PA par tour ; PA inutilisés conservés sous le plafond.
- Déplacements séparés des PA. Avancer, frapper et reculer pendant une même activation est autorisé. Le centre compte dans les rounds proches.
- Quatre styles, sélections indépendantes par coin, cinq cartes en éventail remplacées individuellement à l’usage.
- Ripostes payées en PA, indépendantes de la main offensive.
- Zones de déplacement octogonales, jets cachés D25/D35, étourdissement et KO.
- Gestes lisibles, ragdoll physique volontairement exagéré.

Les demandes nouvelles de l’utilisateur priment sur ce document. Coûts, dégâts, seuils d’impact et identités fictives sont provisoires et restent à équilibrer.

## Structure

**`dist/` contient les sources du prototype. Ce n’est pas un dossier de compilation jetable. Ne pas le supprimer pour faire un build.**

- `dist/engine.mjs` : règles et état, aucun DOM.
- `dist/app.mjs` : interface et orchestration.
- `dist/arena3d.mjs` : scène Three.js, caméra et gestes.
- `dist/ragdoll.mjs` : simulation Cannon-es.
- `dist/vendor/` : dépendances locales et licences. Éviter de modifier ces bibliothèques.
- `tests/` : validations reproductibles.

Node.js 20+. `npm start` sert le jeu sur `http://127.0.0.1:5173`. Pas de téléchargement de dépendances nécessaire pour démarrer ou tester la version livrée : les modules sont inclus. `npm ci` sert à réinstaller les dépendances de développement si nécessaire.

## Vérification et méthode

- `npm run check` : syntaxe.
- `npm test` : moteur et ragdoll après une modification pertinente.
- Vérifier visuellement les changements d’interface sur ordinateur et en format mobile.
- Contrôler le rendu WebGL natif sur le PC : dans l’environnement précédent, seule la projection 3D de compatibilité SVG était disponible.
- Ne pas annoncer une vérification visuelle ou une absence de bugs non établie.

Garder la séparation règles / interface / rendu / physique. Faire des changements ciblés. Ne pas changer de moteur ou de langage, ajouter une API IA payante ou reconstruire la carrière entière sans demande correspondante. La carrière vient après consolidation du combat.
