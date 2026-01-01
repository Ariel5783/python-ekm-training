import { defineCollection, z } from 'astro:content';

const coursCollection = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    level: z.array(z.string()),
    type: z.literal('cours'),
    objectifs: z.array(z.string()).optional(),
    prerequis: z.array(z.string()).optional(),
    duree_estimee: z.string().optional(),
    auteur: z.string().default('Eric MORMIN'),
    updated: z.string(),
    mots_cles: z.array(z.string()).optional(),
  }),
});

const exercicesCollection = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    level: z.array(z.string()),
    type: z.literal('exercices'),
    objectifs: z.array(z.string()).optional(),
    prerequis: z.array(z.string()).optional(),
    duree_estimee: z.string().optional(),
    auteur: z.string().default('Eric MORMIN'),
    updated: z.string(),
    mots_cles: z.array(z.string()).optional(),
    mode_defi: z.boolean().default(false),
  }),
});

const ressourcesCollection = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    level: z.array(z.string()),
    type: z.literal('ressources'),
    auteur: z.string().default('Eric MORMIN'),
    updated: z.string(),
    mots_cles: z.array(z.string()).optional(),
  }),
});

export const collections = {
  cours: coursCollection,
  exercices: exercicesCollection,
  ressources: ressourcesCollection,
};
