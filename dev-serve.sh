#!/bin/bash
# Development server with proper auto-reload for i18n structure

echo "🚀 Starting MkDocs development server with auto-reload..."
echo "📝 Watching: docs/en/, docs/zh/, mkdocs.yml, docs/stylesheets/, docs/javascripts/"
echo "🌐 Open: http://127.0.0.1:8000"
echo ""

# Run mkdocs serve with explicit watch paths
mkdocs serve \
  --watch docs/en \
  --watch docs/zh \
  --watch docs/stylesheets \
  --watch docs/javascripts \
  --livereload
