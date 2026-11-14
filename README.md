# Skinwalker Hunt

Browser first-person horror hunt (Three.js). Tranquilize 5 deer, survive the Wendigo, keep your sanity. Not every deer is a deer.

## Controls
Desktop: WASD move, mouse look, click fire, 1/2 weapons, R reload, F flashlight, Shift run.
Mobile: left stick move, drag right side to look, on-screen buttons.

## Deploy: GitHub -> Cloudflare
1. `git init && git add . && git commit -m "Skinwalker Hunt"` then push to a new GitHub repo.
2. Cloudflare dashboard -> Workers & Pages -> Create -> Pages -> Connect to Git.
3. Pick the repo. Framework: None. Build command: (empty). Build output directory: `public`.
4. Save and Deploy. (Or run `npx wrangler deploy` using the included `wrangler.jsonc`.)

## Accounts
Sign up / log in is stored in the browser (localStorage, hashed passwords). It is a demo, not secure
and not shared between devices. For real accounts and a global leaderboard, add a Cloudflare Worker + D1.

## Models
`public/deer.glb`, `wendigo.glb`, `forest.glb` are loaded at start. If one fails to load, the game falls back to simple built-in shapes.
Deer and wendigo were converted from the source files into separate body parts (head, arms, legs) that the game animates in code.
Serve over HTTP (`npx serve public`), not by double-clicking the file, or the browser blocks the models.
`assets/cowboy/` holds the rigged Mixamo hunter (FBX) for the multiplayer step. It is not deployed.
Check each model's license and add credits to `CREDITS.md` before publishing.

## Supabase login (optional but recommended)
1. Create a free project at supabase.com. In SQL Editor run `supabase/schema.sql`.
2. Authentication -> Providers: keep Email on. (Turn off "Confirm email" while testing if you want instant sign-in.)
3. Project Settings -> API: copy the Project URL and the anon public key into `public/config.js`.
4. Authentication -> URL Configuration: set Site URL to your Cloudflare Pages address.
With the keys blank, the game uses the browser-only demo login.
