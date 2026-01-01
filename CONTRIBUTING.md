# Guide de contribution

Merci de votre intérêt pour contribuer au site pédagogique Python !

## Comment contribuer

### Ajouter un nouveau cours

1. Créez un fichier `.mdx` dans `src/content/cours/`
2. Suivez le template du cours exemple
3. Respectez le front-matter YAML
4. Testez localement avec `npm run dev`
5. Vérifiez l'accessibilité et la performance

### Ajouter des exercices

1. Créez un fichier `.mdx` dans `src/content/exercices/`
2. Utilisez les composants `InteractiveBlock`
3. Ajoutez toujours un `TeacherOnly` avec le corrigé
4. Testez la sauvegarde des réponses

### Modifier le design

1. Les styles sont dans `src/styles/global.css`
2. Configuration Tailwind dans `tailwind.config.mjs`
3. Respectez les conventions d'accessibilité
4. Testez en mode clair et sombre

## Règles importantes

### ⚠️ Interdictions absolues

- **Ne jamais mentionner "LudickScience"** dans aucun fichier
- **Ne jamais modifier le footer** (texte contractuel)
- **Ne jamais exposer les corrigés** sans `TeacherOnly`

### ✅ Bonnes pratiques

- **Accessibilité** : Tous les contenus doivent être accessibles
- **Performance** : Lighthouse ≥ 90 sur toutes les métriques
- **SEO** : Balises meta appropriées sur chaque page
- **Code** : Suivre les conventions PEP 8 pour les exemples Python
- **Commits** : Messages clairs et descriptifs

## Structure d'un cours type

```mdx
---
title: "Titre explicite"
level: ["Bac Pro CIEL", "BTS CIEL", "BTS SIO"]
type: "cours"
slug: "slug-kebab-case"
objectifs:
  - "Objectif mesurable 1"
  - "Objectif mesurable 2"
prerequis:
  - "Prérequis 1"
duree_estimee: "1h30"
auteur: "Eric MORMIN"
updated: "YYYY-MM-DD"
mots_cles: ["mot1", "mot2"]
---

import InteractiveBlock from '../../components/InteractiveBlock.astro';
import TeacherOnly from '../../components/TeacherOnly.astro';

## Section 1

Contenu pédagogique...

<InteractiveBlock
  id="unique-id-1"
  title="À vous de jouer"
  type="code"
/>

<TeacherOnly title="Corrigé">
Correction détaillée...
</TeacherOnly>
```

## Tests avant soumission

1. **Build** : `npm run build` sans erreurs
2. **Lighthouse** : Score ≥ 90 partout
3. **Accessibilité** : Navigation clavier, lecteur d'écran
4. **Responsive** : Tester mobile, tablette, desktop
5. **Mode sombre** : Vérifier le contraste

## Process de review

1. Fork du projet
2. Créer une branche : `git checkout -b feature/nom-feature`
3. Commits atomiques et descriptifs
4. Tests locaux complets
5. Pull request avec description détaillée

## Questions ?

Pour toute question :
- Consultez le README.md
- Vérifiez les exemples existants
- Contactez EKM Conseils

## Licence

Toute contribution est soumise à la licence du projet.

© 2025–2026 Eric MORMIN — Tous droits réservés
