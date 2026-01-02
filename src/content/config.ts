import { defineCollection, z } from 'astro:content';

const coursCollection = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    description: z.string().optional(),
    order: z.number().optional(),
    duration: z.string().optional(),
    difficulty: z.enum(['débutant', 'intermédiaire', 'avancé']).optional(),
    tags: z.array(z.string()).optional(),
  }),
});

const exercicesCollection = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    description: z.string().optional(),
    order: z.number().optional(),
    duration: z.string().optional(),
    difficulty: z.enum(['débutant', 'intermédiaire', 'avancé']).optional(),
    tags: z.array(z.string()).optional(),
  }),
});

const projetsCollection = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    description: z.string().optional(),
    order: z.number().optional(),
    duration: z.string().optional(),
    difficulty: z.enum(['débutant', 'intermédiaire', 'avancé']).optional(),
    tags: z.array(z.string()).optional(),
  }),
});

export const collections = {
  'cours': coursCollection,
  'exercices': exercicesCollection,
  'projets': projetsCollection,
};