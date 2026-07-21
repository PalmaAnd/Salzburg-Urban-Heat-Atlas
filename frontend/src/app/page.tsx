import { MapPreview } from "@/components/MapPreview";
import styles from "./page.module.css";

export default function Home() {
  return (
    <div className={styles.page}>
      <header className={styles.header}>
        <h1>Salzburg Urban Heat Atlas</h1>
        <p>Next.js + TypeScript baseline with MapLibre-ready map workspace.</p>
      </header>

      <main className={styles.main}>
        <aside className={styles.sidebar}>
          <h2>Initial Layout</h2>
          <ul>
            <li>Map panel for geospatial visualization</li>
            <li>Sidebar for filters and layer controls</li>
            <li>Header area for project context</li>
          </ul>
        </aside>

        <section className={styles.mapSection}>
          <MapPreview className={styles.mapCanvas} />
        </section>
      </main>
    </div>
  );
}
