# 🚀 Guide de démarrage rapide

Bienvenue dans le projet **Site Pédagogique Python** !

## 📦 Contenu du projet

Vous avez téléchargé une structure de projet Astro complète avec :

✅ **Pages principales**
- Accueil avec filtres et recherche
- Section Cours
- Section Exercices
- Ressources
- À propos
- Mentions légales
- Mode Professeur

✅ **Composants**
- Header avec navigation responsive
- Footer (texte contractuel)
- Cards pour afficher les contenus
- InteractiveBlock (blocs interactifs avec sauvegarde)
- TeacherOnly (masquage des corrigés)
- Breadcrumb

✅ **Contenus exemples**
- 1 cours complet : "Introduction aux variables en Python"
- 1 série d'exercices : "Exercices : Variables et types de données"
- Corrigés masqués en mode professeur

✅ **Fonctionnalités**
- Sauvegarde automatique en localStorage
- Export des réponses (JSON)
- Mode sombre
- Recherche et filtres
- Mode Professeur avec authentification
- Chronomètre pour les exercices
- Accessibilité WCAG 2.1 AA

## 🎯 Démarrage en 3 étapes

### 1. Installation

```bash
cd site-pedagogique-python
npm install
```

### 2. Lancement

```bash
npm run dev
```

Ouvrez http://localhost:4321 dans votre navigateur.

### 3. Configuration du Mode Professeur (optionnel)

Pour activer le mode professeur avec mot de passe :

```bash
# Générer le hash du mot de passe "teacher123"
echo -n "teacher123" | sha256sum

# Créer le fichier .env
cp .env.example .env

# Éditer .env et ajouter le hash
nano .env
```

Ajoutez dans `.env` :
```
PUBLIC_TEACHER_PWD_HASH=2bb80d537b1da3e38bd30361aa855686bde0eacd7162fef6a25fe97bf527a25b
```

## 📝 Ajouter votre premier cours

1. Créez `src/content/cours/mon-cours.mdx`

2. Copiez le template :

```mdx
---
title: "Mon premier cours"
level: ["Bac Pro CIEL"]
type: "cours"
slug: "mon-premier-cours"
objectifs:
  - "Apprendre X"
  - "Comprendre Y"
duree_estimee: "1h00"
auteur: "Eric MORMIN"
updated: "2025-12-14"
---

import InteractiveBlock from '../../components/InteractiveBlock.astro';

## Introduction

Votre contenu...

<InteractiveBlock
  id="exercice-1"
  title="À vous de jouer"
  type="code"
  placeholder="# Votre code"
/>
```

3. Sauvegardez et rechargez la page !

## 🌐 Déploiement sur Netlify

### Méthode rapide

1. Poussez votre code sur GitHub
2. Allez sur https://app.netlify.com
3. Cliquez sur "New site from Git"
4. Sélectionnez votre repository
5. Netlify détecte automatiquement la configuration (netlify.toml)
6. Cliquez sur "Deploy"

### Variables d'environnement Netlify

Dans Settings > Environment variables, ajoutez :

```
PUBLIC_TEACHER_PWD_HASH = votre_hash_ici
```

## 📚 Documentation complète

Consultez `README.md` pour :
- Guide complet d'installation
- Configuration avancée
- Ajout de contenus
- Personnalisation
- Meilleures pratiques

## 🎨 Personnalisation rapide

### Couleurs

Éditez `tailwind.config.mjs` :

```javascript
colors: {
  primary: {
    600: '#votre-couleur',
    // ...
  }
}
```

### Titre du site

Éditez `src/components/Header.astro` :

```astro
Python Pédagogique  ← Changez ici
```

## ✅ Checklist avant production

- [ ] Build sans erreurs : `npm run build`
- [ ] Test en local : `npm run preview`
- [ ] Lighthouse score ≥ 90
- [ ] Mode Professeur configuré
- [ ] Footer vérifié (ne pas modifier)
- [ ] Pas de mention "LudickScience"
- [ ] Tests accessibilité (clavier, lecteur d'écran)

## 🆘 Problèmes courants

### npm install échoue
```bash
# Nettoyer le cache
npm cache clean --force
rm -rf node_modules package-lock.json
npm install
```

### Build échoue
```bash
# Vérifier les erreurs TypeScript
npm run astro check
```

### Le Mode Professeur ne fonctionne pas
- Vérifiez que le hash est correct
- Regardez la console du navigateur (F12)
- Vérifiez que la variable d'environnement est bien définie

## 📞 Support

Pour toute question :
1. Consultez README.md et CONTRIBUTING.md
2. Vérifiez les exemples fournis
3. Contactez EKM Conseils

---

**Bon développement ! 🎉**

© 2025–2026 Eric MORMIN — Tous droits réservés  
EKM Conseils · www.ekmconseils.eu
