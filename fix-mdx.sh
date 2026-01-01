#!/bin/bash
# Script de correction des opérateurs << et >> dans les fichiers MDX

echo "🔧 Correction des fichiers MDX..."

# Fonction pour corriger un fichier
fix_file() {
    local file="$1"
    echo "  Correction de $(basename "$file")..."
    
    # Sauvegarder l'original
    cp "$file" "$file.bak"
    
    # Remplacer tous les blocs de code sans langage par des blocs text
    sed -i 's/^```$/```text/g' "$file"
    
    echo "  ✅ $(basename "$file") corrigé"
}

# Corriger tous les fichiers MDX qui contiennent << ou >>
cd "$(dirname "$0")"

find src/content -name "*.mdx" -type f | while read file; do
    if grep -q "<<\|>>" "$file"; then
        fix_file "$file"
    fi
done

echo ""
echo "✅ Tous les fichiers ont été corrigés !"
echo "📝 Les originaux sont sauvegardés avec l'extension .bak"
echo ""
echo "🚀 Maintenant, faites :"
echo "   git add ."
echo "   git commit -m 'Fix MDX operators'"
echo "   git push"
