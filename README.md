# Octagon Tactics — Fight Night 0.3

Nouveau prototype de MMA tactique sur octogones, avec une future carrière de combattant. Export autonome du prototype, titre et identités fictives provisoires.

## Combat jouable

- 3 rounds de 5 tours ; un tour comprend une activation bleue puis une rouge.
- PA initiaux et maximum : 10, 8, 6. Récupération de 2 PA au début des tours 2 à 5. Réserves inutilisées conservées sous le plafond.
- Déplacements indépendants : renouvelés à chaque tour, non cumulés. Déplacements et cartes peuvent être alternés librement.
- Zones au sol affichées comme des octogones réguliers espacés ; graphe de voisinage à huit directions. Centre mesuré après les deux activations.
- 4 styles et 4 profils fictifs : Milo Vega (boxe), Arun Suri (muay-thaï), Boris Volkov (lutte), Rafael Costa (jiu-jitsu). Sélections bleue et rouge indépendantes.
- 5 cartes en main par joueur. À l’usage, seule la carte utilisée est immédiatement remplacée. Ordre de paquet propre au style, cyclique et sans service externe.
- Une main de 5 cartes adaptée remplace la main debout à l’entrée au sol. Certaines techniques peuvent apparaître en double au sol. Les ripostes restent indépendantes de la main.
- Jab, direct arrière, crochet, uppercut, middle/high/low kick, teep, genou, coude, feinte, double leg, techniques au sol.
- Une riposte maximum par action : garde de base, blocage, contre, esquive, sprawl, défense au sol ou maintien, selon le contexte et les PA disponibles.
- Lutte simplifiée : garde, contrôle latéral, montée. Deux tentatives de soumission réussies depuis une position dominante concluent le combat.
- KO à 0 PV ou par impact critique, soumission ou jugement. Retour debout et PA remplis entre les rounds ; dégâts conservés.

## Jets cachés et étourdissement

Chaque frappe fait un jet entier uniforme caché. Jab, teep, low kick et frappes courtes : D25 ; autres frappes : D35. Aucun dé ni résultat numérique n'est affiché pendant le combat.

Le résultat d’impact est : jet + 10 si la cible est déjà sonnée + floor((100 − PV restants)/25), moins 8 en cas de blocage/défense au sol ou 3 en cas de contre.

- Impact >= 24 : étourdissement.
- Impact >= 34 : KO, sauf sur un blocage ou une défense au sol, qui protège du KO aléatoire.
- Esquive réussie : aucun dégât, aucun état causé.
- Contre à portée 1 : 4 dégâts avec son propre D25.
- État sonné : 2 PA et 1 déplacement retirés lors de l’activation suivante (ou immédiatement si le contre sonne le joueur actif), puis récupération en fin de cette activation. Un nouveau coup peut renouveler cet état.

Ces seuils sont des hypothèses d’équilibrage du prototype, configurées dans `IMPACT_RULES`. Le jet de base existe sur chaque frappe ; seul un coup ayant causé des dégâts peut provoquer un état.

Jugement : dégâts + 6 par menace de soumission + 4 par impact étourdissant. Écart d’au moins 3 pour décider par efficacité ; sinon contrôle effectif à partir de 2 d’écart, puis présence au centre. 10–9 ou 10–10. Il s’agit de règles de jeu expérimentales.

## Présentation et physique

HUD de combat plein écran, informations bleues et rouges de part et d’autre, compteur de PA et déplacements distincts. Main en éventail de cinq cartes illustrées, remplacement animé. Sur mobile, les cinq cartes restent visibles ; une première touche soulève la carte disponible pour la lire, une seconde la joue.

Scène 3D Three.js : personnages low poly articulés et morphologies par style, cage et grillage qui s’efface au premier plan, tribunes, éclairages, ombres, gradins, caméras de bord de cage, seaux, tabourets, marches, boulons et bandes lumineuses. Caméra de trois quarts avec zoom, rotation et vue d’ensemble.

Ragdoll Cannon-es : 11 corps rigides articulés, 10 contraintes, collisions avec le sol et huit parois. Impulsions volontairement exagérées, rotations des membres et rebonds. Chute sur frappe lourde non suffisamment absorbée, étourdissement et KO. Récupération après une chute temporaire ; ragdoll persistant sur KO jusqu’au prochain combat. Les frappes ont une préparation, une accélération vers le contact et une récupération ; particules et secousse de caméra à l’impact.

Le rendu principal utilise WebGL. Un rendu SVG de compatibilité projette la même scène 3D, la même caméra et les mêmes corps physiques si WebGL manque ; il omet textures et ombres. Le navigateur de validation désactive WebGL : les interactions et animations y sont vérifiées par le rendu de compatibilité, sans prétendre valider les effets WebGL.

## Architecture

- `dist/engine.mjs` : état, mains, ressources, actions, jets cachés, IA, jugement. Aucun DOM.
- `dist/app.mjs` : HUD, sélection, cartes, réactions, orchestration.
- `dist/arena3d.mjs` : scène, caméra, corps articulés, gestes, particules et sélection d’octogones.
- `dist/ragdoll.mjs` : corps rigides, contraintes et durée des chutes.
- `dist/style.css`, `dist/index.html` : interface responsive.
- `dist/vendor/` : Three.js 0.180.0 et Cannon-es 0.20.0, bibliothèques et licences MIT incluses. Aucune dépendance CDN, clé API ni requête IA pour jouer.

Installation de développement : `npm ci`. Les modules servis sont déjà inclus dans `dist/vendor/`. Aucune compilation nécessaire. Pas de sauvegarde de carrière ; recharger la page recommence le prototype.

## Vérification

- `node --check dist/engine.mjs`, `node --check dist/app.mjs`, `node --check dist/arena3d.mjs`, `node --check dist/ragdoll.mjs`.
- `node tests/combat.mjs` : cinq cartes et remplacement exact, ressources, limites D25/D35, KO, protection, durée des états, contextes au sol, scoring, 64 parties simulées.
- `node tests/ragdoll.mjs` : 11 parties physiques, vol sous contraintes, collisions, récupération, persistance du KO et nettoyage.
- QA navigateur : sélections indépendantes, approche par octogones, carte remplacée avant résolution, riposte, animation et reprise après étourdissement.

## Suite du développement

1. Tester les seuils d’impact et le rythme de récupération ; surveiller les KO trop fréquents et les stratégies dominantes de main.
2. Améliorer les contacts, les animations de lutte, les renversements et l’IA.
3. Enrichir silhouettes, personnalisation, son et réactions du public.
4. Construire la carrière minimale : création du combattant, entraînement, choix d’adversaire, combat, progression des techniques.
5. Ajouter contrats, rivalités et blessures après validation de cette boucle.

## Reprise autonome

Commencer par `REPRISE_CODEX.md`. `npm start` lance le serveur local ; `npm run check` vérifie la syntaxe ; `npm test` lance les tests.
