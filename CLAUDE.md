# LeakIX Sponsor Page

A simple static sponsor/donation page for LeakIX displaying cryptocurrency
addresses.

## Project Structure

```
sponsor/
├── frontend/           # Static frontend files
│   ├── index.html      # Main HTML page
│   ├── css/            # Compiled CSS (generated)
│   ├── scss/           # SCSS source files
│   │   ├── _variables.scss  # Theme variables from hugo-leakix-dark
│   │   └── style.scss       # Main styles
│   └── images/         # Static images (logo)
├── data/
│   └── crypto.yaml     # Cryptocurrency addresses (source of truth)
├── Makefile            # Build and development commands
├── package.json        # npm dependencies (Prettier, Sass)
└── .prettierrc         # Prettier configuration
```

## Theme

Colors and styling based on
[hugo-leakix-dark](https://github.com/LeakIX/hugo-leakix-dark):

- Primary: #fab741 (golden yellow)
- Background: #090e15 (dark blue)
- Cards: #1f2731
- Font: Roboto Mono

## Commands

```bash
make help           # Show all available commands
make install        # Install npm dependencies
make build          # Build CSS from SCSS
make serve          # Build and serve on localhost:3000
make watch          # Watch SCSS for changes
make format         # Format code with Prettier
make format-check   # Check formatting
```

## Deployment

Deployed automatically to GitHub Pages via `.github/workflows/deploy.yml` on
push to main.

## Related Issues

- [LeakIX/zcash-web-wallet#210](https://github.com/LeakIX/zcash-web-wallet/issues/210) -
  Original issue
- [#1](https://github.com/LeakIX/sponsor/issues/1) - Add Stripe payment link
