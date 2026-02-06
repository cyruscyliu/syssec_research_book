# A Journey to System Security

A comprehensive open-source book about system security research, philosophy, and practice.

## 📚 About

This book provides a complete guide to navigating the world of system security research, from understanding why we choose this challenging field to mastering the art of research, presentation, and technology transfer.

**语言支持 / Language Support:** This book supports both English and Chinese (中文) with proper font rendering in both web and PDF formats.

## 🚀 Quick Start

### Prerequisites

- Python 3.8 or higher
- pip (Python package installer)

### Installation

1. Clone this repository:
```bash
git clone https://github.com/yourusername/syssec-research-book.git
cd syssec-research-book
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

### Local Development

Serve the book locally with live reload:
```bash
./dev-serve.sh
```

Then open [http://127.0.0.1:8000](http://127.0.0.1:8000) in your browser.

### Build Static Site

Generate the static HTML site:
```bash
mkdocs build
```

The site will be generated in the `site/` directory.

## 📄 Generate PDF

### Method 1: Using mkdocs-with-pdf plugin

Generate PDF along with the site build:
```bash
ENABLE_PDF_EXPORT=1 mkdocs build
```

The PDF will be generated at `site/pdf/journey-to-system-security.pdf`

### Method 2: Standalone PDF (without building site)

You can also generate just the PDF:
```bash
ENABLE_PDF_EXPORT=1 mkdocs build --no-directory-urls
```

### Method 3: Using Pandoc (Alternative)

For a simpler LaTeX-based PDF:
```bash
# Install pandoc first: sudo apt install pandoc texlive-xetex
pandoc docs/index.md docs/p*.md -o journey-to-system-security.pdf \
  --pdf-engine=xelatex \
  --toc \
  --toc-depth=2 \
  -V geometry:margin=1in \
  -V documentclass=book
```

## 🌐 Deployment

### GitHub Pages

Deploy to GitHub Pages:
```bash
mkdocs gh-deploy
```

### Custom Server

Upload the `site/` directory to your web server after building.

## 🛠️ Customization

### Update Author Information

Edit `mkdocs.yml` and update:
- `site_author`
- `copyright`
- `repo_url`
- Social links in `extra.social`

### Customize Theme Colors

Edit the `theme.palette` section in `mkdocs.yml` to change colors:
- `primary`: Primary color
- `accent`: Accent color

Available colors: red, pink, purple, deep purple, indigo, blue, light blue, cyan, teal, green, light green, lime, yellow, amber, orange, deep orange

## 📝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

[Add your license here]

## 🙏 Acknowledgments

*"We choose system security not because it is easy, but precisely because it is hard."*

---

Built with [MkDocs](https://www.mkdocs.org/) and [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
