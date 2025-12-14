import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  // Must match the repository name for GitHub Pages:
  base: "/KCF/",
  plugins: [react()],
})
