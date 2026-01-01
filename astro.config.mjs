import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import tailwind from '@astrojs/tailwind';

const isTeacherSite = process.env.PUBLIC_SITE_MODE === 'teacher';

export default defineConfig({
  site: isTeacherSite 
    ? 'https://python-teach-ekm.netlify.app'
    : 'https://python-learn-ekm.netlify.app',
  
  integrations: [
    mdx(),
    tailwind()
  ],
  
  markdown: {
    shikiConfig: {
      theme: 'github-dark-dimmed',
      langs: ['python', 'bash', 'javascript'],
      wrap: true
    }
  }
});