import type { ReactNode } from 'react';

export const metadata = {
  title: 'RideNow — Rider',
  description: 'RideNow rider web app',
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
