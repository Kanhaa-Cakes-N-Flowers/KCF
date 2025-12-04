import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  // Must match the repository name for GitHub Pages:
  // https://Vaibh607.github.io/Shop2ndRepo  ->  base: "/Shop2ndRepo/"
  base: "/Shop2ndRepo/",
  plugins: [react()],
})
