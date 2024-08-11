import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// https://vitejs.dev/config/
export default defineConfig({
  base: './',
  define: {
    global: "window",
  },
  build: {
    outDir: 'build',
  },
  optimizeDeps: {
    esbuildOptions: {
      mainFields: ["module", "main"],
      resolveExtensions: [".js", ".jsx"],
    },
  },
  server: {
    port: 3000,
    open: true,
  },
  plugins: [react()],
});
