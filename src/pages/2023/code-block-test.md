---
layout: '../../layouts/BlogPost.astro'
title: 2023 astro code block test
date: 2023-02-03 13:35:22
categories:
  - markdown
---

## markdown code block test

### css

```css
a {
  text-decoration: none;
  transition: text-decoration 0.2s ease;
}

a:hover {
  text-decoration: underline;
}
```

### json

```json
{
  "scripts": {
    "dev": "make dev",
    "build": "make build",
    "preview": "make preview",
    "deploy": "make deploy"
  }
}
```

### makefile

```makefile
include .env

# open vite dev server
.PHONY: dev
dev:
    npx vite

# build vite app with production setting
.PHONY: build
build:
    npx tsc && npx vite build

# preview build result locally
.PHONY: preview
preview:
    npx vite preview

# remove build folder and its content
.PHONY: clean
clean:
    rm -rf $(VITE_BUILD_OUTDIR)

# deploy build result to gitHub repo as branch "gh-pages"
.PHONY: deploy
deploy: build
    cd $(VITE_BUILD_OUTDIR) && \
    git init && \
    git remote -v | grep -w origin || git remote add origin git@github.com:<GitHub Account>/<GitHub Repository Name>.git && \
    git branch -m gh-pages && \
    git add -A && \
    git commit -m "[feat] deploy as gh-pages `date +'%Y-%m-%d %H:%M:%S'`" && \
    git push -u origin gh-pages -f
```

### tsx

```tsx
import React, { memo } from 'react';
import Typography from '@mui/material/Typography';
import { StyledEngineProvider } from '@mui/material/styles';
import './style.css';

function Demo(): React.ReactElement {
  /* Main */
  return (
    <StyledEngineProvider injectFirst>
      <Typography variant="h1" className="inject_style">
        Typography h1 with <code>injectFirst</code>
      </Typography>
    </StyledEngineProvider>
  );
}

export default memo(Demo);
```

### typescript

```ts
function handleArrayUnshift(elem: number, arr: number[]): number[];
function handleArrayUnshift(elem: string, arr: string[]): string[];
function handleArrayUnshift(
  elem: number | string,
  arr: Array<number | string>
): Array<number | string> {
  return [elem, ...arr];
}

console.log(handleArrayUnshift(1, [2, 3, 4]));
console.log(handleArrayUnshift('hello', ['world']));

/*
下面這行會報錯
No overload matches this call.
  Overload 1 of 2, '(elem: number, arr: number[]): number[]', gave the following error.
    Argument of type 'string' is not assignable to parameter of type 'number'.(2769)
*/
console.log(handleArrayUnshift('no way', [1, 2, 3]));
```
