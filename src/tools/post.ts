import dayjs from 'dayjs';
import type { MarkdownInstance, Post } from '@Models/GeneralTypes';

export function sortPostByDate(posts: MarkdownInstance<Post>[]) {
  return posts.sort(
    (a, b) =>
      dayjs(b.frontmatter.date).valueOf() - dayjs(a.frontmatter.date).valueOf()
  );
}
