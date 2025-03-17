# Generate Code Syntax Highlighting stylesheets, prefixed with the proper light/dark mode classes

DARK=syntax-dark.css;
LIGHT=syntax-light.css;

hugo gen chromastyles --style=modus-vivendi | sed -e 's/^/.dark /' > $DARK;
hugo gen chromastyles --style=pygments | sed -e 's/^/body:not(.dark) /' > $LIGHT;
