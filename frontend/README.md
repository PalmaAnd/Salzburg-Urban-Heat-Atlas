# Frontend

Next.js frontend for the Salzburg Urban Heat Atlas.

## Stack

- Next.js (App Router)
- React
- TypeScript
- MapLibre GL JS

## Development

```bash
npm install
npm run dev
```

Open [http://localhost:3000](http://localhost:3000).

## Scripts

```bash
npm run dev
npm run lint
npm run build
npm run start
```

## Docker

From the repository root, run the full stack:

```bash
docker compose up --build
```

Frontend is available at [http://localhost:3000](http://localhost:3000).

## Initial layout

The initial page provides:

- a project header,
- a sidebar area for upcoming filters/layer controls,
- and a MapLibre-powered map panel ready for data layers.
