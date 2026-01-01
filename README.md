# Site Pédagogique Python - La Salle Saint-Nicolas

Site web statique de ressources pédagogiques pour l'apprentissage de Python, destiné aux formations Bac Pro CIEL, BTS CIEL et BTS SIO.

**Édité par EKM Conseils (www.ekmconseils.eu)**  
**Établissement : La Salle Saint-Nicolas, Issy-les-Moulineaux**

## 🚀 Fonctionnalités

- **Cours participatifs** : Blocs interactifs avec saisie de réponses
- **Sauvegarde automatique** : Réponses persistées en localStorage
- **Export des réponses** : Téléchargement au format JSON
- **Mode Professeur** : Accès sécurisé aux corrigés et barèmes
- **Mode sombre** : Interface adaptable
- **Netlify Forms** : Soumission optionnelle des réponses
- **Accessibilité** : Conforme WCAG 2.1 niveau AA

## 📋 Prérequis

- Node.js 20 ou supérieur
- npm ou yarn
- Compte Netlify (pour le déploiement)

## 🛠️ Installation

### 1. Cloner le projet

```bash
git clone <url-du-repo>
cd site-pedagogique-python
```

### 2. Installer les dépendances

```bash
npm install
```

### 3. Configuration des variables d'environnement (optionnel)

Créez un fichier `.env` à la racine du projet :

```env
# Hash SHA-256 du mot de passe professeur
# Pour générer le hash : echo -n "votre_mot_de_passe" | sha256sum
PUBLIC_TEACHER_PWD_HASH=votre_hash_sha256_ici
```

### 4. Lancer le serveur de développement

```bash
npm run dev
```

Le site sera accessible à l'adresse : `http://localhost:4321`

## 📦 Build et déploiement

### Build local

```bash
npm run build
```

Les fichiers statiques sont générés dans le dossier `dist/`.

### Preview du build

```bash
npm run preview
```

### Déploiement sur Netlify

#### Méthode 1 : Via Git (recommandé)

1. Poussez votre code sur GitHub/GitLab
2. Connectez votre repository dans l'interface Netlify
3. Configuration automatique via `netlify.toml`

#### Méthode 2 : Déploiement manuel

```bash
# Installer Netlify CLI
npm install -g netlify-cli

# Se connecter
netlify login

# Déployer
netlify deploy --prod
```

## 🔧 Configuration Netlify

### Variables d'environnement

Dans les paramètres de votre site Netlify, ajoutez :

| Variable | Valeur | Description |
|----------|--------|-------------|
| `PUBLIC_TEACHER_PWD_HASH` | Hash SHA-256 | Hash du mot de passe professeur |

### Netlify Forms (optionnel)

Les formulaires avec `data-netlify="true"` sont automatiquement détectés par Netlify. Aucune configuration supplémentaire n'est nécessaire.

### Netlify Identity (optionnel)

Pour utiliser l'authentification Netlify Identity :

1. Activez Identity dans les paramètres Netlify
2. Configurez le rôle "teacher" pour les enseignants
3. Les enseignants pourront se connecter via `/prof`

## 📝 Ajouter du contenu

### Structure des dossiers

```
src/
├── content/
│   ├── cours/           # Fichiers .mdx des cours
│   ├── exercices/       # Fichiers .mdx des exercices
│   └── ressources/      # Fichiers .mdx des ressources
```

### Créer un nouveau cours

1. Créez un fichier `.mdx` dans `src/content/cours/`
2. Utilisez le template suivant :

```mdx
---
title: "Titre du cours"
level: ["Bac Pro CIEL", "BTS CIEL", "BTS SIO"]
type: "cours"
slug: "slug-du-cours"
objectifs:
  - "Objectif 1"
  - "Objectif 2"
prerequis:
  - "Prérequis 1"
duree_estimee: "1h30"
auteur: "Eric MORMIN"
updated: "2025-12-14"
mots_cles: ["python", "variables"]
---

import InteractiveBlock from '../../components/InteractiveBlock.astro';
import TeacherOnly from '../../components/TeacherOnly.astro';

## Introduction

Votre contenu ici...

<InteractiveBlock
  id="bloc-1"
  title="À vous de jouer"
  type="code"
  question="Votre question ?"
  placeholder="# Votre code ici"
/>

<TeacherOnly title="Corrigé">
Votre corrigé ici (visible uniquement en mode professeur)
</TeacherOnly>
```

### Créer des exercices

Même principe que les cours, dans `src/content/exercices/`.

### Types de blocs interactifs

