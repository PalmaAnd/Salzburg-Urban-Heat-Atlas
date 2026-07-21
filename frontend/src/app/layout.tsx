import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Salzburg Urban Heat Atlas",
  description: "Frontend workspace for Salzburg Urban Heat Atlas.",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
