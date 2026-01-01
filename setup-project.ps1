# ============================================================================
# SCRIPT DE CRÉATION - PYTHON BY EKM CONSEILS
# ============================================================================

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  CRÉATION PYTHON BY EKM CONSEILS" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 1. CRÉATION DE LA STRUCTURE
Write-Host "[1/10] Création de la structure..." -ForegroundColor Yellow

$folders = @(
    "src/components/global",
    "src/components/content",
    "src/layouts",
    "src/pages/cours",
    "src/pages/exercices",
    "src/pages/projets",
    "src/pages/methodologie",
    "src/styles",
    "public"
)

foreach ($folder in $folders) {
    New-Item -ItemType Directory -Force -Path $folder | Out-Null
}

# 2. PACKAGE.JSON
Write-Host "[2/10] Création de package.json..." -ForegroundColor Yellow
@"
{
  "name": "python-ekm-training",
  "version": "1.0.0",
  "description": "Python by EKM Conseils - Plateforme d'apprentissage professionnelle",
  "type": "module",
  "private": true,
  "scripts": {
    "dev": "astro dev",
    "build": "astro build",
    "preview": "astro preview"
  },
  "dependencies": {
    "@astrojs/mdx": "^2.0.3",
    "@astrojs/tailwind": "^5.1.0",
    "astro": "^4.0.8",
    "tailwindcss": "^3.4.1"
  },
  "devDependencies": {
    "prettier": "^3.1.1",
    "prettier-plugin-astro": "^0.12.3"
  }
}
"@ | Out-File -FilePath "package.json" -Encoding UTF8 -NoNewline

# 3. GITIGNORE
Write-Host "[3/10] Création de .gitignore..." -ForegroundColor Yellow
@"
node_modules/
dist/
.astro/
.env
.env.local
.env.*.local
.DS_Store
Thumbs.db
.vscode/
.idea/
*.swp
*.swo
"@ | Out-File -FilePath ".gitignore" -Encoding UTF8 -NoNewline

# 4. ASTRO CONFIG
Write-Host "[4/10] Création de astro.config.mjs..." -ForegroundColor Yellow
@"
import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import tailwind from '@astrojs/tailwind';

const isTeacherSite = process.env.PUBLIC_SITE_MODE === 'teacher';

export default defineConfig({
  site: isTeacherSite 
    ? 'https://python-teach-ekm.netlify.app'
    : 'https://python-learn-ekm.netlify.app',
  
  integrations: [
    mdx(),
    tailwind()
  ],
  
  markdown: {
    shikiConfig: {
      theme: 'github-dark-dimmed',
      langs: ['python', 'bash', 'javascript'],
      wrap: true
    }
  }
});
"@ | Out-File -FilePath "astro.config.mjs" -Encoding UTF8 -NoNewline

# 5. TAILWIND CONFIG
Write-Host "[5/10] Création de tailwind.config.mjs..." -ForegroundColor Yellow
@"
/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  theme: {
    extend: {
      colors: {
        ekm: {
          teal: {
            DEFAULT: '#0891b2',
            50: '#f0fdfa',
            100: '#ccfbf1',
            200: '#99f6e4',
            300: '#5eead4',
            400: '#2dd4bf',
            500: '#0891b2',
            600: '#0e7490',
            700: '#155e75',
            800: '#164e63',
            900: '#134e4a',
          },
          slate: {
            DEFAULT: '#1e293b',
            50: '#f8fafc',
            100: '#f1f5f9',
            200: '#e2e8f0',
            300: '#cbd5e1',
            400: '#94a3b8',
            500: '#64748b',
            600: '#475569',
            700: '#334155',
            800: '#1e293b',
            900: '#0f172a',
          }
        }
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', '-apple-system', 'sans-serif'],
        mono: ['JetBrains Mono', 'Menlo', 'monospace'],
      },
    },
  },
  plugins: [],
}
"@ | Out-File -FilePath "tailwind.config.mjs" -Encoding UTF8 -NoNewline

# 6. TSCONFIG
Write-Host "[6/10] Création de tsconfig.json..." -ForegroundColor Yellow
@"
{
  "extends": "astro/tsconfigs/strict",
  "compilerOptions": {
    "jsx": "react-jsx",
    "jsxImportSource": "react"
  }
}
"@ | Out-File -FilePath "tsconfig.json" -Encoding UTF8 -NoNewline

# 7. GLOBAL CSS
Write-Host "[7/10] Création de global.css..." -ForegroundColor Yellow
@"
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  html {
    @apply scroll-smooth;
  }
  
  body {
    @apply font-sans antialiased;
  }
  
  code {
    @apply font-mono text-sm;
  }
}

@layer components {
  .container {
    @apply mx-auto max-w-7xl;
  }
}
"@ | Out-File -FilePath "src/styles/global.css" -Encoding UTF8 -NoNewline

# 8. NETLIFY CONFIG
Write-Host "[8/10] Création de netlify.toml..." -ForegroundColor Yellow
@"
[build]
  command = "npm run build"
  publish = "dist"
  
[build.environment]
  NODE_VERSION = "20"
  PUBLIC_SITE_MODE = "student"

[[headers]]
  for = "/*"
  [headers.values]
    X-Robots-Tag = "index, follow"
    X-Content-Type-Options = "nosniff"
    X-Frame-Options = "SAMEORIGIN"
    Referrer-Policy = "strict-origin-when-cross-origin"
    X-XSS-Protection = "1; mode=block"

[[redirects]]
  from = "/solutions/*"
  to = "/404"
  status = 404
  force = true

[[redirects]]
  from = "/pedagogie/*"
  to = "/404"
  status = 404
  force = true
"@ | Out-File -FilePath "netlify.toml" -Encoding UTF8 -NoNewline

# 9. ROBOTS.TXT
Write-Host "[9/10] Création de robots.txt..." -ForegroundColor Yellow
@"
User-agent: *
Allow: /
"@ | Out-File -FilePath "public/robots.txt" -Encoding UTF8 -NoNewline

# 10. README
Write-Host "[10/10] Création de README.md..." -ForegroundColor Yellow
@"
# Python by EKM Conseils

Plateforme d'apprentissage Python professionnelle.

## Installation

\`\`\`bash
npm install
\`\`\`

## Développement

\`\`\`bash
npm run dev
\`\`\`

## Build

\`\`\`bash
npm run build
\`\`\`
"@ | Out-File -FilePath "README.md" -Encoding UTF8 -NoNewline

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  ✅ STRUCTURE CRÉÉE AVEC SUCCÈS !" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""