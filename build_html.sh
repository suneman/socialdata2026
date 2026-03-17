#!/bin/bash
#
# Convert lecture notebooks to HTML for GitHub Pages.
# Run this whenever you want to update the published HTML.
#
# Usage:  ./build_html.sh
#

set -e

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"
DOCS_DIR="$REPO_ROOT/docs"
LECTURES_DIR="$REPO_ROOT/lectures"

# Clean and recreate output directory
rm -rf "$DOCS_DIR/lectures"
mkdir -p "$DOCS_DIR/lectures"

# Convert notebooks to HTML
echo "Converting notebooks..."
jupyter nbconvert --to html "$LECTURES_DIR"/*.ipynb --output-dir "$DOCS_DIR/lectures/"
echo "Done."

# Generate index page
echo "Generating index page..."
cat > "$DOCS_DIR/index.html" << 'HTMLEOF'
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Social Data Analysis 2026</title>
  <style>
    body { font-family: system-ui, sans-serif; max-width: 700px; margin: 2em auto; padding: 0 1em; }
    h1 { margin-bottom: 0.3em; }
    ul { line-height: 1.8; }
    a { color: #0366d6; }
  </style>
</head>
<body>
  <h1>Social Data Analysis 2026</h1>
  <h2>Lectures</h2>
  <ul>
HTMLEOF

for f in "$DOCS_DIR"/lectures/*.html; do
  name=$(basename "$f" .html)
  echo "    <li><a href=\"lectures/$(basename "$f")\">$name</a></li>" >> "$DOCS_DIR/index.html"
done

cat >> "$DOCS_DIR/index.html" << 'HTMLEOF'
  </ul>
</body>
</html>
HTMLEOF

echo "Built HTML in docs/. Commit and push to publish."
