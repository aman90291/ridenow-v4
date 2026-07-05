import type { ReactNode } from 'react';

export const metadata = {
  title: 'RideNow — Driver',
  description: 'RideNow driver web app',
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