```mdx
<!-- Bloc de texte -->
<InteractiveBlock
  id="unique-id"
  title="Titre du bloc"
  type="text"
  question="Question ?"
  placeholder="Votre réponse..."
/>

<!-- Bloc de code -->
<InteractiveBlock
  id="unique-id"
  title="Titre du bloc"
  type="code"
  question="Question ?"
  placeholder="# Code Python"
/>

<!-- QCM -->
<InteractiveBlock
  id="unique-id"
  title="Titre du bloc"
  type="qcm"
  question="Question ?"
  options={[
    "Option 1",
    "Option 2",
    "Option 3"
  ]}
/>
```

## 🔐 Mode Professeur

### Méthode 1 : Mot de passe (recommandé)

1. Générez un hash SHA-256 de votre mot de passe :
   ```bash
   echo -n "mon_mot_de_passe" | sha256sum
   ```

2. Ajoutez le hash dans les variables d'environnement Netlify :
   `PUBLIC_TEACHER_PWD_HASH=votre_hash`

3. Les enseignants se connectent via `/prof`

### Méthode 2 : Netlify Identity

1. Activez Netlify Identity
2. Créez un utilisateur avec le rôle "teacher"
3. Les enseignants se connectent via l'interface Identity

### Masquer du contenu aux apprenants

Utilisez le composant `TeacherOnly` :

```mdx
<TeacherOnly title="Corrigé">
Ce contenu n'est visible qu'en mode professeur.
Il n'est pas chargé dans le DOM pour les apprenants.
</TeacherOnly>
```

## 🎨 Personnalisation

### Couleurs

Modifiez `tailwind.config.mjs` pour personnaliser les couleurs :

```javascript
colors: {
  primary: {
    // Vos couleurs primaires
  },
  secondary: {
    // Vos couleurs secondaires
  }
}
```

### Footer

Le footer est défini dans `src/components/Footer.astro`.  
**⚠️ Important** : Le texte du footer est contractuel et ne doit pas être modifié.

## 📊 Performance

### Objectifs Lighthouse

- Performance : ≥ 90
- Accessibilité : ≥ 90
- Best Practices : ≥ 90
- SEO : ≥ 90

### Optimisations

- Images : Utilisez des formats modernes (WebP, AVIF)
- Lazy loading : Activé par défaut
- Code splitting : Automatique avec Astro
- CSS : Inline pour les styles critiques

## ♿ Accessibilité

Le site respecte les standards WCAG 2.1 niveau AA :

- Navigation au clavier complète
- Contraste minimum 4.5:1
- Textes alternatifs pour les images
- Labels sur tous les formulaires
- Structure sémantique HTML5
- Support des lecteurs d'écran

## 📱 Responsive

Le site est entièrement responsive et testé sur :

- Desktop (≥ 1024px)
- Tablette (768px - 1023px)
- Mobile (< 768px)

## 🧪 Tests

### Build local

```bash
npm run build
```

### Vérifier les liens cassés

```bash
npm run astro check
```

### Lint

```bash
npm run lint
```

## 🔍 SEO

### Sitemap

Généré automatiquement à `/sitemap.xml`

### Robots.txt

À créer dans `public/robots.txt` si nécessaire.

### Meta tags

Définis dans chaque page via le layout.

## 📄 Licence

© 2025–2026 Eric MORMIN — Tous droits réservés  
Édité par EKM Conseils (www.ekmconseils.eu)

Ressource pédagogique réalisée pour La Salle Saint-Nicolas, Issy-les-Moulineaux.

## 👤 Auteur

**Eric MORMIN**  
EKM Conseils  
[www.ekmconseils.eu](https://www.ekmconseils.eu)

## 🆘 Support

Pour toute question ou problème :

1. Consultez cette documentation
2. Vérifiez les issues GitHub (si applicable)
3. Contactez EKM Conseils

## 📚 Technologies utilisées

- [Astro](https://astro.build/) - Framework web statique
- [Tailwind CSS](https://tailwindcss.com/) - Framework CSS
- [MDX](https://mdxjs.com/) - Markdown avec composants
- [Netlify](https://www.netlify.com/) - Hébergement et CI/CD

## 🔄 Mises à jour

Pour mettre à jour le contenu :

1. Modifiez les fichiers `.mdx` dans `src/content/`
2. Committez et poussez sur Git
3. Netlify rebuild automatiquement le site

## ⚠️ Avertissements importants

- **Ne jamais mentionner "LudickScience"** dans aucun fichier
- **Le footer est contractuel** et ne doit pas être modifié
- **Les corrigés doivent être masqués** aux apprenants (utiliser `TeacherOnly`)
- **Respecter les conventions de nommage** PEP 8 pour les exemples de code
