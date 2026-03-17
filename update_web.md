# How to update the lecture website

## One-time setup (per repo)

1. Go to `github.com/suneman/socialdata2026` → **Settings** → **Pages**
2. Set source to **"Deploy from a branch"** → **`main`** → **`/docs`**
3. Make sure `jupyter nbconvert` is installed (`pip install nbconvert`)

## Updating the HTML

```bash
./build_html.sh
git add docs
git commit -m "update lecture HTML"
git push
```

That's it. After a minute or so the changes will be live at:

- **Index:** `https://suneman.github.io/socialdata2026/`
- **Lectures:** `https://suneman.github.io/socialdata2026/lectures/Week2.html` (etc.)

## Notes

- The script converts all `lectures/*.ipynb` and generates a simple index page in `docs/`
- Your existing site at `suneman.github.io` is not affected — project Pages are served under `/socialdata2026/`
- If you add new notebooks, just re-run the script — they'll appear automatically
